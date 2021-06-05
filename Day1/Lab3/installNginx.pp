package { 'nginx':
    ensure => present
}
service { 'nginx':
    ensure => running,
    require => Package['nginx'],
}
file { '/var/www/html/index.nginx-debian.html':
  ensure  => present,
  replace => true,
  content => '<h1> Hello There, My name is Aastha </h1>',
}

