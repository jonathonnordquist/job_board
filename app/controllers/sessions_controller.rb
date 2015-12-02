class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
  private
    def require_login
      unless logged_in?
        flash[:error] = "Please log in to access this page"
        redirect_to login_path
      end
    end
end
