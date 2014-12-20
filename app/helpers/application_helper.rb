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

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true,
        space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

end
