class Comment < ActiveRecord::Base
  belongs_to :post

  validates :name, :text, presence: true
end
