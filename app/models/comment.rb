class Comment < ActiveRecord::Base
  belongs_to :post

  validates :name, :text, presence: true

  def comment_preview
    "#{text[0..70]}..."
  end
end
