class StoriesController < ApplicationController

  def index
    @stories = Story.finished_stories
  end

  def show
    @story = Story.rand_unfinished

    if @story.finished?
      redirect_to stories_path
    else
      @previous_entry = @story.previous_entry
      @entry = Entry.new
    end

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