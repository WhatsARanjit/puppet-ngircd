# ssl configuration

define ngircd::ssl (
  $certfile        = undef,
  $keyfile         = undef,
  $keyfilepassword = undef,
  $ciphers         = [ 'SECURE128' ],
  $dhfile          = undef,
  $ports           = [],
) {

  concat::fragment { 'ssl':
    target  => $::ngircd::config_file,
    order   => '04',
    content => template("${module_name}/ssl.erb"),
  }

}
