class PostsController < ApplicationController
  before_action :user_confirmation, only: [:edit, :update, :destroy]

  def new 
    @post = Post.new
  end

  def create
    current_user.present? ? @post = current_user.posts.build(post_params) : @post = Post.new(post_params)
    if @post.save
      flash[:notice] = '投稿に成功しました。'
      redirect_to controller: :home, action: :index
    else
      flash[:alert] = '投稿に失敗しました。'
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = '更新に成功しました。'
      redirect_to controller: :home, action: :index
    else
      flash[:alert] = '更新に失敗しました。'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy!
      flash[:notice] = '削除しました。'
      redirect_to controller: :home, action: :index
    else
      flash[:alert] = '削除に失敗しました。'
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :article, :post_image)
  end

  def user_confirmation
    @post = Post.find(params[:id])
    unless current_user.id == @post.user_id
      flash[:alert] = "記事編集は投稿者のみです。"
      redirect_back(fallback_location: root_path)
    end
  end
end
