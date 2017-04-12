'use strict'

angular.module 'concerto2'
.directive 'header', ->
  restrict: 'EA'
  templateUrl: 'directives/header/header.html'
  replace: true
  link: (scope, elem, attrs) ->
    console.log 'header directive'