class UsersController < ApplicationController
  before_filter :load_user, :only => [:update]
  def index
    if params[:id].nil?
      render_success user: current_user.as_json(current_user: true)
    else
      @user = User.find_by_id(params[:id])
      if @user.present?
        render_success user: @user
      else
        render_error
      end
    end
  end

  def update
    @user.username = params[:user][:username]
    if @user.valid?
      @user.confirmed_username = true
      @user.save!
      render_success user: @user
    else
      render_error :unprocessable_entity, @user.errors[:username][0]
    end
  end

  def load_user
    @user = User.find(params[:id])
  end
end
