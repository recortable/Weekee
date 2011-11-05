class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    tuid = auth['provider'] == 'twitter' ? auth['uid'] : ''
    user = User.find_by_tuid(tuid)
    if user
      user.update_attributes(last_login_at: Time.now, login_count: user.login_count + 1)
      session[:user_id] = user.id
      redirect_to root_path
    end
  end
end