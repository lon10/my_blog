class HomeController < ApplicationController

  def index
    @posts = Post.all.to_a
  end

  def show
    @post = Post.find(params[:id])
  end

end