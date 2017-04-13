'use strict'

angular.module 'concerto2'
.directive 'userList', ->
  restrict: 'EA'
  templateUrl: 'directives/user-list/user-list.html'
  replace: true
  scope:
    ngModel: '='
    type: '@'
  link: (scope, elem, attrs) ->
    scope.filter =
      $like: ''
    deref = scope.$watch 'ngModel', (n) ->
      if n and n.item
        scope.opts =
          where:
            $or:
              username: scope.filter
              first_name: scope.filter
              last_name: scope.filter
              email: scope.filter
          page: 1
          pageSize: 10
          sort: 'username'
          sortDir: 'ASC'
        scope.opts.where[n.endpoint] = n.item._id
        scope.users = scope.list 'users', scope.opts
        deref()
    , true
    scope.addviewedit = (user, editing) ->
      scope.modal
        template: 'user-detail'
        controller: 'UserDetailCtrl'
        data:
          user: user
          editing: editing
          endpoint: scope.ngModel.endpoint
          endpointId: scope.ngModel.item._id
    scope.delete = (user) ->
      scope.confirm 'Are you sure you want to delete', (result) ->
        if result
          scope.users.delete user