#
class roles::spark {
  class { 'profiles::java': }->
  class { 'profiles::spark': }
}
