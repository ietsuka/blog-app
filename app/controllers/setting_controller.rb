require'date'
require 'fileutils'

class SettingController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:user][:user_id])
    profile_thumbnail = params[:user][:profile_thumbnail]
    blog_thumbnail = params[:user][:blog_thumbnail]
    if profile_thumbnail
      if @user.profile_thumbnail?
        FileUtils.rm("public/profile_images/#{params[:user][:user_id]}/#{@user.profile_thumbnail}")
      end
      if !Dir::exist?("public/profile_images/#{params[:user][:user_id]}")
        FileUtils.mkdir_p("public/profile_images/#{params[:user][:user_id]}", :mode => 755)
      end
      profile_thumbnail_name = profile_thumbnail.original_filename
      File.open("public/profile_images/#{params[:user][:user_id]}/#{profile_thumbnail_name}", 'wb') do |f|
        f.write profile_thumbnail.read
      end
      @user.profile_thumbnail = profile_thumbnail_name
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
