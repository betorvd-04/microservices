FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Instalar dependencias y limpiar la caché
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Instalar el repositorio de Zabbix y Zabbix Server
RUN wget https://repo.zabbix.com/zabbix/6.4/ubuntu-arm64/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu22.04_all.deb && \
    dpkg -i zabbix-release_6.4-1+ubuntu22.04_all.deb && \
    apt-get update && \
    apt-get install -y zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copiar configuraciones y scripts
COPY 000-default.conf /etc/apache2/sites-available
COPY entrypoint.sh /entrypoint.sh

# Establecer permisos de ejecución para el script de inicio
RUN chmod +x /entrypoint.sh

# Exponer el puerto 80 del contenedor
EXPOSE 80

# CMD para ejecutar el script de inicio
CMD [ "/entrypoint.sh" ]