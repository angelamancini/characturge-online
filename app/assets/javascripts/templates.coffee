ready = ->
  characturge.templateLogMe()
  characturge.deleteThing()
  characturge.toggleThing()


characturge.templateLogMe = ->
  console.log('Templates coffeescript file is loaded')

characturge.deleteThing = ->
  $('.delete-thing').click ->
    event.preventDefault()
    id = $(this).attr('id')
    console.log 'Clicked ' + id
    list = id.replace('delete-','')
    console.log 'get rid of ' + list
    $('#'+list).hide()

characturge.toggleThing = ->
  $('.toggle-thing').click ->
    event.preventDefault()
    id = $(this).attr('id')
    console.log(id)
    thing = id.replace('link-','')
    # console.log(thing)
    if $('#'+thing).is(':visible')
      console.log('hide '+thing)
      $('#'+thing).hide()
      $(this).html("<i class='fa fa-eye'></i> Show")
    else
      console.log('show '+thing)
      $('#'+thing).show()
      $(this).html("<i class='fa fa-eye-slash'></i> Hide")


$(document).ready(ready)
$(document).on('page:load', ready)
