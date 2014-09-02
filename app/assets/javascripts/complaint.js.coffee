setupDatePicker = ->
  $(".date-picker").datepicker
    dateFormat: "MM dd, yy"


productObserver = ->
  $('#product-details').on 'change', 'td.product select', (event) ->
    element_to_update = $(this).closest('tr').find('td.sku')
    product_name = $(this).find(':selected').text()
    updateSKU(product_name, element_to_update)

updateSKU = (product_name, element_to_update) ->
  $.ajax '/product/get_skus',
    type: 'GET'
    dataType: 'json'
    data: { product_name: product_name }
    error: (data) ->
      alert 'Could not process your request. Please try again later.'
    success: (data) ->
      element_to_update.html(data.sku)


adverseReactionObserver = ->
  $('.complaint_adverse_reaction').on 'change', 'input.radio_buttons', (event) ->
    updateAdverseReactionMessageInImmediateResponse()

updateAdverseReactionMessageInImmediateResponse = ->
  if $('#complaint_adverse_reaction_false').is(':checked')
    $("#complaint_immediate_response").html(NAR_MESSAGE)
    $("#adverse-event-form").hide()
  else if $('#complaint_adverse_reaction_true').is(':checked')
    $("#complaint_immediate_response").html(AR_MESSAGE)
    $("#adverse-event-form").show()


statusObserver = ->
  $('.complaint_status').on 'change', 'select', (event) ->
    processStatus()

processStatus = ->
  if confirm("Download PDF of this PC?")
    status = $('#complaint_status').find(':selected').text()
    if status == "pdf"
      window.open('print.pdf')


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

  adverseReactionObserver()
  updateAdverseReactionMessageInImmediateResponse()

  statusObserver()

$(document).ready(ready)
$(document).on('page:load', ready)




AR_MESSAGE = "Thank you for your inquiry regarding Upgraded. At this time, we suggest that you discontinue the use of this product and any other Bulletproof products that you feel may be contributing to your reaction. If your condition persists, we recommend that you consult with your health care provider. As a service to our customers, Bulletproof will gladly exchange the product for another item or provide you with a refund of the full purchase price of the product.
\n\n
We have initiated an investigation to address your concern. This investigation will consist of a review of the appropriate documentation and a review of samples of the product. If you have not done so already, please send any remaining product as well as any unused samples of the same product to Bulletproof to aid in our investigation. We appreciate your patience in this matter, and we assure you that we will provide you with a response.
\n\n
If you have any additional concerns, you may contact Bulletproof Customer Service by messaging us at:support@upgradedself.com at any time. Our customer service representatives will gladly assist you.
Bulletproof is committed to offering high-quality and effective products to our consumers. We thank you for notifying us, and we will continue to make every effort to provide you and others with these superior products. On the label there should also be a 6 digit lot number printed next to the barcode, could you send me this number as well please?
\n\n
Bulletproof Support"
NAR_MESSAGE = "Thank you for your inquiry regarding Upgraded. Bulletproof is committed to offering high-quality and effective products to our consumers. We thank you for notifying us, and we will continue to make every effort to provide you and others with these superior products. As a service to our customers, Bulletproof will gladly exchange the product for another item or provide you with a refund of the full purchase price of the product. On the label there should also be a 6 digit lot number printed next to the barcode, could you send me this number as well please?"
