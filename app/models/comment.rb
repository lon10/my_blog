class Comment < ActiveRecord::Base
  belongs_to :post

  validates :name, :text, presence: true

  after_create :send_telegram_message

  def comment_preview
    "#{text[0..70]}..."
  end

  protected

  def send_telegram_message
    if Rails.env == 'production'
      TelegramMessageService.instance.send("#{name} added new comment to <#{post.title}> - #{text}")
    end
  end
end
