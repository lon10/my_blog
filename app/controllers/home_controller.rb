class HomeController < ApplicationController

  def index
    @posts = Post.all.to_a
  end

end