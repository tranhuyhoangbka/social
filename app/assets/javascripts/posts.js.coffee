$(document).ready ->
  console.log "document ready event"

$(document).on 'page:load', ->
  console.log "document page load event"
