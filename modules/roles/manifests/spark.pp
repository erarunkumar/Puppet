#
class roles::spark {
  class { 'profiles::java': }->
  class { 'profiles::base': }->
  class { 'profiles::spark': }
}
