class ApplicationController < ActionController::Base
  respond_to :json
  #before_filter :logged_in_required 

  def current_user
#    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user = User.find_by_username('jellosea')
  end 

  def logged_in_required
    unless current_user
      return render_error(:forbidden)
    end 
  end 

  def render_success(options = {}) 
    render :status => :ok, :json => options
  end 

  def render_error(status, error_message = nil)
    error_code = { 
      :forbidden => {:code => 403, :description => "Unauthorized"},
      :server_error => {:code => 500, :description => "Internal Server Error"}
    }   
    error_obj = error_code[status]
    error_obj[:description] = error_message unless error_message.blank?
    render :status => status, :json => {:error => error_obj}
  end 

private
  helper_method :current_user
end
