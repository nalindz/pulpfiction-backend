class StoriesController < ApplicationController
  def create
    current_user = User.find_by_first_name('Nalin')
    @story = Story.create_with_blocks(current_user, params[:title], params[:text])
    render_success({:story => @story})
  end

  def index
    type = params['type']
    if (type == 'feed') 
      render_feed_stories
    elsif (type == 'profile')
      render_profile_stories
    end
  end

  def render_feed_stories
    if (params['query'].nil?)
      @stories = Story.all
    else 
      @stories = Story.search(params['query'])
    end
    render_success(@stories.map {|s| {:story => s}})
  end

  def render_profile_stories
    current_user = User.find_by_first_name('Nalin') # hack
    @stories = current_user.stories
    render_success(@stories.map {|s| {:story => s}})
  end
end
