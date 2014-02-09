class EntriesController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    @entry = @story.entries.build(params.require(:entry).permit(:user_id, :body))

    if @entry.save
      flash[:success] = 'Your entry was saved'
      redirect_to Story.rand_unfinished
    else
      render 'stories/show', error: 'Your entry was not saved'
    end
  end
end