class HomeController < ApplicationController
  def index
    @contents = Content.all
    @contents = @contents.order(created_at: :desc).page(params[:page]).per(5)
  end
end
