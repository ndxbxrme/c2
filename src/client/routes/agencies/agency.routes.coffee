'use strict'

angular.module 'concerto2'
.config ($stateProvider) ->
  $stateProvider.state 'agency',
    url: '/agency/:id'
    templateUrl: 'routes/agencies/agency.html'
    controller: 'AgencyCtrl'
    resolve:
      user: (auth) ->
        auth.getPromise(['superadmin','ADM','SYS','SUP'])