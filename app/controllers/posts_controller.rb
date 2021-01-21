class PostsController < ApplicationController
  include Common

  def new 
    @content = Content.new
  end

  def create
    current_user.present? ? @content = current_user.contents.build(content_params) : @content = Content.new(content_params)
    thumbnail = params[:content][:thumbnail]
    @content.thumbnail = registFile(nil, "user_images", thumbnail) if thumbnail
    if @content.save
      redirect_to controller: :home, action: :index
    else
      render :new
    end
  end

  def show
    @content = Content.find(params[:id])
    @comments = @content.comments
    @comments = @comments.order('created_at DESC')
    @comment = Comment.new
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    @content.title = content_params[:title]
    @content.script = content_params[:script]
    thumbnail = params[:content][:thumbnail]
    if thumbnail
      @content.thumbnail = registFile(nil, "user_images", thumbnail)
    end
    if @content.save
      redirect_to controller: :home, action: :index
    else
      render :new
    end
  end

  def destroy
    @content = Content.find(params[:id])
    deleteFile(@content, "content")
    @content.destroy!
    redirect_to controller: :home, action: :index
  end

  private

  def content_params
    params.require(:content).permit(:id, :title, :script, :thumbnail)
  end
end
