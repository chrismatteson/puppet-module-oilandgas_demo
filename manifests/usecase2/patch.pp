class oilandgas_demo::usecase2::patch {

  package { 'sqlserver2014express':
    ensure   => present,
    provider => 'chocolatey',
  }

#  package { 'sql-server-express':
#    ensure   => present,
#    provider => 'chocolatey',
#  }

  file 

}
