module TemplatesHelper

  def list_or_text(trait)
    if trait.lists.count > 0
      select_tag trait.name, options_from_collection_for_select(trait.lists.first.list_items, "id", "name"), class: 'form-control'
    else
      text_field_tag trait.name, nil, class: 'form-control'
    end
  end

  def show_trait(trait, trait_type)
    render trait_type, trait: trait
    # case trait_type
    # when "general"
    #   render 'general', trait: trait
    # when "dots"
    #   rebder 'dots'
    # when "bigdots"
    #   "<strong>#{trait.name}</strong><br />#{write_icons(trait.start_value, trait.max_value, 'circle', trait.name)}".html_safe
    # when "boxedbigdots"
    #   # big_dots= write_icons(trait.start_value, trait.max_value, 'circle', trait.name)
    #   # boxes = write_icons(trait.start_value, trait.max_value, 'square', trait.name)
    #   "<strong>#{trait.name}</strong>".html_safe #"<br />#{big_dots}<br />#{boxes}".html_safe
    # when "slots"
    #   if trait.lists.count > 0
    #     # select_tag trait.name, options_from_collection_for_select(trait.lists.first.list_items, "id", "name")
    #   else
    #     # text_field_tag trait.name
    #   end
    # when "doubleslots"
    #   # text_field_tag trait.name
    # when "merits"
    #   # "#{trait.name} <span class='pull-right'>#{text_field_tag trait.name}</span>".html_safe
    # when "health"
    #   # "#{trait.name} <span class='pull-right'>#{text_field_tag trait.name, trait.start_value} <i class='fa fa-square-o'></i></span>".html_safe
    # when "circle"
    #   # line = "<i class='fa fa-square-o'></i></span> " * 10
    #   # "<strong>#{trait.name}</strong><br />#{line}<br />#{line}".html_safe
    # else
    #   trait_type
    # end

  end

  def write_icons(start_value, max_value, icon, name)
    start_value = start_value.to_i
    max_value = max_value.to_i
    count = 0
    stats = ''
    max_value.times do
      count += 1
      stats += "<span id='#{name.parameterize}-#{count}' class='#{name.parameterize} clicky-stat fa fa-#{icon}-o fa-fw' data-value='#{count}' data-icon='#{icon}'></span>"
    end

    return "<span class='pull-right'>#{stats}</span>".html_safe
  end
end
