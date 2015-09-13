module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title.to_s }
  end

  def yield_or_default(section, default = '')
    content_for?(section) ? content_for(section) : default
  end

  def active_nav(actionName, controllerName, environment = nil)
    if environment
      'active' if params[:action] == actionName && params[:controller] == controllerName && params[:environment] == environment
    else
      'active' if params[:action] == actionName && params[:controller] == controllerName
    end
  end
end
