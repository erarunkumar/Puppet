# Class: nvm_nodejs::params
#
# This class defines default parameters used by nvm_nodejs

class grizzly::params {
  $user        = 'grizzly'
  $home        = "/opt/${user}"
  $version     = '6.6.0'
  $app_name    = undef
}
