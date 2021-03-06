TicTacToe.controller 'JoinCtrl', ($scope, Membership) ->
  $scope.user = {}
  $scope.registered = false
  $scope.error = null

  $scope.$watch (-> Membership.nicks), ->
    $scope.nicks = Membership.nicks

  $scope.$watch (-> Membership.registered), ->
    $scope.registered = Membership.registered

  $scope.$watch (-> Membership.error), ->
    $scope.error = Membership.error

  $scope.register = ->
    Membership.register($scope.user.nick)
