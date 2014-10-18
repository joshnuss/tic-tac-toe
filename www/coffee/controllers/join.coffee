TicTacToe.controller 'JoinCtrl', ($scope, Membership) ->
  $scope.user = {}
  $scope.registered = false
  $scope.error = null

  $scope.$watch (-> Join.registered), ->
    $scope.registered = Join.registered

  $scope.$watch (-> Membership.registered), ->
    $scope.registered = Membership.registered

  $scope.$watch (-> Membership.error), ->
    $scope.error = Membership.error

  $scope.register = ->
    Membership.register($scope.user.nick)
