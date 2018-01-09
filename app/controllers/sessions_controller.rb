class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in as #{user.first_name}"
      if user.admin?
        redirect_to admin_dashboard_path
      else
        redirect_to dashboard_path

      end
    else
      redirect_to new_user_path
      flash[:warning] = "Something went wrong! Please try again"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
