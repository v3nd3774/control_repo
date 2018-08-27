class minecraft {
  file {'/opt/minecraft':
    ensure  => directory,
  }
  file {'/opt/minecraft/server.jar':
    ensure  => file,
    source  => 'https://launcher.mojang.com/mc/game/1.13.1/server/fe123682e9cb30031eae351764f653500b7396c9/server.jar',
  }
  package {'java':
    ensure  => present,
  }
  file {'/opt/minecraft/eula.txt':
    ensure  => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure  => file,
    source  => 'puppet:///modules/minecraft/minecraft.service',
  }
  service {'minecraft':
    ensure  => running,
    enable  => true,
  }
}
