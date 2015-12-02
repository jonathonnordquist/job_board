class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  before_action :correct_user, only: [:show]
  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your account has been created"
      log_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def require_login
      unless logged_in?
        flash[:error] = "Please log in to access this page"
        redirect_to login_path
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless @user == current_user
    end
end
