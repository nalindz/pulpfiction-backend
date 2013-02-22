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
    elsif (type == 'bookmarks')
      render_bookmarked_stories
    end
  end

  def update
    @story = Story.update(params[:id], tags: params[:story][:tags])
    render_success story: @story
  end

  def render_feed_stories
    if (params['query'].nil?)
      @stories = Story.all # TODO this needs to be fixed with some feed logic
    else 
      @stories = Story.search(params['query'])
    end
    render_stories(@stories)
#    render_success(@stories.map {|s| {:story => s}})
  end

  def render_profile_stories
    @stories = current_user.stories
    @stories = @stories.search(params['query']) unless params['query'].nil?
    render_success(@stories.map {|s| {:story => s}})
  end

  def render_bookmarked_stories
    @stories = current_user.bookmarks.order("updated_at DESC").map {|b| b.story }
    render_success(@stories.map {|s| {:story => s}})
  end

  def render_stories(stories)
    render_success @stories.map {|s| {story: s.as_json({current_user: current_user})}}
  end
end

