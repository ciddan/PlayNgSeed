### global require ###
require.config
  paths:
    'angular'                           : 'vendor/angular'
    'domReady'                          : 'vendor/domReady'
  shim:
    'angular'                           : exports: 'angular'

require [
  'require'
  'app'
  'routes'
  'controllers/main'
  'controllers/project'
  'controllers/edit'
  'filters/reverse'
], (require) -> require ['bootstrap']