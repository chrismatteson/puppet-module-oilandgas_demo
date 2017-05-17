class oilandgas_demo::usecase1::base {

  registry::value { 'ASSET_TAG':
    key    => 'HKLM\Software\Vendor\Puppet',
    data   => 'test'
  }
}
