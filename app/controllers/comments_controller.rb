class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def create
    content = Content.find(params[:comment][:content_id])
    @content = Content.find(params[:comment][:content_id])
    @comment = Comment.new
    @comments = @content.comments
    @new_comments = content.comments.build(comment_params)
    if @new_comments.save
      redirect_back(fallback_location: root_path)
    else
      render template: 'posts/show'
    end
  end

  def edit
    comment = Comment.find(params[:id])
    comment.comment = params[:comment][:comment]
    if comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    comment = Comment.find(params[:comment][:id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end
end
