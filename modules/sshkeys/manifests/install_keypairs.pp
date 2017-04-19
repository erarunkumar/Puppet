# == Class: sshkeys::install_keypair
#
class sshkeys::install_keypairs (
  keypairs = {},
){
    create_resources('sshkeys::install_keypair',hiera('keypairs'))
}
