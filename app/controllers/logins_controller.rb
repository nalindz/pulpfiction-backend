class LoginsController < ApplicationController
  def create
    @user = User.find_or_initialize_by_facebook_id params[:user][:facebook_id]
    @user.update_attributes!(first_name: params[:user][:first_name],
                             last_name:  params[:user][:last_name],
                             email:  params[:user][:email]) if @user.new_record?

    session[:user_id] = @user.id
    render_success user: @user
  end
end
