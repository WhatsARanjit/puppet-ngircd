class ngircd (
  $allow_remote_op       = $ngircd::params::allow_remote_op,
  $allowed_channel_types = $ngircd::params::allowed_channel_types,
  $connectretry          = $ngircd::params::connectretry,
  $dns                   = $ngircd::params::dns,
  $ensure                = $ngircd::params::ensure,
  $group                 = $ngircd::params::group,
  $help_file             = $ngircd::params::help_file,
  $ident                 = $ngircd::params::ident,
  $idletimeout           = $ngircd::params::idletimeout,
  $info                  = $ngircd::params::info,
  $ipv4                  = $ngircd::params::ipv4,
  $ipv6                  = $ngircd::params::ipv6,
  $listen                = $ngircd::params::listen,
  $maxconnections        = $ngircd::params::maxconnections,
  $maxconnectionsip      = $ngircd::params::maxconnectionsip,
  $maxjoins              = $ngircd::params::maxjoins,
  $maxlistsize           = $ngircd::params::maxlistsize,
  $maxnicklength         = $ngircd::params::maxnicklength,
  $motd                  = $ngircd::params::motd,
  $opercanusemode        = $ngircd::params::opercanusemode,
  $operchanpautoop       = $ngircd::params::operchanpautoop,
  $operservermode        = $ngircd::params::operservermode,
  $password              = $ngircd::params::password,
  $pingtimeout           = $ngircd::params::pingtimeout,
  $pongtimeout           = $ngircd::params::pongtimeout,
  $ports                 = $ngircd::params::ports,
  $requireauthping       = $ngircd::params::requireauthping,
  $scrubctcp             = $ngircd::params::scrubctcp,
  $server_name           = $ngircd::params::server_name,
  $syslogfacility        = $ngircd::params::syslogfacility,
  $user                  = $ngircd::params::user,
  $webircpassword        = $ngircd::params::webircpassword,
) inherits ngircd::params {

  package { $package_name:
    ensure => $ensure,
  }

  concat { $config_file:
    owner   => $user,
    group   => $group,
    mode    => '0660',
    warn    => true,
    require => Package[$package_name],
  }

  concat::fragment { 'main':
    target  => $config_file,
    order   => '01',
    content => template("${module_name}/global.erb"),
  }

  service { $service_name:
    ensure    => running,
    enable    => true,
    subscribe => Concat[$config_file],
  }

}
