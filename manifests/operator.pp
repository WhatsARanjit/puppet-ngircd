define ngircd::operator (
  $password = undef,
  $mask     = '*!*@*',
) {

  concat::fragment { "operator_${title}":
    target  => $::ngircd::config_file,
    order   => '06',
    content => template("${module_name}/operator.erb"),
  }

}
