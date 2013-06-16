class heat::params{

  case $::osfamily {
    'RedHat': {
      # package names
      $heat_packages=['openstack-heat-api',
                      'openstack-heat-api-cloudwatch',
                      'openstack-heat-api-cfn',
                      'openstack-heat-engine']

      # service names
      $api_service_name = 'openstack-heat-api'
      $api_cloudwatch_service_name = 'openstack-heat-api-cloudwatch'
      $api_cfn_service_name = 'openstack-heat-api-cfn'
      $engine_service_name = 'openstack-heat-engine'
    }
    'Debian': {
      # package names
      $api_package_name = 'heat-api'
      $api_cloudwatch_package_name = 'heat-api-cloudwatch'
      $api_cfn_package_name = 'heat-api-cfn'
      $engine_package_name = 'heat-engine'
      # service names
      $api_service_name = 'heat-api'
      $api_cloudwatch_service_name = 'heat-api-cloudwatch'
      $api_cfn_service_name = 'heat-api-cfn'
      $engine_service_name = 'heat-engine'
      # Operating system specific
      case $::operatingsystem {
        'Ubuntu': {
          $libvirt_group = 'libvirtd'
        }
        default: {
          $libvirt_group = 'libvirt'
        }
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: \
${::operatingsystem}, module ${module_name} only support osfamily \
RedHat and Debian")
    }
  }

}
