class UpdateAllPostSlugs < ActiveRecord::Migration
  def up
    Post.find_each(&:save)
  end
end
