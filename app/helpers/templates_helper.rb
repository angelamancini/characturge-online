module TemplatesHelper

  def show_trait(trait, trait_type)
    case trait_type
    when "general"
      "<strong>#{trait.name}</strong> <span class='pull-right'>_____________________</span>".html_safe
    when "dots"
      "<strong>#{trait.name}</strong> #{write_dots(trait.start_value, trait.max_value, 1)}".html_safe
    when "bigdots"
      "<strong>#{trait.name}</strong><br />#{write_dots(trait.start_value, trait.max_value, 2)}".html_safe
    when "boxedbigdots"
      big_dots= "<i class='fa fa-circle-o fa-fw'></i> " * trait.max_value.to_i
      boxes = "<i class='fa fa-square-o fa-fw'></i> " * trait.max_value.to_i
      "<strong>#{trait.name}</strong><br />#{big_dots}<br />#{boxes}".html_safe
    when "slots"
      "_____________________"
    when "doubleslots"
      "_____________________ <span class='pull-right'>_____________________</span>".html_safe
    when "merits"
      "#{trait.name} <span class='pull-right'>_________</span>".html_safe
    when "health"
      "#{trait.name} <span class='pull-right'>_________ <i class='fa fa-square-o'></i></span>".html_safe
    when "circle"
      line = "<i class='fa fa-square-o'></i></span> " * 10
      "<strong>#{trait.name}</strong><br />#{line}<br />#{line}".html_safe
    else
      trait_type
    end

  end

  def write_dots(start_value, max_value, size)
    modifier = "fa-#{size}x"
    start_value = start_value.to_i
    max_value = max_value.to_i
    starting_dots = "<i class='fa fa-circle #{modifier}'></i> " * start_value
    empty_dots = "<i class='fa fa-circle-o #{modifier}'></i> " * (max_value - start_value)
    return "<span class='pull-right'>#{starting_dots}#{empty_dots}</span>".html_safe
  end
end
