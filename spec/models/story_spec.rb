require "spec_helper"

describe Story do

  before :each do
    @unfinished_story = Story.create!(title: 'Once upon a time', first_entry: 'whatever')
    @unfinished_story.entries.create!(body: 'Geese are a great alarm clock')
    
    @unstarted_story = Story.create!(title: 'Nope.', first_entry: 'Not gonna happen.')
    
    @finished_story = Story.create!(title: 'This again?', first_entry: 'Oh noes!')
    5.times {@finished_story.entries.create!(body: 'Repeat!')}

  end

  describe ".finished_stories" do
    it "returns all the finished stories" do
      expect(Story.finished_stories).to eq([@finished_story])
    end
  end

  describe ".unfinished" do
    it "returns unfinished stories" do
      expect(Story.unfinished).to eq([@unfinished_story, @unstarted_story])
    end
  end

  describe ".rand_unfinished" do 
    it "returns an unfinished or unstarted story" do
      expect([@unfinished_story, @unstarted_story]).to include(Story.rand_unfinished)
    end
  end


end
