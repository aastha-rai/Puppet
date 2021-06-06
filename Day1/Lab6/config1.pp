include stdlib

package { 'openssh-server':
  ensure => present,
}

file_line { 'test_line':
  line => '# I am Puppet',
  path => '/etc/ssh/sshd_config',
  require     =>  Package['openssh-server'],
}

service { 'sshd':
  ensure => running,
  enable => true,
  require => File_Line['test_line'],
}

