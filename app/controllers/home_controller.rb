class HomeController < ApplicationController

  def index
    page = params[:page]

    @posts = Post.published.ordered.page(page)
  end

  def show
    show_post
    raise ActiveRecord::RecordNotFound unless @post.published?
    @comment = Comment.new
  end

  def add_comment
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to home_post_path(params[:id]), notice: t('activerecord.comment.messages.saved')
    else
      show_post
      flash[:error] = t('activerecord.errors.models.comment.message')
      render :show
    end
  end

  private

  def show_post
    @post = Post.find(params[:id])
    @comments = Comment.all
  end

  def comment_params
    params.require(:comment).permit(:name, :text, :post_id)
  end

end