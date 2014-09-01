//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require bootstrap.min
//= require turbolinks
//= require_tree .

$ ->
  $('body').on "click", ".section-header", () ->
    $(this).parent().find(".section-content").slideToggle(200)
    sign = $(this).find(".toggle-sign")
    if ( sign.text() == '-' )
      sign.text('+')
    else
      sign.text('-')

  $(".section-header").each ->
    $(this).click()
