class TelegramMessageService
  include Singleton

  TG_CONFIG = YAML.load_file(File.expand_path("#{Rails.root}/config/telegram.yml", __FILE__))

  def send(message)
    p '------------------------'
    if system("#{TG_CONFIG['telegram_path']} -k #{TG_CONFIG['key_path']} -W -e 'msg #{TG_CONFIG['peer']} #{message}'")
      p 'Telegram sent message'
    else
      p 'Error! Telegram obtrivodnomilsya'
    end
    p '------------------------'
  end
end