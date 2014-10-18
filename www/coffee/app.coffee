socket = io()

socket.on 'connect', ->

  socket.on 'hello', (name) ->
    alert "hello #{name}"
