$(document).on "ready page:change", ->
  $('.stores .entry > img').click ->
    $(this).parent().parent().find(':submit').click()