ready = ->
  characturge.templateLogMe()
  characturge.deleteThing()

characturge.templateLogMe = ->
  console.log('Templates coffeescript file is loaded')

characturge.deleteThing = ->
  console.log 'Delete the thing!'
  $('.delete-thing').click ->
    event.preventDefault()
    id = $(this).attr('id')
    console.log 'Clicked ' + id
    list = id.replace('delete-','')
    console.log 'get rid of ' + list
    $('#'+list).hide()


$(document).ready(ready)
$(document).on('page:load', ready)
