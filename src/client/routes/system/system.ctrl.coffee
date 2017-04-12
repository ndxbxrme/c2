'use strict'

angular.module 'concerto2'
.controller 'SystemCtrl', ($scope) -> 
  allsystems = $scope.list 'system', null, (systems) ->
    allsystems.locked = true
    id = 'new'
    if systems and systems.items and systems.items.length
      id = systems.items[0]._id
    $scope.system = $scope.single 'system', id