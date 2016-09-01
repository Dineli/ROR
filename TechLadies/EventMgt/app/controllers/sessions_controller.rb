class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to event_index_path
    else
      flash[:danger] = "User Name/Password incorrect. Please re-try!"
      redirect_to '/login' 
    end
  end

  def destroy
  	session[:user_id] = nil
    flash[:success] = "You have logged out successfully!"
    redirect_to '/login'
  end

end
