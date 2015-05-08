class Admin::CommentsController < Admin::AdminController
  def index
    post = Post.find(params[:post_id])
    @comments = post.comments
  end

  def destroy
    comment = Comment.find(params[:id])

    if comment.delete
      flash[:notice] = t('activerecord.comment.messages.deleted')
    else
      flash[:error] = t('errors.messages.main')
    end

    redirect_to admin_post_comments_path(comment.post, comment)
  end

  def destroy_multiple
    if Comment.destroy(params[:comments])
      flash[:notice] = t('activerecord.comment.messages.multiple_deleted')
    else
      flash[:error] = t('errors.messages.main')
    end

    redirect_to admin_post_comments_path(params[:post_id])
  end
end
