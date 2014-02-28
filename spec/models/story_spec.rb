require "spec_helper"

describe Story do

  before :each do
    @current_user = User.create!(username: 'Dude Looks Like a Lady', email: 'somebody@email.com', password: 'password')
    @unfinished_story = Story.create!(title: 'Once upon a time', first_entry: 'whatever', user_id: @current_user.id)
    @unfinished_story.entries.create!(body: 'Geese are a great alarm clock')
    @unfinished_story.entries.create!(body: 'Men should not wear tights to the gym :/')
    
    other_user = User.create!(username: 'Hello', email: 'other@gmail.com', password: 'original')
    @unstarted_story = Story.create!(title: 'Nope.', first_entry: 'Not gonna happen.', user_id: other_user.id)
    
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

  describe ".previous_entry" do
    it "returns the first entry (by user who started story) if no additional entries have been made" do
      expect(@unstarted_story.previous_entry).to eq('Not gonna happen.')
    end

    it "returns the first entry (by another user) if additional entries have been made" do
      expect(@unfinished_story.previous_entry).to eq('Men should not wear tights to the gym :/')
    end
  end

  describe ".for_users_other_than" do
    it "returns the other users stories" do
      expect(Story.for_users_other_than(@current_user)).to_not include(@unfinished_story)
    end
  end


end
