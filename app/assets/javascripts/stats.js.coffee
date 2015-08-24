ready = ->
  characturge.statLogMe()
  characturge.changeStats()
  characturge.setStats()


characturge.statLogMe = ->
  console.log('Stats coffeescript file is loaded')

characturge.setStats = ->
  $stat = $('.clicky-stat')
  icon = $(this).data('icon')
  $stat.each ->
    hidden_field = $(this).attr('id').slice(0,-1)+'value'
    field_value = parseInt($("#"+hidden_field).val())
    data_value = parseInt($(this).data('value'))
    if field_value >= data_value
      $(this).removeClass('fa-'+icon+'-o').addClass('fa-'+icon)
    else
      $(this).removeClass('fa-'+icon).addClass('fa-'+icon+'-o')

characturge.changeStats = ->
  $('.clicky-stat').click ->
    icon = $(this).data('icon')
    hidden_field = $(this).attr('id').slice(0,-1)+'value'
    stat_class = $(this).attr('id').slice(0,-2)
    data_value = parseInt($(this).data('value'))
    field_value = parseInt($("#"+hidden_field).val())

    $("#"+hidden_field).val($(this).data('value'))

    $('.'+stat_class).each ->
      if parseInt($(this).data('value')) <= data_value
        $(this).removeClass('fa-'+icon+'-o').addClass('fa-'+icon)
      else
        $(this).removeClass('fa-'+icon).addClass('fa-'+icon+'-o')

$(document).ready(ready)
$(document).on('page:load', ready)
