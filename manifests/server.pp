# Define our peer (irc server)

define ngircd::server (
  $host            = $title,
  $port            = '6667',
  $remote_password = undef,
  $local_password  = undef,
  $bind            = undef,
  $passive         = 'no',
  $group           = '1',
  $service_mask    = undef,
  $ssl             = 'no',
) {

  concat::fragment { "server_${name}":
    target  => $::ngircd::config_file,
    order   => '05',
    content => template("${module_name}/server.erb"),
  }

}
