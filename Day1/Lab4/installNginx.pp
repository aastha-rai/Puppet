class nginx {
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
  content => '<h1> Puppet classes </h1>',
}
}

class { 'nginx': }

