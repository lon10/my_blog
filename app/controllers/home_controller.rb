class HomeController < ApplicationController

  def index
    page = params[:page]

    @posts = Post.ordered.page(page)
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all
    @new_comment = Comment.new
  end

  def add_comment
    Comment.create!(comment_params)
    redirect_to home_post_path(comment_params[:post_id]), flash: { notice: 'Ваш комментарий добавлен!' }
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :text, :post_id)
  end

end