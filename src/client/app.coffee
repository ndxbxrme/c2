'use strict'

angular.module 'concerto2', [
  'ndx'
  'ui.router'
  'ui.select2'
]
.config ($locationProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'
  $locationProvider.html5Mode true
.run ($rootScope, $window, ndxCheck, ndxModal) ->
  root = Object.getPrototypeOf $rootScope
  root.saveFn = (cb) ->
    cb? true
  root.cancelFn = (cb) ->
    cb? true
  root.save = ->
    isValid = true
    checkScope = (scope) ->
      for key of scope
        if scope.hasOwnProperty(key)
          if Object.prototype.toString.call(scope[key]) is '[object Object]'
            if scope[key].$$controls
              isValid = isValid and scope[key].$valid
    checkScope @
    if @.forms
      checkScope @.forms
    @submitted = true
    if isValid
      @saveFn (result) =>
        if result
          for key of @
            if Object.prototype.toString.call(@[key]) is '[object Object]'
              if @[key].item
                console.log 'i want to save', @[key]
                @[key].locked = false
                @[key].save()
          @editing = false
  root.cancel = ->
    @cancelFn (result) =>
      if result
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
  root.generateId = (length) ->
    chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    length = length or 8
    output = ''
    i = 0
    while i++ < length
      output += chars[Math.floor(Math.random() * chars.length)]
    output
  root.confirm = (message, cb) ->
    cb? $window.confirm message
try
  angular.module 'ndx'
catch e
  angular.module 'ndx', [] #ndx module stub