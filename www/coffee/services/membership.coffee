TicTacToe.factory 'Membership', (Socket) ->
  service =
    registered: false
    nick: null
    nicks: []
    error: null
    register: (nick) ->
      service.error = null
      Socket.emit('register', nick)

  Socket.on 'register:success', (response) ->
    service.registered = true
    service.nick = response.nick
    service.nicks = response.nicks

  Socket.on 'register:error', (msg) ->
    service.registered = false
    service.nick = null
    service.error = msg

  Socket.on 'members:list', (nicks) ->
    nicks.splice(nicks.indexOf(service.nick), 1)
    console.log nicks
    service.nicks = nicks

  service
