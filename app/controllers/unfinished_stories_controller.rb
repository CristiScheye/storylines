class UnfinishedStoriesController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    random_story = Story.for_prev_entries_not_by(current_user).unfinished || Story.for_users_other_than(current_user).unfinished
    .sample

    if random_story.nil?
      flash[:notice] = "Sorry, no unfinished stories to add to right now."
      redirect_to new_story_path
    else
      redirect_to random_story
    end
  end
end