class heat::install {

  include heat::params

  package { 
    $::heat::params::heat_packages: 
      ensure => "installed" 
  }
  
}
