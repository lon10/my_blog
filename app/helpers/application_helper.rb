module ApplicationHelper

  def text_preview(text)
    "#{text[0..1000]}..."
  end

end
