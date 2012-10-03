module ApplicationHelper
  def menu_item(title, path, options = {})
    css_class = options[:class] || ''
    link_to title, path, :class => (request.path == path) ? ('current ' + css_class) : css_class 
  end
end
