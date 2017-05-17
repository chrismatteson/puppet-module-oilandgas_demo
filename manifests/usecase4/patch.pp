class oilandgas_demo::usecase4::patch (
  $java_version = '1.7.0.111-2.6.7.8.el7',
  $python_version = '2.7.5.34-el7',
  $perl_version = '5.16.3-286.el7',
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
