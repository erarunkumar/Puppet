class incron::hiera_limits (
	$config = undef, 
) {
   $incron = hiera_hash('incron', $config)
   create_resources( 'incron::incrontab', $incron )
}
