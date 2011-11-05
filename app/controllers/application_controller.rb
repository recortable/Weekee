class ApplicationController < ActionController::Base
  protect_from_forgery

  expose(:space) { Space.first }

  protected
  def require_user
    redirect_to new_session_path if session[:user_id].blank?
  end

end
