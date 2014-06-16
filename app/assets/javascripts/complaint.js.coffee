setupDatePicker = ->
  $(".date-picker").datepicker
    dateFormat: "MM dd, yy"


updateSKU = (product_name, element_to_update) ->
  $.ajax '/product/get_skus',
    type: 'GET'
    dataType: 'json'
    data: { product_name: product_name }
    error: (data) ->
      alert 'Could not process your request. Please try again later.'
    success: (data) ->
      element_to_update.html(data.sku)

productObserver = ->
  $('#product-details').on 'change', 'td.product select', (event) ->
    element_to_update = $(this).closest('tr').find('td.sku')
    product_name = $(this).find(':selected').text()
    updateSKU(product_name, element_to_update)


ready = ->
  setupDatePicker()

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('tr').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('#product-details table tr:last').after($(this).data('fields').replace(regexp, time))
    setupDatePicker()
    element_to_update = $('#product-details tr:last').find('td.sku')
    product_name = $('#product-details tr:last').find(':selected').text()
    updateSKU(product_name, element_to_update)
    event.preventDefault()

  productObserver()
  $('#product-details td.product select').each () ->
    element_to_update = $(this).closest('tr').find('td.sku')
    product_name = $(this).find(':selected').text()
    updateSKU(product_name, element_to_update)

$(document).ready(ready)
$(document).on('page:load', ready)
