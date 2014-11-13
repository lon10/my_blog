class UpdatePublishedStateInPosts < ActiveRecord::Migration
  def change
    Post.update_all('published = true')
  end
end
