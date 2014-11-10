class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :title, :text, presence: true

  paginates_per(10)

  scope :ordered, -> { order('created_at DESC') }
end
