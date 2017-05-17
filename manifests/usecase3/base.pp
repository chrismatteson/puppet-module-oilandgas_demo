class oilandgas_demo::usecase3::base {

  exec { 'restful api call':
    command => '/usr/bin/curl -k https://dev32525.service-now.com/api/now/table/u_restpuppet?sysparm_display_value=all&sysparm_fields=u_nodename%2Cu_processdate%2Cu_packagename%2Cu_returncode%2Csys_id%2Csys_updated_on%2Csys_updated_by%2Csys_created_on%2Csys_created_by'
  }

  file { '/etc/issue':
    ensure  => file,
    mode    => '0644',
    content => '
#Managed by Puppet
CentOS release 6.6 (Final)
Kernel \r on an \m'
  }

  file_line { 'ntp tinker':
    path  => '/etc/ntp.conf',
    line  => 'tinker panic 0',
    match => '^tinker',
  }
}
