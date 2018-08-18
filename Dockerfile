# Usa la ultima version de openjdk
FROM openjdk:latest

MAINTAINER Equipo Eventos_Ceura

RUN apt-get update

# Instala la utilidad nmap (Network Mapper) 
RUN apt-get install nmap -y

# Copia librerias (ficheros jar) al destino y un script de arranque
COPY dependencias/*.jar /usr/apps/kafka/dependencias/
COPY EventosKafka.jar /usr/apps/kafka
COPY wait-for /usr/apps/kafka
COPY arranqueConsumidor.sh  /usr/apps/kafka

# Establece el directorio de trabajo
WORKDIR /usr/apps/kafka

# Arranque de la aplicacion
#ENTRYPOINT ["sh", "/usr/apps/kafka/arranqueConsumidor.sh"]
ENTRYPOINT ["sh", "/usr/apps/kafka/wait-for", "kafka:9092", "-s", "10", "-t", "120", "--", "sh", "/usr/apps/kafka/arranqueConsumidor.sh"]


