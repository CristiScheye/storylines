class EntriesController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    @story.finished = true if params[:story_status] == '1'

    @entry = Entry.new(entry_params)
    @entry.user_id = current_user.id if user_signed_in?

    if @entry.save
      @story.save #save in case status changed
      flash[:success] = 'Your entry was saved. Write another!'
      redirect_to unfinished_story_path
    else
      flash[:alert] = 'Hmmm... Something went wrong. Your entry was not saved.'
      render 'stories/show'
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:body, :story_id, :author_name)
  end
end