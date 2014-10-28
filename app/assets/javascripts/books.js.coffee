initialize = ->
  $('#show-form').on 'click', (e) ->
    e.preventDefault()
    $('.book-form').slideToggle()

$(document).ready(initialize)
$(document.ready('page:load', initialize))
