class oilandgas_demo::usecase4::patch (
  $java_version = '1.7.0.111-2.6.7.2.el6_8',
  $python_version = '2.6.6-52.el6',
  $perl_version = '5.10.1-136.el6',
) {

  schedule { 'maint':
    period => daily,
    range  => '7:00 - 10:00',
    repeat => 10,
  }

  package { 'java-1.7.0-openjdk':
    ensure   => $java_version,
    schedule => 'maint',
  }
  package { 'python':
    ensure   => $python_version,
    schedule => 'maint',
  }
  package { 'perl':
    ensure   => $perl_version,
    schedule => 'maint',
  }

}
