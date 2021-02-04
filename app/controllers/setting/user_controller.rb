require'date'

class Setting::UserController < ApplicationController
  include Common

  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    @user.birthday = birthday_join
    if @user.save
      redirect_back(fallback_location: root_path, notice: '編集に成功しました。')
    else
      render controller: :setting, action: :show, alert: '編集に失敗しました。'
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile, :birthday, :user_image)
  end

  def birthday_join
    date = params[:user]
    Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
  end
end
