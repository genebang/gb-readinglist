$ ->
  $('#show-form').on 'click', (e) ->
    e.preventDefault()
    $('.book-form').slideToggle()