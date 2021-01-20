class HomeController < ApplicationController
  def index
    @contents = Content.all
    @contents = @contents.order('created_at DESC')
  end

  def create
  end

  def update
  end

  def destory
  end
end
