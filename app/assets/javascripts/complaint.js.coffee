setupDatePicker = ->
  $(".date-picker").datepicker
    dateFormat: "MM dd, yy"

ready = ->
  setupDatePicker()

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('tr').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    console.log $(this)
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('#product-details table tr:last').after($(this).data('fields').replace(regexp, time))
    setupDatePicker()
    event.preventDefault()

$(document).ready(ready)
$(document).on('page:load', ready)
