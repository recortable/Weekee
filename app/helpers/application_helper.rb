module ApplicationHelper
  def title(title, tag = :h1)
    content_for(:title) { title }
  end
end
