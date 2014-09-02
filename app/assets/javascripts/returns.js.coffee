
signAndDate = (returnID, approval) ->
  $.ajax '/return/sign_approval',
    type: 'POST'
    data: { id: returnID, approval: approval }

conditionObserver = ->
  $('.return_faulty_products_condition').on 'change', 'select', (event) ->
    updateConditionAlert()

updateConditionAlert = ->
  condition = $('.return_faulty_products_condition select').find(':selected').text()
  if condition == "good"
    $('.condition-instruction').text("send to warehouse")
  else if condition == "bad"
    $('.condition-instruction').text("send to quarantine")
  else
    $('.condition-instruction').text("")

returnTypeObserver = ->
  $('.return_return_type').on 'change', 'select', (event) ->
    updateCondition()

updateCondition = ->
  type = $('.return_return_type select').find(':selected').text()
  if type == "Customer complaint"
    selectCondition("bad")
  else if type == "Return to sender"
    $('.condition-instruction').text("select GOOD if product is sealed and not damaged. Otherwise select BAD.")
  else if type == "Warehouse"
    $('.condition-instruction').text("select GOOD if product is sealed and not damaged. Otherwise select BAD.")

selectCondition = (condition) ->
  $(".return_faulty_products_condition select option").filter( ->
    return $(this).text() == condition
  ).prop('selected', true)
  updateConditionAlert()


returnStatusObserver = ->
  $('.return_status').on 'change', 'select', (event) ->
    processReturnStatus()

processReturnStatus = ->
  if confirm("Download PDF of this Return?")
    status = $('#return_status').find(':selected').text()
    if status == "pdf"
      window.open('print.pdf')


ready = ->
  returnTypeObserver()
  updateCondition()

  conditionObserver()
  updateConditionAlert()

  $("#signatures").on "click", "a", (event) ->
    event.preventDefault()
    returnID = $('#ra-number').text()
    approval = event.target.id
    signAndDate(returnID, approval)

  returnStatusObserver()


$(document).ready(ready)
$(document).on('page:load', ready)