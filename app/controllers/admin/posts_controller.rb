class Admin::PostsController < Admin::AdminController

  def index
    page = params[:page]

    @posts = Post.ordered.page(page)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if(@post.save)
      redirect_to admin_posts_path, notice: 'Пост добавлен'
    else
      redirect_to new_admin_post_path
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
      redirect_to new_admin_post_path
    end
  end

  def destroy
    post = find_post

    if(post.delete)
      flash[:notice] = 'Пост успешно удалён'
      render json: {result: true}
    else
      flash[:error] = 'Произошла ошибка'
      render json: {result: false}
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def find_post
    @post = Post.find(params[:id])
  end


end
