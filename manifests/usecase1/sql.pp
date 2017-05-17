class oilandgas_demo::usecase1::sql {

  class { 'domain_membership':
    domain   => 'puppet.example',
    username => 'joinmember',
    password     => 'sUp3r_s3cR3t!',
    join_options => '3',
  }

   reboot { 'before install':
      when => pending,
  }

  service { 'wuauserv':
    ensure => running,
    enable => true,
    before => Windowsfeature['Net-Framework-Core'],
  }

  windowsfeature { 'Net-Framework-Core': }

  sqlserver_instance{ 'oilandgas':
    ensure                => present,
    features              => ['SQLEngine','Replication'],
    source                => 'C:\vagrant',
    security_mode         => 'SQL',
    sa_pwd                => 'p@ssw0rd',
    sql_sysadmin_accounts => [vagrant],
  }
  sqlserver_features { 'Management_Studio':
    source   => 'C:\vagrant',
    features => ['SSMS'],
  }
  sqlserver::config{ 'oilandgas':
    admin_user => 'sa',
    admin_pass => 'P@sswr0rd!',
  }

}
