'use strict'

angular.module 'concerto2'
.config ($stateProvider) ->
  $stateProvider.state 'agencies',
    url: '/agencies'
    templateUrl: 'routes/agencies/agencies.html'
    controller: 'AgenciesCtrl'
    resolve:
      user: (auth) ->
        auth.getPromise(['superadmin','ADM','SYS','SUP'])