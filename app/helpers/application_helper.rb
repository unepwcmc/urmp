module ApplicationHelper
  def menu_item(title, path, options = {})
    css_class = options[:class] || ''
    link_to title, path, :class => (request.path == path) ? ('current ' + css_class) : css_class
  end

  def display_html(text)
    text.html_safe if text.present?
  end
end
