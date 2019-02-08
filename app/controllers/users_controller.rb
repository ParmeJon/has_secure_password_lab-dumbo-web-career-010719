class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    # byebug
    @user = User.new(user_params)
    if !@user.save
      redirect_to controller: 'users', action: 'new'
    else
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
