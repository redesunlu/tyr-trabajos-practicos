TPL - Capa de Enlace en LAN - Ethernet
=================================================

**Fecha de Entrega:** 

**URL de Entrega:** 

**Objetivo:**




# Primer parte: Revisión de la configuración de los dispositivos del laboratorio

Utilice para esta parte de la práctica el laboratorio de práctica Ethernet (<https://github.com/redesunlu/kathara-labs/blob/main/tarballs/kathara-lab_ethernet.tar.gz>)

El laboratorio cuenta con cuatro hosts (+ el capturador). 

Inicie el laboratorio y revise que las direcciones de hardware Ethernet (MACs) coinciden con las especificadas
en el archivo lab.conf

Anote en una tabla la configuración de cada dspositivo (dirección unicast y broadcast). 

Revise el contenido del directorio shared en todos los dispositivos.

# Segunda parte: Pruebas de transferencia

En el dispositivo capturador inicie la captura utilizando el comando tcpdump o tshark sobre la interfaz eth0 y redirija la salida a un archivo en el directorio /shared para su posterior análisis. (Ej. "`tshark -i eth0 -w - > /shared/captura_nc.pcap`")

En el host 1 ejecute el programa ethernet_host_A

python shared/ethernet_host_A


Analice la captura:

a) 


### Bibliografía



### Recursos en internet



### Referencia




