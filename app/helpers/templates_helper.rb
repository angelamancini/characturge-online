module TemplatesHelper

  def write_dots(start_value, max_value)
    start_value = start_value.to_i
    max_value = max_value.to_i
    starting_dots = "<i class='fa fa-circle'></i> " * start_value
    empty_dots = "<i class='fa fa-circle-o'></i> " * (max_value - start_value)
    return "<span class='pull-right'>#{starting_dots}#{empty_dots}</span>".html_safe
  end
end
