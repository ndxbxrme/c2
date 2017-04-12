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
    scope.getAddresses = ->
      if scope.ngModel and scope.ngModel.item
        if not scope.ngModel.item.addresses
          scope.ngModel.item.addresses = []
        scope.ngModel.item.addresses
    scope.add = ->
      scope.modal
        template: 'address-detail'