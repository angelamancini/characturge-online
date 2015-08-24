module TemplatesHelper

  def show_trait(trait, trait_type)
    case trait_type
    when "general"
      if trait.lists.count > 0
        field = select_tag trait.lists.first, options_from_collection_for_select(trait.lists.first.list_items, "id", "name")
      else
        field = "_____________________"
      end
      "<strong>#{trait.name}</strong> <span class='pull-right'>#{field}</span>".html_safe
    when "dots"
      "<strong>#{trait.name}</strong> #{write_icons(trait.start_value, trait.max_value, 'circle')}".html_safe
    when "bigdots"
      "<strong>#{trait.name}</strong><br />#{write_icons(trait.start_value, trait.max_value, 'circle')}".html_safe
    when "boxedbigdots"
      big_dots= write_icons(trait.start_value, trait.max_value, 'circle')
      boxes = write_icons(trait.start_value, trait.max_value, 'square')
      "<strong>#{trait.name}</strong><br />#{big_dots}<br />#{boxes}".html_safe
    when "slots"
      if trait.lists.count > 0
        select_tag trait.lists.first, options_from_collection_for_select(trait.lists.first.list_items, "id", "name")
      else
        "_____________________"
      end
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

  def write_icons(start_value, max_value, icon)
    start_value = start_value.to_i
    max_value = max_value.to_i
    starting_dots = "<i class='fa fa-#{icon} fa-fw'></i>" * start_value
    empty_dots = "<i class='fa fa-#{icon}-o fa-fw'></i>" * (max_value - start_value)
    return "<span class='pull-right'>#{starting_dots}#{empty_dots}</span>".html_safe
  end
end
