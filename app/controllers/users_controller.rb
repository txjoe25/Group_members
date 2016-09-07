class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
     user = User.new(user_params)
    if user.save
     session[:user_id] = user.id
     redirect_to "/groups"
    else
     puts user.errors.messages
     redirect_to :back
    end
  end

  def update
  end

  def destroy
  end
  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:password, :password_confirmation)  
  end
end
