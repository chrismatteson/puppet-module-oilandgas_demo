class oilandgas_demo::usecase3::base {

  service { '':
    ensure => running,
    enable => true,
  }

  exec { 'restful api call':
    command => 'curl -k https://dev32525.service-now.com/api/now/table/u_restpuppet?sysparm_display_value=all&sysparm_fields=u_nodename%2Cu_processdate%2Cu_packagename%2Cu_returncode%2Csys_id%2Csys_updated_on%2Csys_updated_by%2Csys_created_on%2Csys_created_by'
  }
}
