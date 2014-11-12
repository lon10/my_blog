class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :comments, dependent: :destroy

  validates :title, :text, presence: true

  paginates_per(10)

  scope :ordered, -> { order('created_at DESC') }

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def self.find(id_or_slug)
    self.find_by_id(id_or_slug) || self.find_by_slug(id_or_slug)
  end
end
