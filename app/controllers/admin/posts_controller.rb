class Admin::PostsController < Admin::AdminController
  before_action :find_post, only: [:edit, :update, :destroy, :publish, :unpublish, :enable_comments, :disable_comments]

  def index
    page = params[:page]

    @posts = Post.ordered.page(page)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to admin_posts_path, notice: t('activerecord.post.messages.added')
    else
      flash[:error] = t('activerecord.post.messages.add_error')
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path, notice: t('activerecord.post.messages.updated')
    else
      flash[:error] = t('activerecord.post.messages.update_error')
      render :edit
    end
  end

  def destroy
    if @post.delete
      flash[:notice] = t('activerecord.post.messages.deleted')
    else
      flash[:error] = t('activerecord.post.messages.error')
    end

    redirect_to admin_posts_path
  end

  def publish
    if @post.update_attribute(:published, true)
      flash[:notice] = t('activerecord.post.messages.published')
    else
      flash[:error] = t('activerecord.post.messages.error')
    end

    redirect_to admin_posts_path
  end

  def unpublish
    if @post.update_attribute(:published, false)
      flash[:notice] = t('activerecord.post.messages.unpublished')
    else
      flash[:error] = t('activerecord.post.messages.error')
    end

    redirect_to admin_posts_path
  end

  def enable_comments
    if @post.update_attribute(:commentable, true)
      flash[:notice] = t('activerecord.post.messages.enable_comments')
    else
      flash[:error] = t('activerecord.post.messages.error')
    end

    redirect_to admin_posts_path
  end

  def disable_comments
    if @post.update_attribute(:commentable, false)
      flash[:notice] = t('activerecord.post.messages.disable_comments')
    else
      flash[:error] = t('activerecord.post.messages.error')
    end

    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def find_post
    id = params[:id] || params[:post_id]
    @post = Post.find(id)
  end
end
