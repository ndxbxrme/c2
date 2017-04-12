'use strict'

angular.module 'concerto2'
.directive 'menu', ->
  restrict: 'EA'
  templateUrl: 'directives/menu/menu.html'
  replace: true
  link: (scope, elem, attrs) ->
    console.log 'menu directive'