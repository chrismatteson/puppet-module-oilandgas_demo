class oilandgas_demo::usecase1::base (
  $asset_tag = 'test',
) {

  registry::value { 'ASSET_TAG':
    key    => 'HKLM\Software\Vendor\Puppet',
    data   => $asset_tag,
  }
}
