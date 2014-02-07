require "spec_helper"

describe Story do
  describe ".finished_stories" do
    it "returns all the finished stories" do
      finished_story = Story.create!(title: 'Testing with rspec', first_entry: 'Holler')
      5.times {finished_story.entries.create!(body: 'First entry')}

      unstarted_story = Story.create!(title: 'Testing with rspec Part deux', first_entry: 'Fail.')
      unfinished_story = Story.create!(title: 'Testing with rspec Part trois', first_entry: 'Wat.')
      unfinished_story.entries.create!(body: 'First entry')

      expect(Story.finished_stories).to eq([finished_story])
    end
  end

  describe ".unfinished" do
    it "returns unfinished stories" do
      unfinished_story = Story.create!(title: 'Once upon a time', first_entry: 'whatever')
      unfinished_story.entries.create!(body: 'Geese are a great alarm clock')

      expect(Story.unfinished).to eq([unfinished_story])
    end
  end

  describe ".unstarted" do
    it "returns unstarted stories" do
      unstarted_story = Story.create!(title: 'The best pizza ever', first_entry: 'ugh')

      expect(Story.unstarted).to eq([unstarted_story])
    end
  end
end
