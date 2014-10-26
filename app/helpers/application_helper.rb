module ApplicationHelper
  def li_navbar_link_to(name, path)
    nav_active = (current_page?(path)) ? "active" : "not-active"
    "<li class=\"#{nav_active}\"><a href=\"#{path}\">#{name}</a></li>".html_safe
  end
end
