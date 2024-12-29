Vagrant.configure("2") do |config|

  config.vm.box = "debian/bookworm64"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "4096"
    vb.cpus = "2"
  end

  config.vm.provision "shell", inline: <<-SHELL
    echo "Atualizando repositórios e instalando dependências..."
    apt-get update -y && apt-get upgrade -y
    apt-get install -y ca-certificates curl gnupg lsb-release
  SHELL

  config.vm.provision "shell", inline: <<-SHELL
    echo "Copiando scripts para a VM e definindo permissões..."
    cp /vagrant/scripts/*.sh /tmp/
    chmod +x /tmp/*.sh
  SHELL

  config.vm.provision "shell", path: "scripts/docker.sh"
  config.vm.provision "shell", path: "scripts/nginx.sh"
  config.vm.provision "shell", path: "scripts/mysql.sh"

end