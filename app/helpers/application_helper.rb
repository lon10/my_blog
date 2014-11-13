module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def text_preview(text)
    first_p = text.index('</p>').to_i
    if first_p != 0
      "#{text[0..(first_p + 3)]}"
    else
      "#{text[0..1000]}"
    end
  end

end
