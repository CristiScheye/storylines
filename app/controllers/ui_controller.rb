class UiController < ApplicationController
  before_action do
    redirect_to :root if Rails.env.production?
  end
    
  def index
    pages = Dir.glob 'app/views/ui/*'
    @mock_views = pages.map do |filename|
      file = File.basename(filename, '.html.haml')
    end
  end
end
