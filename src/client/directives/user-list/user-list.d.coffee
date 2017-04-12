'use strict'

angular.module 'concerto2'
.directive 'userList', ->
  restrict: 'EA'
  templateUrl: 'directives/user-list/user-list.html'
  replace: true
  link: (scope, elem, attrs) ->
    console.log 'user-list directive'