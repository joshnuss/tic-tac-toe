window.TicTacToe = angular.module('TicTacToe', ['ngRoute', 'btford.socket-io'])

TicTacToe.config ($routeProvider) ->
  $routeProvider
    .when '/join',
      template: 'Join'

    .when '/play',
      template: 'play'

    .otherwise
      redirectTo: '/join'

socket = io()

socket.on 'connect', ->
  socket.on 'hello', (name) ->
    alert "hello #{name}"
