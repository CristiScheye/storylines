require 'spec_helper'

describe UnfinishedStoriesController do

  describe "GET #show" do

    context "when user logged in" do

      let(:current_user) do
        User.create!(username: 'Dr. Seuss', email: 'greeneggs@ham.com', password: '1fish2f!sh')
      end

      before do
        sign_in current_user
      end

      context "when there is an unfinished story for another user" do 
        it "redirects to that story" do
          another_user = User.create!(username: 'Dude Looks Like a Lady', email: 'somebody@email.com', password: 'password')
          unfinished_story = Story.create!(title: 'Once upon a time', first_entry: 'whatever', user_id: another_user.id)
          unfinished_story.entries.create!(body: 'Geese are a great alarm clock')
          get :show
          expect(response).to redirect_to(unfinished_story)
        end

      end

      context "when there is an unfinished story for current user" do
        it "redirects to the new story page" do
          relevant = Story.create!(title: 'The Places You Will Go', first_entry: 'Paris', user_id: current_user.id)
          get :show
          expect(response).to redirect_to(new_story_path)
        end
      end

      context "when there are no unfinished stories" do
        before do
          get :show
        end

        it "redirects to the new story page" do
          expect(response).to redirect_to(new_story_path)
        end

        it "tells the user there are no unfinished stories" do
          expect(flash[:notice]).to eq("Sorry, no unfinished stories to add to right now.")
        end
      end

    end

    context "when no user is logged in" do
      it "redirects to login page" do
        get :show
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end