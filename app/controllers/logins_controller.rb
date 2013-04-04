class LoginsController < ApplicationController
  def create
    @user = User.find_or_initialize_by_facebook_id params[:facebook_id]
    if @user.new_record?
      @user.first_name = params[:first_name]
      @user.last_name = params[:last_name]
      @user.assign_username
      @user.save!
    end
    session[:user_id] = @user.id
    puts @user.inspect
    render_success user: @user.as_json({current_user: true})
  end
end
