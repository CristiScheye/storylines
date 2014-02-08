require "spec_helper"

describe Story do

  before :each do
    @unfinished_story = Story.create!(title: 'Once upon a time', first_entry: 'whatever')
    @unfinished_story.entries.create!(body: 'Geese are a great alarm clock')
    @unfinished_story.entries.create!(body: 'Men should not wear tights to the gym :/')
    
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

  describe ".previous_entry" do
    it "returns the first entry (by user who started story) if no additional entries have been made" do
      expect(@unstarted_story.previous_entry).to eq('Not gonna happen.')
    end

    it "returns the first entry (by another user) if additional entries have been made" do
      expect(@unfinished_story.previous_entry).to eq('Men should not wear tights to the gym :/')
    end
  end


end
