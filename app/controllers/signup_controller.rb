class SignupController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to "/mypage/user/#{@user.id}"
    else
      render "new"
    end
  end

  def user_params
    params.require(:user).permit(:name, :blog_name, :email, :password, :password_confirmation)
  end
end
