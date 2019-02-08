class SessionsController < ApplicationController
  def new
    session.delete :user_id
    @user = User.new
    render :login
  end

  def create

    @user = User.find_by(name: params[:user][:name])

    if @user != nil
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to login_path
      else
        redirect_to login_path
      end
    else
      redirect_to new_user_path
    end

  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end


end
