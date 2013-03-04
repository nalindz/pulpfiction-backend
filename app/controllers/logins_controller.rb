class LoginsController < ApplicationController
  def create
    @user = User.find_or_create_by_facebook_id params[:facebook_id]
    session[:user_id] = @user.id
    render_success user: @user
  end
end
