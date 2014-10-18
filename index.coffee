express = require('express')
app     = express()
server  = require('http').Server(app)
io      = require('socket.io')(server)
nicks   = []

server.listen 1337

app.use '/', express.static(__dirname + '/www/compiled')
app.use('/lib', express.static(__dirname + '/www/lib'))

io.on 'connection', (socket) ->

  socket.on 'register', (nick) ->
    nick = nick.toLowerCase()

    if nicks.indexOf(nick) > -1
      socket.emit('register:error', 'Name already taken.')
    else
      socket.nick = nick
      socket.emit('register:success', nick: nick, nicks: nicks)
      nicks.push(nick)
      socket.broadcast.emit('members:list', nicks)

  socket.on 'disconnect', ->
    if socket.nick
      index = nicks.indexOf(socket.nick)
      nicks.splice(index, 1)
