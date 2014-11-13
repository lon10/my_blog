class Admin::PostsController < Admin::AdminController

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

    if(@post.save)
      redirect_to admin_posts_path, notice: 'Пост добавлен'
    else
      flash[:error] = 'Во время создания поста произошла ошибка'
      render :new
    end
  end

  def edit
    find_post
  end

  def update
    find_post

    if(@post.update(post_params))
      redirect_to admin_posts_path, notice: 'Пост отредактирован'
    else
      flash[:error] = 'Во время редактирования поста произошла ошибка'
      render :edit
    end
  end

  def destroy
    post = find_post

    if(post.delete)
      flash[:notice] = 'Пост успешно удалён'
    else
      flash[:error] = 'Произошла ошибка'
    end

    redirect_to admin_posts_path
  end

  def publish
    post = find_post

    if(post.update_attribute(:published, true))
      flash[:notice] = 'Пост опубликован'
    else
      flash[:error] = 'Произошла ошибка'
    end

    redirect_to admin_posts_path
  end

  def unpublish
    post = find_post

    if(post.update_attribute(:published, false))
      flash[:notice] = 'Пост снят с публикации'
    else
      flash[:error] = 'Произошла ошибка'
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
