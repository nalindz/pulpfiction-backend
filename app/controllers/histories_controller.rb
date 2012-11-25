class HistoriesController < ApplicationController
  def show
    @histories = current_user.histories.order("updated_at DESC")
    render_success(@histories.map {|h| {:story => h.story }})
  end

  def create
    @history = current_user.histories.find_or_create_by_story_id(params['story_id'])
    @history.touch
    render_success
  end
end
