class BookmarksController < ApplicationController
  def create
    @bookmark = current_user.bookmarks.find_or_initialize_by_story_id(params['bookmark']['story_id'])
    @bookmark.update_attributes({
      page_number: params['bookmark']['page_number'],
      font_size: params['bookmark']['font_size']
    })
    render_success({:bookmark => @bookmark})
  end

  def destroy
    puts 'meow', params.inspect
    @bookmark = current_user.bookmarks.where(story_id: params[:story_id]).destroy_all
    render_success
  end
end
