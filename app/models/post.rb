class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  paginates_per(10)

  scope :by_order, -> { order('created_at DESC') }
end
