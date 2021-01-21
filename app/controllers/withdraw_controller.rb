class WithdrawController < ApplicationController
  include Common
  def show
    @user = User.find(params[:id])
  end

  def delete
    @user = User.find(params[:id])
    @user.update(is_valid: false)
    
    deleteFile(@user, "user")
    deleteContent(@user)
    deleteComment(@user, "user")
    reset_session
    redirect_to root_path
  end
end
