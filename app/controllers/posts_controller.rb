class PostsController < ApplicationController
  def new 
    @content = Content.new
  end

  def create
    @content = current_user.contents.build(content_params)
    thumbnail = params[:content][:thumbnail]
    if thumbnail
      thumbnail_name = thumbnail.original_filename
      File.open("public/user_images/#{thumbnail_name}", 'wb') do |f|
        f.write thumbnail.read
      end
      @content.thumbnail = thumbnail_name
    end
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
      thumbnail_name = thumbnail.original_filename
      File.open("public/user_images/#{thumbnail_name}", 'wb') do |f|
        f.write thumbnail.read
      end
      @content.thumbnail = thumbnail_name
    end
    if @content.save
      redirect_to controller: :home, action: :index
    else
      render :new
    end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy!
    redirect_to controller: :home, action: :index
  end

  private

  def content_params
    params.require(:content).permit(:id, :title, :script, :thumbnail)
  end
end
