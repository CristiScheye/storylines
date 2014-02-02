class StoriesController < ApplicationController

  def index
    @stories = Story.finished_stories
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(params.require(:story).permit(:title, :first_entry))
    @story.user_id = 1 #Change this later!!!

    if @story.save
      flash[:success] = 'Your story was successfully saved'
      redirect_to :root
    else
      flash[:error] = 'Something went wrong and your story was NOT saved!'
      render :new
    end

  end

end