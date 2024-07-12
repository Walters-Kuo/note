brew install virtualbox
brew install vagrant
vagrant box add precise64 http://files.vagrantup.com/precise64.box
vagrant init precise64
vagrant up
vagrant ssh
vagrant ssh --debug
vagrant halt

vagrant ssh-config > ssh_config
scp -F ./ssh_config default:/home/vagrant/.bashrc .

vagrant ssh-config
Host u1
  HostName 127.0.0.1
  User vagrant
  Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /Users/walters/workarea/vagrant/.vagrant/machines/default/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL