class MypageController < ApplicationController
  def show
    @user = User.find(params[:id])
    @contents = @user.contents.order(created_at: :desc).page(params[:page]).per(5)
  end
end
