class namespacing::confhtml{
file { '/var/www/html/index.nginx-debian.html':
     ensure  => present,
     replace => true,
     content => '<h1> Puppet Classes </h1>',
     }
}
