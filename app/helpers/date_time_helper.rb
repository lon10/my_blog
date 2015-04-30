module DateTimeHelper
  def format_date(date)
    date.strftime('%d.%m.%Y')
  end

  def format_date_time(date)
    date.strftime('%d.%m.%Y %H:%M')
  end
end
