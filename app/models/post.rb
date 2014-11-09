class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  paginates_per(10)

  scope :ordered, -> { order('created_at DESC') }
end
