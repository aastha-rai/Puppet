class namespacing::servicestate {
service { 'nginx':
     ensure => running,
     require => Package['nginx'],
     }
}
