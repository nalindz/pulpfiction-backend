class UsersController < ApplicationController
  def index
    if (params[:id].nil? && params[:facebook_id].nil?)
      @users = User.all
      render_success(@users.map {|u| {:user => u}})
    elsif (!params[:id].nil?)
      @user = User.find_by_id(params[:id])
      render_success({:user => @user})
    elsif (!params[:facebook_id].nil?)
      @user = User.where("facebook_id = ?",params[:facebook_id]).first
      if (@user.nil?)
         @newUser = User.create(:first_name => params[:first_name],
                     :last_name => params[:last_name], 
                     :facebook_id => params[:facebook_id], 
                     :email => params[:email]) 
         @user = @newUser 
      end
      render_success({:user => @user})
    end
    
  end
end