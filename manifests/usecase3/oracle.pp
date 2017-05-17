class oilandgas_demo::usecase3::oracle {

  $all_groups = ['oinstall','dba' ,'oper']
  group { $all_groups :
    ensure      => present,
  }
  user { 'oracle' :
    ensure      => present,
    gid         => 'oinstall',
    groups      => ['oinstall','dba','oper'],
    shell       => '/bin/bash',
    password    => '$1$DSJ51vh6$4XzzwyIOk6Bi/54kglGk3.',
    home        => "/home/oracle",
    comment     => "This user oracle was created by Puppet",
    require     => Group[$all_groups],
    managehome  => true,
  }
  sysctl { 'kernel.msgmnb':                 ensure => 'present', value => '65536',}
  sysctl { 'kernel.msgmax':                 ensure => 'present', value => '65536',}
  sysctl { 'kernel.shmmax':                 ensure => 'present', value => '2588483584',}
  sysctl { 'kernel.shmall':                 ensure => 'present', value => '2097152',}
  sysctl { 'fs.file-max':                   ensure => 'present', value => '6815744',}
  sysctl { 'net.ipv4.tcp_keepalive_time':   ensure => 'present', value => '1800',}
  sysctl { 'net.ipv4.tcp_keepalive_intvl':  ensure => 'present', value => '30',}
  sysctl { 'net.ipv4.tcp_keepalive_probes': ensure => 'present', value => '5',}
  sysctl { 'net.ipv4.tcp_fin_timeout':      ensure => 'present', value => '30',}
  sysctl { 'kernel.shmmni':                 ensure => 'present', value => '4096', }
  sysctl { 'fs.aio-max-nr':                 ensure => 'present', value => '1048576',}
  sysctl { 'kernel.sem':                    ensure => 'present', value => '250 32000 100 128',}
  sysctl { 'net.ipv4.ip_local_port_range':  ensure => 'present', value => '9000 65500',}
  sysctl { 'net.core.rmem_default':         ensure => 'present', value => '262144',}
  sysctl { 'net.core.rmem_max':             ensure => 'present', value => '4194304', }
  sysctl { 'net.core.wmem_default':         ensure => 'present', value => '262144',}
  sysctl { 'net.core.wmem_max':             ensure => 'present', value => '1048576',}
   class { 'limits':
    config => {
             '*'       => { 'nofile'  => { soft => '2048'   , hard => '8192',   },},
             'oracle'  => { 'nofile'  => { soft => '65536'  , hard => '65536',  },
                             'nproc'  => { soft => '2048'   , hard => '16384',  },
                             'stack'  => { soft => '10240'  ,},},
             },
    use_hiera => false,
  }
  $install = [ 'binutils.x86_64', 'compat-libstdc++-33.x86_64', 'glibc.x86_64','ksh.x86_64','libaio.x86_64',
             'libgcc.x86_64', 'libstdc++.x86_64', 'make.x86_64','compat-libcap1.x86_64', 'gcc.x86_64',
             'gcc-c++.x86_64','glibc-devel.x86_64','libaio-devel.x86_64','libstdc++-devel.x86_64',
             'sysstat.x86_64','unixODBC-devel','glibc.i686','libXext.x86_64','libXtst.x86_64']
  package { $install:
    ensure  => present,
  }

  oradb::installdb{ '12.2.0.1_Linux-x86-64':
    version                   => '12.2.0.1',
    file                      => 'linuxx64_12201_database',
    database_type             => 'EE',
    oracle_base               => '/oracle',
    oracle_home               => '/oracle/product/12.2/db',
    bash_profile              => true,
    user                      => 'oracle',
    group                     => 'dba',
    group_install             => 'oinstall',
    group_oper                => 'oper',
    download_dir              => '/tmp/files',
    puppet_download_mnt_point => '/vagrant/files',
  }

  oradb::listener{'start listener':
    action        => 'start',  # running|start|abort|stop
    oracle_base   => '/oracle',
    oracle_home   => '/oracle/product/12.2/db',
    user          => 'oracle',
    group         => 'dba',
    listener_name => 'listener' # which is the default and optional
  }

  oradb::database{ 'testDb_Create':
    oracle_base               => '/oracle',
    oracle_home               => '/oracle/product/12.2/db',
    version                   => '12.2',
    user                      => 'oracle',
    group                     => 'dba',
    download_dir              => '/tmp/files',
    action                    => 'create',
    db_name                   => 'test',
    db_domain                 => 'oracle.com',
    db_port                   => 1521,
    sys_password              => 'Welcome01',
    system_password           => 'Welcome01',
    data_file_destination     => "/oracle/oradata",
    recovery_area_destination => "/oracle/flash_recovery_area",
    character_set             => "AL32UTF8",
    nationalcharacter_set     => "UTF8",
    init_params               => {'open_cursors'        => '1000',
                                'processes'           => '600',
                                'job_queue_processes' => '4' },
    sample_schema             => 'TRUE',
    memory_percentage         => 40,
    memory_total              => 800,
    database_type             => "MULTIPURPOSE",
    em_configuration          => "NONE",
    require                   => Oradb::Listener['start listener'],
  }
}

