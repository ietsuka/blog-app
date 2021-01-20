class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) && withdraw_user(user)
      log_in user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def delete
    log_out if logged_in?
    redirect_to root_url
  end
end
