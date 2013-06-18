class heat::client {

  case $::osfamily {
    RedHat: {
      $hc_package = 'python-heatclient'
    }
    Debian: {
      $hc_package = 'python-heatclient'
    }
    default: {
      fail("${::hostname}: This module does not support operatingsystem ${::osfamily}")
    }
  }

  package { $hc_package:
    ensure => installed,
  }

}
