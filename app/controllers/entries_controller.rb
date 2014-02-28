class EntriesController < ApplicationController
  before_action :authenticate_user!

  def create
    @story = Story.find(params[:story_id])
    @entry = Entry.new(params.require(:entry).permit(:body, :user_id, :story_id))

    if @entry.save
      flash[:success] = 'Your entry was saved. Write another!'
      redirect_to unfinished_story_path
    else
      flash[:alert] = 'Hmmm... Something went wrong. Your entry was not saved.'
      render 'stories/show'
    end
  end
end