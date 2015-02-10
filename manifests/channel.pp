define ngircd::channel (
  $key      = undef,
  $keyfile  = undef,
  $maxusers = 100,
  $modes    = 'tnk',
  $topic    = undef,
) {

  concat::fragment { "channel_${title}":
    target  => $::ngircd::config_file,
    order   => '08',
    content => template("${module_name}/channel.erb"),
  }

}
