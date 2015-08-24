ready = ->
  characturge.statLogMe()
  characturge.setStats()
  characturge.changeStats()


characturge.statLogMe = ->
  console.log('Stats coffeescript file is loaded')

characturge.setStats = ->
  $stat = $('.stat-value')
  $stat.each ->
    stat_value = $(this).val()
    # console.log stat_value
    if parseInt(stat_value) > 0
      i = parseInt(stat_value)
      while i > 0
        stat = $(this).attr('id').replace('value', i.toString())
        icon = $('#'+stat).data('icon')
        $('#'+stat).removeClass('fa-'+icon+'-o').addClass('fa-'+icon)
        i--


characturge.changeStats = ->
  $('.clicky-stat').click ->
    icon = $(this).data('icon')
    hidden_field = $(this).attr('id').slice(0,-1)+'value'
    stat_class = $(this).attr('id').slice(0,-2)
    data_value = parseInt($(this).data('value'))
    field_value = parseInt($("#"+hidden_field).val())
    # console.log $(this).attr('id')
    if $(this).hasClass('fa-'+icon+'-o')
      console.log('empty dot'+' change value to '+ data_value)
      $("#"+hidden_field).val($(this).data('value'))
      $('.'+stat_class).each ->
        dot_value = $(this).data('value')
        if data_value >= dot_value
          $(this).removeClass('fa-'+icon+'-o').addClass('fa-'+icon)
        else
          $(this).removeClass('fa-'+icon).addClass('fa-'+icon+'-o')
    else
      console.log('filled dot')
      console.log('clicked on '+data_value)
      if data_value == field_value
        $("#"+hidden_field).val(parseInt($(this).data('value'))-1)
        $(this).removeClass('fa-'+icon).addClass('fa-'+icon+'-o')
      else if data_value < field_value
        $("#"+hidden_field).val($(this).data('value'))
        $('.'+stat_class).each ->
          dot_value = $(this).data('value')
          if data_value < dot_value
            $(this).removeClass('fa-'+icon).addClass('fa-'+icon+'-o')

$(document).ready(ready)
$(document).on('page:load', ready)
