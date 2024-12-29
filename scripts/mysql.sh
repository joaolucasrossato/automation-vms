echo "Instalando MySQL..."
apt-get install -y mysql-server
echo "Configurando MySQL..."
mysql --user=root <<-EOF
    CREATE DATABASE mydb;
    CREATE USER 'user'@'%' IDENTIFIED BY 'senha';
    GRANT ALL PRIVILEGES ON mydb.* TO 'user'@'%';
    FLUSH PRIVILEGES;
EOF
echo "Verificando serviço MySQL..."
systemctl start mysql
systemctl enable mysql
systemctl status mysql || echo "Erro ao iniciar o MySQL."
