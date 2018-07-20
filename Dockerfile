# Usa la ultima version de openjdk
FROM openjdk:latest

MAINTAINER Equipo Eventos_Ceura

# Copia librerias (ficheros jar) al destino y un script de arranque

COPY dependencias/*.jar /usr/apps/kafka/dependencias/
COPY EventosKafka.jar /usr/apps/kafka
COPY arranqueConsumidor.sh  /usr/apps/kafka

# Establece el directorio de trabajo
WORKDIR /usr/apps/kafka

# Arranque de la aplicacion
# CMD ["/scripts/arranqueConsumidor.sh"]
# ENTRYPOINT exec /usr/apps/kafka/arranqueConsumidor.sh
ENTRYPOINT ["sh", "/usr/apps/kafka/arranqueConsumidor.sh"]