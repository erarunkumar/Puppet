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
	# Create snoopy configuration file to generate appropriate logs
	file{'/etc/snoopy.ini':
		content => template('snoopy/snoopy.ini.erb'),
		owner => 'root',
		group => 'root',
		mode => '644',
	}
}
