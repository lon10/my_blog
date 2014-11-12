class Admin::CommentsController < Admin::AdminController

  def index
    post = Post.find(params[:post_id])
    @comments = post.comments
  end

  def destroy
    comment = Comment.find(params[:id])

    if(comment.delete)
      flash[:notice] = 'Комментарий успешно удалён'
      render json: {result: true}
    else
      flash[:error] = 'Произошла ошибка'
      render json: {result: false}
    end
  end

end
