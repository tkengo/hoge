module Authenticationable
  extend ActiveSupport::Concern

  included do
    before_filter :authentication
  end

  private

  def authentication
    unless logged_in?
      if request.xhr?
        render json: { authenticate: false } and return
      else
        redirect_to signin_path and return
      end
    end
  end
end
