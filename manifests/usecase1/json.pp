class oilandgas_demo::usecase1::json {

  file { '/tmp/BuildServer1.JSON':
    ensure => file,
    source => "puppet:///modules/${module_name}/BuildServer1.JSON",
  } ->

  augeas { '/tmp/BuildServer1.JSON':
    incl    => '/tmp/BuildServer1.JSON',
    lens    => 'Json.lns',
    changes => [
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "AMIID"]/dict/entry[.= "Default"]/string "ami-c8492cde"',
      'rm /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "t1.micro"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "t2.nano"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "t2.micro"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "t2.small"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "t2.medium"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "t2.large"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m1.small"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m1.medium"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m1.large"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m1.xlarge"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m2.xlarge"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m2.2xlarge"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m2.4xlarge"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m3.medium"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m3.large"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m3.xlarge"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m3.2xlarge"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m4.large"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m4.xlarge"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m4.2xlarge"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m4.4xlarge"',
      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Parameters"]/dict/entry[.= "InstanceType"]/dict/entry[.= "AllowedValues"]/array/string[last() +1] "m4.10xlarge"',
#      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Resources"]/dict/entry[.= "EC2TestServer1"]/dict/entry[.= "Properties"]/Imageid/string "AMIID"',
#      'set /files/tmp/BuildServer1.JSON/dict/entry[.= "Resources"]/dict/entry[.= "EC2TestServer1"]/InstanceType/string "InstanceType"'
    ],
  }

}
