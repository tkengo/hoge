class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private

  def logged_in?
    return session.key?(:login_user_id) && !session[:login_user_id].nil?
  end

  def login(user_id)
    session[:login_user_id] = user_id
  end

  def logout
    session[:login_user_id] = nil
  end

  def current_user
    logged_in? ? User.find(session[:login_user_id]) : nil
  end
end
