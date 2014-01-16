class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(params[:session])
    if @session.valid?
      login @session.user_id
      redirect_to home_path
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
