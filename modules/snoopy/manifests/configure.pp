class snoopy::configure(
$username = undef,
$userid = undef,
$groupid = undef,
$superid = undef,
$terminal = undef,
$current_directory = undef,
$processid = undef,
$filename = undef,
$logfile = undef,
$log_path = undef,
$datetime = undef
){
	file{'/etc/snoopy.ini':
		content => template('snoopy/snoopy.ini.erb'),
		owner => 'root',
		group => 'root',
		mode => '644',
	}
}
