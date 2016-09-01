# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#fileupload').fileupload
    dataType: 'script'
    add: (e, data) ->
        $('#myModal').modal('show')
        file = data.files[0]
        $('#fileupload').append(data.context)
        data.submit()



jQuery ->
    $('a').tooltip();

