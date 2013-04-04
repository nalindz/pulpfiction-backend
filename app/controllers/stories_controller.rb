class StoriesController < ApplicationController
  skip_before_filter :logged_in_required, :only => [:create]
  def create
    user = User.find_by_username(params[:username])
    return render_error :unprocessable_entity, "no user found" if user.nil? 
    return render_error :unprocessable_entity, "incorrect email hash" if user.email_hash.hash_text != params[:email_hash]
    return render_error :unprocessable_entity, "no title" if params[:title].nil?
    return render_error :unprocessable_entity, "no text" if params[:text].nil?

    @story = Story.create_with_blocks(user: user, 
                                      title: params[:title], 
                                      text: params[:text])
    render_success
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
      @stories = Story.paginate(page: params[:page], per_page: 18)
    else 
      @stories = Story.search params['query'], page: params[:page], per_page: 18
    end
    render_stories(@stories)
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

