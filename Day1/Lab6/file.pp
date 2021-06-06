include stdlib

file { '/tmp/testfile.txt':
  ensure => present
}

file_line { 'test_line':
  line => 'awesome',
  path => '/tmp/testfile.txt',
  require => File['/tmp/testfile.txt'],
}


