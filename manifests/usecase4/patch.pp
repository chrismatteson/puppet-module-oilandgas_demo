class oilandgas_demo::usecase4::patch (
  $java_version = '1.7.0.111-2.6.7.2.el6_8',
  $python_version = '2.6.6-52.el6',
  $perl_version = '5.10.1-136.el6',
) {

  package { 'java-1.7.0-openjdk':
    ensure => $java_version,
  }
  package { 'python':
    ensure => $python_version,
  }
  package { 'perl':
    ensure => $perl_version,
  }

}
