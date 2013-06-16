class heat::config {


  file{ 'heat-eng-conf':
    path =>"/etc/heat/heat-engine.conf",
    owner => 'heat',
    group => 'heat',
    mode  => '0640',
    ensure => 'present',
    require => Class['heat::install']
    
  }

    service { 'heat-api-cfn':
    ensure     => $service_ensure,
    name       => $::heat::params::api_cfn_service_name,
    enable     => $enabled,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['heat::install'],
  }


}
