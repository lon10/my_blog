class Admin::CommentsController < Admin::AdminController
  def index
    post = Post.find(params[:post_id])
    @comments = post.comments
  end

  def destroy_multiple
    if params[:comments] && Comment.destroy(params[:comments])
      flash[:notice] = t('activerecord.comment.messages.multiple_deleted')
    else
      flash[:error] = t('errors.messages.main')
    end

    redirect_to admin_post_comments_path(params[:post_id])
  end
end
