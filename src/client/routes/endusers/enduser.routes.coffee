'use strict'

angular.module 'concerto2'
.config ($stateProvider) ->
  $stateProvider.state 'enduser',
    url: '/enduser/:id'
    templateUrl: 'routes/endusers/enduser.html'
    controller: 'EnduserCtrl'
    resolve:
      user: (auth) ->
        auth.getPromise(['superadmin','ADM','SYS','SUP'])