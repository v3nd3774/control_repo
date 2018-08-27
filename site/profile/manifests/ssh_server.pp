class profile::ssh_server {
  package {'openssh-server':
    ensure  => present,
  }
  service {'sshd':
    ensure  => 'running',
    enable  => 'true',
  }
  ssh_authorized_key {'root@master.puppet.vm':
    ensure  => present,
    user    => 'root',
    type    => 'ssh-rsa',
    key     => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJsdvRm5w6U+c26iWMusZnQ/FyCuRGLZftr9R0jXBTS0oXIC0wfBXqdwcOzGeAmzrzrhxlSkFY3eMTlq/XYtpl+YL7rzYSta3ADZfn3vfuRc9NGDxISyCQo/CibeH+VP/IV2MVd5t2O+os6XgQUiOUfQquyQZRyx6RC7JVu5V9EL/hdFgVHuNRQTWZgj8t71No2EuKFsbsascaL6tW+Mw5/8KDOLieiwvTY4DL5jQpv+hPZFJ/rxSvsCzIIfow/P49RyFd75ZtXwEi2h0mIlB4zsSMUY05iiwlOBZ7R9C0HXnDGcY0e+tBmiXo2+nq16QXMA7DnktUsjszFEvMMHNn',
  }
}
