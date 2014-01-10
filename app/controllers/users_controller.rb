class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    render :new unless @user.save
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :nick_name)
  end
end
