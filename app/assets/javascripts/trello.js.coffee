initPortlets = ->
  $( ".list" ).sortable
    connectWith: ".list"

$(document).on 'portlets:load', initPortlets
$(document).on 'ajax:before', 'form#search_form', ->
  $('img#loading_icon').show()
  $('#search_results_ctn').empty()
$(document).on 'ajax:success', 'form#search_form', ->
  $('img#loading_icon').hide()
