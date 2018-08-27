class minecraft (
  $url = 'https://launcher.mojang.com/mc/game/1.13.1/server/fe123682e9cb30031eae351764f653500b7396c9/server.jar',
  $install_dir = '/opt/minecraft'
){
  file {$install_dir:
    ensure  => directory,
  }
  file {"${install_dir}/server.jar":
    ensure  => file,
    source  => $url,
    before  => Service['minecraft'],
  }
  package {'java':
    ensure  => present,
  }
  file {"${install_dir}/eula.txt":
    ensure  => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure  => file,
    source  => epp('minecraft/minecraft.service', {
      install_dir => $install_dir
    })
    require => [Package['java'], File["${install_dir}/eula.txt"], File['/etc/systemd/system/minecraft.service']],
  }
  service {'minecraft':
    ensure  => running,
    enable  => true,
  }
}
