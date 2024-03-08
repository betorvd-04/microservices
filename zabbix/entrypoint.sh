#!/bin/bash

# Configuraciones adicionales si es necesario

# Iniciar servicios
service zabbix-server start
service zabbix-agent start
service apache2 start

# Mantener el contenedor en ejecución
tail -f /dev/null