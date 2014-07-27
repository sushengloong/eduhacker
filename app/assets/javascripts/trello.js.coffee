initPortlets = ->
  $( ".list" ).sortable
    connectWith: ".list"

$(document).on 'portlets:load', initPortlets
