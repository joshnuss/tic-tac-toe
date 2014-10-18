TicTacToe.factory 'Join', (Socket) ->
  service =
    registered: false
    nick: null
    error: null
    register: (nick) ->
      service.error = null
      Socket.emit('register', nick)

  Socket.on 'register:success', (nick) ->
    service.registered = true
    service.nick = nick

  Socket.on 'register:error', (msg) ->
    service.registered = false
    service.nick = null
    service.error = msg

  service
