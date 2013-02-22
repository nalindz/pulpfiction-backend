class StoryViewsController < ApplicationController
  def create
    @story_view = StoryView.create! user_id: current_user.id, story_id: params[:story_id]
    render_success
  end
end
