class StoriesController < ApplicationController
  def create
    current_user = User.find_by_first_name('Nalin')
    @story = Story.create_with_blocks(current_user, params[:title], params[:text])
    render_success({:story => @story})
  end

  def index
    @stories = Story.all
    render_success(@stories.map {|s| {:story => s}})
  end
end
