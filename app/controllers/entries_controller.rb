class EntriesController < ApplicationController
  before_action :authenticate_user!

  def create

    @story = Story.find(params[:story_id])
    @entry = @story.entries.build(params.require(:entry).permit(:body, :user_id))

    if @entry.save
      flash[:success] = 'Your entry was saved. Write another!'
      redirect_to Story.rand_unfinished
    else
      render 'stories/show', error: 'Hmmm... Something went wrong. Your entry was not saved.'
    end
  end
end