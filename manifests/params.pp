class ngircd::params {

  case $::osfamily {
    'RedHat': {
      $service_name = 'ngircd'
      $package_name = 'ngircd'
      $config_file  = '/etc/ngircd.conf'
    }
    default: {
      fail("${::operatingsystem} is not supported yet.")
    }
  }

  # Configs
  $ensure = 'installed'
  $user   = 'root'
  $group  = 'ngircd'

  # Global configs
  $admin_email           = "admin@${::hostname}"
  $admin_info1           = false
  $admin_info2           = false
  $allow_remote_op       = 'no'
  $allowed_channel_types = '#'
  $chroot_dir            = '/var/empty'
  $cloak_host            = false
  $cloak_host_modex      = 'cloaked.user'
  $cloak_host_salt       = 'abcdefghijklmnopqrstuvwxyz'
  $cloak_user_to_nick    = 'yes'
  $connectretry          = '60'
  $dns                   = 'yes'
  $help_file             = '/usr/share/doc/ngircd-21/Commands.txt'
  $ident                 = 'yes'
  $idletimeout           = '0'
  $info                  = false
  $ipv4                  = 'yes'
  $ipv6                  = 'yes'
  $listen                = $::ipaddress
  $maxconnections        = '0'
  $maxconnectionsip      = '5'
  $maxjoins              = '10'
  $maxlistsize           = '100'
  $maxnicklength         = '9'
  $more_privacy          = 'no'
  $motd                  = false
  $notice_auth           = 'no'
  $opercanusemode        = 'no'
  $operchanpautoop       = 'yes'
  $operservermode        = 'no'
  $password              = false
  $pingtimeout           = '120'
  $pongtimeout           = '20'
  $ports                 = [ '6667' ]
  $requireauthping       = 'no'
  $scrubctcp             = 'no'
  $server_name           = $::fqdn
  $syslogfacility        = 'local5'
  $user_modes            = false
  $webircpassword        = false
}
