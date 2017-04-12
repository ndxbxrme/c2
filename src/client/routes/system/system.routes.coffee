'use strict'

angular.module 'concerto2'
.config ($stateProvider) ->
  $stateProvider.state 'system',
    url: '/system'
    templateUrl: 'routes/system/system.html'
    controller: 'SystemCtrl'
    resolve:
      user: (auth) ->
        auth.getPromise(['superadmin','SUP','ADM'])