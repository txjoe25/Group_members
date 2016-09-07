class SessionsController < ApplicationController
  def index
  end

  def create
	  	user = User.find_by(:email => params[:email])
	  if user && user.authenticate(params[:password])
	   session[:user_id] = user.id
	   redirect_to "/groups"
	  else
	   redirect_to :back
	  end
  end

  def destroy
 	session.destroy
 	redirect_to '/main'
  end
end
