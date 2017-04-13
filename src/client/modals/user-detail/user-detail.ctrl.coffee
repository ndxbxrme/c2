'use strict'

angular.module 'concerto2'
.controller 'UserDetailCtrl', ($scope, data) ->
  $scope.usertypes = [{
    _id:'ADM'
    name:'System Admin'
  }
  {
    _id:'SYS'
    name:'System User'
  }
  {
    _id:'CASH'
    name:'Cash Management'
  }]
  $scope.forms = {}
  $scope.data = data
  $scope.editing = data.editing
  if not data.user
    $scope.adding = true
    $scope.editing = true
    data.user =
      _id: 'new'
  $scope.user = $scope.single 'users', data.user._id, (user) ->
    user.item = user.item or {}
    user.item[data.endpoint] = data.endpointId
  $scope.saveFn = (cb) ->
    $scope.user.item.roles = $scope.user.item.roles or {}
    for role in ['ADM','SYS','CASH','SUP','AGM','CLM']
      delete $scope.user.item.roles[role]
    $scope.user.item.roles[$scope.user.item.usertype] = {}
    $scope.$close()
    cb? true
  $scope.cancelFn = (cb) ->
    $scope.$close()
    cb? true