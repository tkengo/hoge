class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private

  def logged_in?
    return session.key?(:login_user_id) && !session[:login_user_id].nil?
  end

  def login(user_id)
    session[:login_user_id] = user_id
    @cached_logged_in_user = nil
  end

  def logout
    session[:login_user_id] = nil
  end

  def current_user
    if logged_in?
      return @cached_logged_in_user if @cached_logged_in_user
      @cached_logged_in_user = User.find(session[:login_user_id])
    else
      nil
    end
  end
end
