module ApplicationHelper
  def menu_item(title, path, options = {})
    content_tag(:li, :class => (request.path.match(/#{path}/) || options[:root]) ? 'current' : ' ') do
    link_to title, path
  end
end