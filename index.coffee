express = require('express')
app     = express()
server  = require('http').Server(app)
io      = require('socket.io')(server)

server.listen 1337

app.use '/', express.static(__dirname + '/www/compiled')
app.use('/lib', express.static(__dirname + '/www/lib'))

io.on 'connection', (socket) ->
  socket.emit 'hello', 'josh'
