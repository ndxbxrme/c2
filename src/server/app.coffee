'use strict'

require 'ndx-server'
.config
  database: 'db'
  tables: ['users','agency','enduser','contract','vacancy','worker','invoice','timesheet','system']
  localStorage: './data'
.start()
