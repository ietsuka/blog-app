class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password]) && withdraw_user(user)
      log_in user
      redirect_to controller: :mypage, action: :show, id: user.id
    else
      flash[:alert] = '正しいメールアドレス、パスワードを入力してください。'
      redirect_back(fallback_location: root_path)
    end
  end

  def delete
    log_out if logged_in?
    redirect_to root_url
  end
end
