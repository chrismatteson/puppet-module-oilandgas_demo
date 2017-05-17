class oilandgas_demo::usecase3::nginx {

  exec { 'generate ssl cert':
    command => "/usr/bin/openssl req -subj '/CN=aruljohn.com/O=Arul John/C=US' -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout /etc/nginx/cert.key -out /etc/nginx/cert.crt",
    creates => '/etc/nginx/cert.crt',
  } ->
  class { 'nginx': }

  file { '/etc/nginx/conf.d/default.conf':
    ensure  => file,
    source  => "puppet:///modules/${module_name}/default.conf",
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  file { '/usr/share/nginx/html/index.html':
    ensure  => file,
    content => template("${module_name}/index.html.erb"),
    require => Package['nginx'],
  }

  firewall { '101 accept https':
    dport  => 443,
    proto  => tcp,
    action => 'accept'
  }
}
