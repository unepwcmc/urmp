module ApplicationHelper
  def menu_item(title, path, options = {})
    css_class = options[:class]
    link_to title, path, :class => (request.path.match(/#{path}/) || options[:root]) ? ('current ' + css_class) : css_class
  end
end
