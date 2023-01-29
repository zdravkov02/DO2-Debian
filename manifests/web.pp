$packages = [ 'apache2', 'php', 'php-mysqlnd', 'git' ]

package { $packages: }

vcsrepo { '/code':
  ensure => present,
  provider => git,
  source => 'https://github.com/shekeriev/do2-app-pack.git',
  }

file_line { 'hosts-web':
    ensure => present,
    path   => '/etc/hosts',
    line   => '192.168.99.102  web  web',
    match  => '^192.168.99.102',
}

file_line { 'hosts-db':
    ensure => present,
    path   => '/etc/hosts',
    line   => '192.168.99.103  db  db',
    match  => '^192.168.99.103',
}

file { '/etc/apache2/sites-enabled/vhost-app1.conf':
    ensure => present,
    content => 'Listen 8001
<VirtualHost *:8001>
  DocumentRoot "/var/www/app2"
</VirtualHost>',
}

file { '/etc/apache2/sites-enabled/vhost-app2.conf':
    ensure => present,
    content => 'Listen 8002
<VirtualHost *:8002>
  DocumentRoot "/var/www/app4"
</VirtualHost>',
}

file { '/var/www/app2':
  ensure => 'directory',
  recurse => true,
  source => '/code/app2/web',
}

file { '/var/www/app4':
  ensure => 'directory',
  recurse => true,
  source => '/code/app4/web',
}

class { 'firewall': }

firewall { '000 accept 8001/tcp':
  action   => 'accept',
  dport    => 8001,
  proto    => 'tcp',
}

firewall { '000 accept 8002/tcp':
  action   => 'accept',
  dport    => 8002,
  proto    => 'tcp',
}

service { apache2:
  ensure => running,
  enable => true,
}

exec { 'Restart of apache2':
  path   => '/usr/bin:/usr/sbin:/bin',
  command => 'systemctl restart apache2',
  user => 'root',
}