class Admin::CommentsController < Admin::AdminController

  def index
    post = Post.find(params[:post_id])
    @comments = post.comments
  end

  def destroy
    comment = Comment.find(params[:id])

    if(comment.delete)
      flash[:notice] = 'Комментарий успешно удалён'
    else
      flash[:error] = 'Произошла ошибка'
    end

    redirect_to admin_post_comments_path(comment.post, comment)
  end

end
