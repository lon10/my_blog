class Admin::CommentsController < Admin::AdminController

  def index
    post = Post.find(params[:post_id])
    @comments = post.comments
  end

  def destroy
    comment = Comment.find(params[:id])

    if(comment.delete)
      flash[:notice] = t('activerecord.comment.messages.deleted')
    else
      flash[:error] = t('errors.messages.main')
    end

    redirect_to admin_post_comments_path(comment.post, comment)
  end

end
