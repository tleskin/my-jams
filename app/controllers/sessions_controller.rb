class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id # this is IMPORTANT, creates key value pair
      redirect_to user
    else
      flash[:errors] = "Invalid login."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Successfully logged out."
    redirect_to login_path
  end
end
