class UnfinishedStoriesController < ApplicationController
  def show
    if user_signed_in?
      random_story = Story.for_users_other_than(current_user).unstarted.sample || Story.for_prev_entries_not_by(current_user).unfinished.sample 
    else
      random_story = Story.unfinished.sample
    end

    if random_story.nil?
      flash[:notice] = "Sorry, no unfinished stories to add to right now. Would you like to start a new one?"
      redirect_to new_story_path
    else
      redirect_to random_story
    end
  end
end