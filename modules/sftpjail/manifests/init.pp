# == Class: sftpjail
# Author Name <sandeep@panthacorp.com>
#
class sftpjail(){

	include sftpjail::install
	include sftpjail::config
	include sftpjail::service
}

