class LoginsController < ApplicationController
  def create
    @user = User.find_or_create_by_facebook_id params[:facebook_id]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.assign_username
    @user.save!
    session[:user_id] = @user.id
    puts @user.inspect
    render_success user: @user
  end
end
