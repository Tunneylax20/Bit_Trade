class UsersController < ApplicationController

before_action :load_user, only: [:show, :edit]
### authenticate and authorize users for edit and update ###
before_action :authenticate, :authorize, only: [:edit, :update]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render(:new)
    end
  end

  def show
  end

  private

  def load_user
    return @user = User.find(params[:id])
  end

### reflects sign up form ###
  def user_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation)
  end

  def authenticate
    unless logged_in?
      redirect_to login_path
    end
  end

  def authorize
    unless current_user == @user
      redirect_to login_path
    end
  end

end