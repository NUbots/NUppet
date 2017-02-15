class initial_apt_update {
  # Perform a single `apt-get update` before installing ANY packages.
  exec { "initial_apt_update":
    command => "/usr/bin/apt-get update"
  } -> Package <| |>
}

node /^darwin\d+$/ {
  include initial_apt_update

  # # define variables for this node
  $username = 'nubots'

  # essential dependencies
  package { 'libgfortran3': ensure => latest }
  package { 'ifenslave': ensure => latest }
  package { 'xboxdrv': ensure => latest }
  package { 'software-properties-common': ensure => latest }

  # Essential packages for point grey cameras.
  package { 'libgomp1': ensure => latest }
  package { 'libswscale-ffmpeg3': ensure => latest }
  package { 'libavcodec-ffmpeg56': ensure => latest }
  package { 'libavformat-ffmpeg56': ensure => latest }

  # Non-essential developer tools:
  class { 'vim':  username => $username }
  package { 'screen': ensure => latest }
  package { 'htop': ensure => latest }
  package { 'gdb': ensure => latest }
  package { 'linux-headers-generic': ensure => latest }
  package { 'dos2unix': ensure => latest }
}

node /^igus\d+$/ {
  include initial_apt_update

  # # define variables for this node
  $username = 'nubots'

  # essential dependencies
  package { 'libgfortran3': ensure => latest }
  package { 'ifenslave': ensure => latest }
  package { 'xboxdrv': ensure => latest }
  package { 'software-properties-common': ensure => latest }

  # Essential packages for point grey cameras.
  package { 'libgomp1': ensure => latest }
  package { 'libswscale-ffmpeg3': ensure => latest }
  package { 'libavcodec-ffmpeg56': ensure => latest }
  package { 'libavformat-ffmpeg56': ensure => latest }

  # Non-essential developer tools:
  class { 'vim':  username => $username }
  package { 'screen': ensure => latest }
  package { 'htop': ensure => latest }
  package { 'gdb': ensure => latest }
  package { 'linux-headers-generic': ensure => latest }
  package { 'dos2unix': ensure => latest }
}
