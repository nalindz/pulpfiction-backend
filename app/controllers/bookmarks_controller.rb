class BookmarksController < ApplicationController
  def show
    @bookmarks = current_user.bookmarks.order("updated_at DESC")
    render_success @bookmarks.map {|h| {:bookmark => b }}
  end

  def create
    @bookmark = current_user.bookmarks.find_or_initialize_by_story_id(params['bookmark']['story_id'])
    @bookmark.update_attributes({
      page_number: params['bookmark']['page_number'],
      font_size: params['bookmark']['font_size']
    })
    render_success({:bookmark => @bookmark})
  end
end
