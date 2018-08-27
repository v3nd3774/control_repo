node default {
  file {'/root/README':
    ensure  => file,
    content => 'This is a README!\n',
    owner   => 'root',
  }
}
