class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :comments, dependent: :destroy

  validates :title, :text, presence: true
  validate :validate_title

  paginates_per(10)

  scope :ordered, -> { order('created_at DESC') }
  scope :published, -> { where(published: true) }

  def should_generate_new_friendly_id?
    true
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def self.find(id_or_slug)
    self.find_by_id(id_or_slug) || self.find_by_slug(id_or_slug)
  end

  def validate_title
    if title_is_number?
      errors.add(:title, 'Название не может быть числом')
    end
  end

  private

  def title_is_number?
    true if Float(title) rescue false
  end

end
