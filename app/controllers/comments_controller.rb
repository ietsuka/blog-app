class CommentsController < ApplicationController
  before_action :user_confirmation, only:[:update, :destroy]

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.find(params[:comment][:post_id])
    new_comments = @post.comments.build(comment_params)
    if new_comments.save
      redirect_back(fallback_location: root_path, notice: '投稿に成功しました。')
    else
      render 'posts/show', alert: '編集に失敗しました。'
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update_attributes(comment_params)
      redirect_back(fallback_location: root_path, notice: '編集に成功しました。')
    else
      redirect_back(fallback_location: root_path, alert: '編集に失敗しました。')
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      redirect_back(fallback_location: root_path, notice: '削除に成功しました。')
    else
      redirect_back(fallback_location: root_path, alert: '削除に失敗しました。')
    end
  end

private
  def comment_params
    params.require(:comment).permit(:name, :comment)
  end

  def user_confirmation
    @comment = Comment.find(params[:id])
    unless current_user.id == @comment.post.user_id
      flash[:alert] = "コメント編集は記事の投稿者のみです。"
      redirect_back(fallback_location: root_path)
    end
  end
end
