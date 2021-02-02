class HomeController < ApplicationController
  def index
    @posts = Post.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
  end
end
