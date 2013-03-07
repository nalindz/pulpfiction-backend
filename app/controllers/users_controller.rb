class UsersController < ApplicationController
  before_filter :load_user
  def index
    render_success user: @user
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
