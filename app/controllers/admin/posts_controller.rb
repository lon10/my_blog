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
