
signAndDate = (returnID, approval) ->
  $.ajax '/return/sign_approval',
    type: 'POST'
    data: { id: returnID, approval: approval }

ready = ->
  $("#signatures").on "click", "a", (event) ->
    event.preventDefault()
    returnID = $('#ra-number').text()
    approval = event.target.id
    signAndDate(returnID, approval)


$(document).ready(ready)
$(document).on('page:load', ready)