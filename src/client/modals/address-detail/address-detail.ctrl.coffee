'use strict'

angular.module 'concerto2'
.controller 'AddressDetailCtrl', ($scope, data) ->
  $scope.forms = {}
  $scope.data = data
  if data.address
    $scope.address = JSON.parse JSON.stringify data.address
    $scope.editing = data.editing
  else
    $scope.address =
      _id: $scope.generateId()
    $scope.editing = true
    $scope.adding = true
  cleanup = ->
    delete data.address
    delete data.editing
    delete data.billing
  $scope.saveFn = (cb) ->
    if not data.item.addresses
      data.item.addresses = []
    updated = false
    for address in data.item.addresses
      if address._id is $scope.address._id
        for key of $scope.address
          address[key] = $scope.address[key]
        updated = true
    if not updated
      if data.item.addresses.length
        data.item.addresses.push $scope.address
        if not $scope.data.billing
          cleanup()
          $scope.$close()
          cb? true
      else
        $scope.confirm 'this will be the billing address', (result) ->
          if result
            data.item.addresses.push $scope.address
            cleanup()
            $scope.$close()
            cb? true
          else
            cb? false
    if $scope.data.billing
      for address in data.item.addresses
        if address._id is $scope.address._id
          if data.item.addresses.indexOf(address) > 0
            $scope.confirm 'another address is already the billing address', (result) ->
              if result
                data.item.addresses.moveFirst address
                cleanup()
                $scope.$close()
                cb? true
              else
                cb? false
  $scope.cancelFn = (cb) ->
    cleanup()
    $scope.$close()
    cb? true