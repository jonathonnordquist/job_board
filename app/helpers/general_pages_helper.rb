module GeneralPagesHelper
  def formatted_title(title = "")
    title_base = "Rails Job Board"
    if title.empty?
      title_base
    else
      "#{title} | #{title_base}"
    end
  end
end
