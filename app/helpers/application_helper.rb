module ApplicationHelper
  def full_title(title)
    default_title = "My Website 2.0"
    if title.empty?
      default_title
    else
      "#{title}"
    end
  end
end
