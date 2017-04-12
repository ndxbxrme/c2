'use strict'

angular.module 'concerto2', [
  'ndx'
  'ui.router'
  'ui.select2'
]
.config ($locationProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'
  $locationProvider.html5Mode true
.run ($rootScope, ndxCheck, ndxModal) ->
  root = Object.getPrototypeOf $rootScope
  root.save = ->
    isValid = true
    for key of @
      if @.hasOwnProperty(key)
        if Object.prototype.toString.call(@[key]) is '[object Object]'
          if @[key].$$controls
            isValid = isValid and @[key].$valid
    @submitted = true
    if isValid
      for key of @
        if @.hasOwnProperty(key)
          if Object.prototype.toString.call(@[key]) is '[object Object]'
            if @[key].item
              @[key].locked = false
              @[key].save()
      @editing = false
  root.cancel = ->
    @submitted = false
    @editing = false
    for key of @
      if @.hasOwnProperty(key)
        if Object.prototype.toString.call(@[key]) is '[object Object]'
          if @[key].item
            @[key].locked = false
            @[key].refreshFn()
    ndxCheck.setPristine @
  root.edit = ->
    @submitted = false
    @editing = true
    for key of @
      if @.hasOwnProperty(key)
        if Object.prototype.toString.call(@[key]) is '[object Object]'
          if @[key].item
            @[key].locked = true
  root.modal = (args) ->
    size = args.size or 'large'
    controller = args.controller or 'YesNoCancelCtrl'
    backdrop = args.backdrop or 'static'
    modalInstance = ndxModal.open
      templateUrl: "modals/#{args.template}/#{args.template}.html"
      windowClass: size
      controller: controller
      backdrop: backdrop
      resolve:
        data: ->
          args.data
    modalInstance.result
try
  angular.module 'ndx'
catch e
  angular.module 'ndx', [] #ndx module stub