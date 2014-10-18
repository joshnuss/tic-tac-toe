TicTacToe.controller 'JoinCtrl', ($scope, Join) ->
  $scope.user = {}
  $scope.registered = false
  $scope.error = null

  $scope.$watch (-> Join.registered), ->
    $scope.registered = Join.registered

  $scope.$watch (-> Join.error), ->
    $scope.error = Join.error

  $scope.register = ->
    Join.register($scope.user.nick)
