'use strict'

angular.module 'concerto2'
.config ($stateProvider) ->
  $stateProvider.state 'endusers',
    url: '/endusers'
    templateUrl: 'routes/endusers/endusers.html'
    controller: 'EndusersCtrl'
    resolve:
      user: (auth) ->
        auth.getPromise(['superadmin','ADM','SYS','SUP'])