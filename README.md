# glpi
base para a instalação do servidor glpi

## compilar a imagen
comando: docker build -t cezarrossi/glpi:beta-5.18 . 

## comando para compilar os servidores 
comando: docker composer up -d >(obs dentro da pasta do compose file)

## comando para para as maquinas e removelas da memoria 
comand: docker-compose down -v --rmi all --remove-orphans (obs dentro da pasta do compose file)
