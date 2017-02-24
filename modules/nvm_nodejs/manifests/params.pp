# Class: elasticsearch::nvm_nodejs
#
# This class defines default parameters used by nvm_nodejs

class nvm_nodejs::params {
  $user        = 'node'
  $home        = "/opt/${user}"
  $version     = '6.6.0'
  $packages    = {} #like bower@4.4
  $environment = ''
  $port        = '3000'
  $app_name    = undef
  $node_app    = 'app.js'
}
