#
class roles::spark {
  class { 'profiles::base': }->
  class { 'profiles::java': }->
  class { 'profiles::spark': }
}
