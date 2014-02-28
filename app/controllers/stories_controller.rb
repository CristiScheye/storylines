class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create]

  def index
    @stories = Story.finished_stories
  end

  def show
    @story = Story.find(params[:id])

    if @story.finished?
      redirect_to stories_path
    else
      @entry = Entry.new
    end

  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(params.require(:story).permit(:title, :first_entry))
    @story.user_id = current_user.id

    if @story.save
      flash[:success] = 'Your story was successfully saved'
      redirect_to :root
    else
      flash[:error] = 'Something went wrong and your story was NOT saved!'
      render :new
    end

  end

end