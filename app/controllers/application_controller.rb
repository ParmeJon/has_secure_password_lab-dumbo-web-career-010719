class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_logged_in, only: [:home]

  def home
    @user = User.find(session[:user_id])
    render :home
  end

  def require_logged_in
    if session[:user_id] == nil
      redirect_to(controller: 'sessions', action: 'new' )
    end
  end
end
