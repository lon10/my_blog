class Admin::PostsController < Admin::AdminController

  def index
    @posts = Post.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to admin_posts_path
    else
      redirect_to new_admin_post_path
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to admin_posts_path
    else
      redirect_to new_admin_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end


end
