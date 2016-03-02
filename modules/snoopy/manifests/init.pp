# == Class: snoopy
#
# Full description of class snoopy here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { snoopy:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class snoopy(
$username = $::snoopy::params::username,
$userid = $::snoopy::params::userid,
$groupid = $::snoopy::params::groupid,
$superid = $::snoopy::params::superid,
$terminal = $::snoopy::params::terminal,
$current_directory = $::snoopy::params::current_directory,
$processid = $::snoopy::params::processid,
$filename = $::snoopy::params::filename,
$logfile = $::snoopy::params::logfile,
$log_path = $::snoopy::params::log_path,
$datetime = $::snoopy::params::datetime
)inherits snoopy::params{
	# Install snoopy
	class {'snoopy::install':}
	# Configure snoopy logs
	class {'snoopy::configure':
		username => $username,
		userid => $userid,
		groupid => $groupid,
		superid => $superid,
		terminal => $terminal,
		current_directory => $current_directory,
		processid => $processid,
		filename =>$filename,
		logfile => $logfile,
		log_path => $log_path,
		datetime => $datetime,
		require => Class['snoopy::install'],
	}
}
