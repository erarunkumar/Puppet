# == Class: roles::elasticsearch
#
class roles::elasticsearch {
  include profiles::java
  include profiles::elasticsearch
}
