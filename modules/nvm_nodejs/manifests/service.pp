# == Class: nvm_nodejs::service
#
class nvm_nodejs::service {
    service { "node_${nvm_nodejs::app_name}":
      ensure   => 'installed',
      enable   => true,
      provider => 'redhat',
    }
}
