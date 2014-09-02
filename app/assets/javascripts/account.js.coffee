
notifyAERObserver = ->
  $("#agents-section").on "click", ".toggle-notify-aer", () ->
    elementToUpdate = $(this).parent().find(".should-notify")
    $.ajax '/account/AER_email',
      type: 'POST'
      dataType: 'json'
      data: { user_id: $(this).parent().find(".agent-id").text() }
      error: (data) ->
        alert 'did not work :('
      success: (data) ->
        if data.notify_bool == true
          elementToUpdate.html("YES")
        else
          elementToUpdate.html("")

ready = ->
  notifyAERObserver()

$(document).ready(ready)
$(document).on('page:load', ready)
