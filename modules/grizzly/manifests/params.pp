# Class: nvm_nodejs::params
#
# This class defines default parameters used by nvm_nodejs

class grizzly::params {
  $user        = 'grizzly'
  $home        = "/opt/${user}"
  $app_name    = undef
}
