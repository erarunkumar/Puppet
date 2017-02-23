# == Class: profiles::nvm_nodejs
#
class profiles::nodejs {
  class { 'git': }->
  class { 'make': }->
  class { 'nvm_nodejs': }
}
