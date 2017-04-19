# == Class: sshkeys::authorizes
#
class sshkeys::authorizes(
  sshkeys = {},
){
    create_resources('sshkeys::authorize',hiera('sshkeys'))
}
