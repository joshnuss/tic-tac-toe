window.TicTacToe = angular.module('TicTacToe', ['ngRoute', 'btford.socket-io'])

TicTacToe.config ($routeProvider) ->
  $routeProvider
    .when '/join',
      controller: 'JoinCtrl'
      templateUrl: '/views/join.html'

    .when '/play',
      template: 'play'

    .otherwise
      redirectTo: '/join'
