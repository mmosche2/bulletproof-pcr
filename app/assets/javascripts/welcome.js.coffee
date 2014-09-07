# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


dashboardLogObserver = ->
  $('#complaints-log-partial, #returns-log-partial').on 'click', 'th a, .pagination a', () ->
    $.getScript(this.href)
    return false

  $('#dashboard_search').submit () ->
    $.get(this.action, $(this).serialize(), null, 'script')
    return false

  $('#dashboard_search input').keyup () ->
    $.get( $('#dashboard_search').attr('action'), $('#dashboard_search').serialize(), null, 'script' )
    return false


ready = ->
  dashboardLogObserver()

$(document).ready(ready)
$(document).on('page:load', ready)

