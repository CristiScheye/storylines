require 'spec_helper'
require 'database_cleaner'

describe Entry do
  Story.delete_all

  context "when user signed in" do

    before do
      @current_user = User.create!(username: 'Dr. Seuss', email: 'greeneggs@ham.com', password: '1fish2f!sh')
      first_story = Story.create!(title: 'Running', first_entry: "I can't wait to run again")
      by_current = Entry.create!(body: "WWDSD?", story_id: first_story.id, user_id: @current_user.id)
    end


    describe ".previous_by_users_other_than" do

      context "when there are no previous entries by other users" do
        it "returns an empty object" do
          expect(Entry.previous_by_users_other_than(@current_user).size).to eq(0)
        end
      end

      context "when there are previous entries by other users" do
        
        it "returns only previous entries by other users" do
          other_user = User.create!(username: 'Rain', email: 'cloudydays@gmail.com', password: 'pr3cip_4m3')
          second_story = Story.create!(title: 'Winter Olympics', first_entry: 'nbd')
          by_other = Entry.create!(body: "Railsbridge today!", story_id: second_story.id, user_id: other_user.id)

          expect(Entry.previous_by_users_other_than(@current_user)).to match_array([by_other])
        end
      end
    end

  end
end

