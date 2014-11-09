class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  paginates_per(3)

  scope :by_order, -> { order('created_at DESC') }
end
