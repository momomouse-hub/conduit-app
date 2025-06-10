module ArticlesHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(
      with_toc_data: true,
      filter_html: true,
      hard_wrap: true
    )
    extensions = {
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      strikethrough: true
    }
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end
end
