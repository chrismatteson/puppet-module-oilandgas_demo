class oilandgas_demo::usecase3::nginx {

  include nginx

  file { 'index.html':
    ensure  => file,
    source  => template(${module_name/index.html),
    require => Class['nginx'],
  }
}
