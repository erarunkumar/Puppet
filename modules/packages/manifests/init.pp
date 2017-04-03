# Class packages
class packages(
  $enhancers = undef
) {
  Package { ensure => 'installed' }
  package { $enhancers: }
}
