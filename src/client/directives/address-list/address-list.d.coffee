'use strict'

angular.module 'concerto2'
.directive 'addressList', ->
  restrict: 'EA'
  require: 'ngModel'
  templateUrl: 'directives/address-list/address-list.html'
  replace: true
  scope:
    ngModel: '='
  link: (scope, elem, attrs) ->
    scope.page = 1
    scope.limit = 10
    scope.getAddresses = ->
      if scope.ngModel and scope.ngModel.item
        if not scope.ngModel.item.addresses
          scope.ngModel.item.addresses = []
        scope.ngModel.item.addresses
    scope.addviewedit = (address, editing) ->
      if address
        scope.ngModel.address = address
      if editing
        scope.ngModel.editing = editing
      scope.ngModel.billing = scope.ngModel.item.addresses.indexOf(address) is 0
      scope.modal
        template: 'address-detail'
        controller: 'AddressDetailCtrl'
        data: scope.ngModel
    scope.delete = (address) ->
      scope.confirm 'Are you sure you want to delete', (result) ->
        if result
          scope.ngModel.item.addresses.remove address
          scope.ngModel.save()