require'date'
require 'fileutils'

class SettingController < ApplicationController
  include Common

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:user][:user_id])
    profile_thumbnail = params[:user][:profile_thumbnail]
    blog_thumbnail = params[:user][:blog_thumbnail]
    if profile_thumbnail
      @user.profile_thumbnail = registFile(@user, "profile_images", profile_thumbnail)
    end
      @user.birthday = birthday_join
      @user.profile = params[:user][:profile]
    if @user.save
      redirect_back(fallback_location: root_path)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_id, :profile, :birthday, :profile_thumbnail)
  end

  def birthday_join
    date = params[:user]
    Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
  end
end
