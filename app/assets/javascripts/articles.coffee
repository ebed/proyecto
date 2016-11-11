# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#fileupload').fileupload
    dataType: 'script'
    add: (e, data) ->
        console.log("Antes de modal show")
        $('#myModal').modal('show')
        console.log("Despues de modal show")
        file = data.files[0]
        console.log("Antes de append fileupload1")
        $('#fileupload').append(data.context)
        console.log("Luego de append fileupload")
        data.submit()



jQuery ->
    $('a').tooltip();

