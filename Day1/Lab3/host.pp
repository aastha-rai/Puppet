host { 'foo':
  name         => 'foobar.com', 
  ensure       => 'present',
  comment      => 'foobar.com', 
  host_aliases => 'fooserver',
  ip           => '1.2.3.4',
  target       => '/etc/hosts',  
}

