class WithdrawController < ApplicationController
  include Common
  before_action :user_confirmation, only: [:delete]

  def show
    @user = User.find(params[:id])
  end

  def delete
    @user = User.find(params[:id])
    @user.update(is_active: false)
    
    deletePost(@user)
    deleteComment(@user, "user")
    reset_session
    redirect_to root_path
    flash[:notice] = '投稿に成功しました。'
  end

  private
  def user_confirmation
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      flash[:alert] = "退会は登録ユーザーのみです。"
      redirect_back(fallback_location: root_path)
    end
  end
end
