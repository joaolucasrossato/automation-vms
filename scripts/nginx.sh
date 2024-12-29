#!/bin/bash

echo "Instalando Nginx..."
apt-get install -y nginx
echo "Verificando serviço Nginx..."
systemctl start nginx
 systemctl enable nginx
 systemctl status nginx || echo "Erro ao iniciar o Nginx."