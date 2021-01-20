class WithdrawController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def delete
    @user = User.find(params[:id])
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end
end
