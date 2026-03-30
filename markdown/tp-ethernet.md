TPL - Capa de Enlace en LAN - Ethernet
=================================================


**Objetivo:** Experimentar con el envío y recepción de tramas Ethernet, el formato y uso de las direcciones (unicast/broadcast) y la visualización de la información de capa de enlace en la captura.


## Revisión de la configuración de los dispositivos del laboratorio

Utilice para esta parte de la práctica el laboratorio de práctica Ethernet (<https://github.com/redesunlu/kathara-labs/blob/main/tarballs/kathara-lab_ethernet.tar.gz>)

El laboratorio cuenta con cuatro hosts (+ el capturador). 

Inicie el laboratorio y revise que las direcciones de hardware Ethernet (MACs) coinciden con las especificadas en el archivo lab.conf

Anote en una tabla la configuración de cada dspositivo (dirección unicast y broadcast). 

Revise el contenido del directorio shared en todos los dispositivos.

## Corrida de la captura

En el dispositivo capturador inicie la captura utilizando el comando tcpdump o tshark sobre la interfaz eth0 y redirija la salida a un archivo en el directorio /shared para su posterior análisis. (Ej. "`tshark -i eth0 -w - > /shared/captura_lab_ethernet.pcap`")

## Ejecución de los scripts

En los hosts (2, 3 y 4), ejecutar el programa `ethernet_listener_me.py`

En los otros hosts, ejecutar el programa `ethernet_listener_me.py`:

```bash
root@pc2:/# python3 shared/ethernet_listener_me.py

[!] IMPORTANTE: Este script requiere privilegios de administrador
    Ejecutar con: sudo python3 ethernet_host_B.py

============================================================
Escuchando tramas Ethernet (Capa 2) para: 46:a5:99:b0:8a:63
============================================================
ether broadcast or ether dst 46:a5:99:b0:8a:63

[*] Configuración:
    - Interfaz: eth0
    - Filtro: ether broadcast or ether dst 46:a5:99:b0:8a:63

[*] Esperando tramas...
[*] Presionar Ctrl+C para detener
```

Este programa se quedará a la espera de tramas e imprimirá por pantalla lo que recibe destinado a la mac address del host o por broadcast.

Luego, en el host 1 ejecute el programa `ethernet_sender_host.py` para enviar una trama en la red. El programa finaliza luego de enviar una trama.

```bash
root@pc1:/# python3 shared/ethernet_sender_host.py 46:a5:99:b0:8a:63 Hola_Mundo

[!] IMPORTANTE: Este script requiere privilegios de administrador
    Ejecutar con: sudo python3 ethernet_sender_host.py

============================================================
Enviando desde  be:44:47:95:e7:44 a 46:a5:99:b0:8a:63  :  Hola_Mundo
============================================================

[*] Trama construida:
###[ Ethernet ]###
  dst       = 46:a5:99:b0:8a:63
  src       = be:44:47:95:e7:44
  type      = 0x9000
###[ Raw ]###
     load      = 'Hola_Mundo'


[*] Enviando trama por interfaz eth0...
.
Sent 1 packets.

[✓] Trama enviada exitosamente!
```

Se recomienda leer y revisar el código fuente de ambos scripts a fines de comprender los fundamentos de funcionamiento.

### Escenarios de prueba y análisis

 Realizar una captura de cada uno de los siguientes casos y elaborar un análisis del mismo:

 1. Enviar una trama a un único destino, mientras corre el script recibidor en cada host.

 1. Enviar una trama a una mac address que no existe en la red.

 1. Enviar una trama broadcast, mientras corre el script recibidor en cada host, a ver quién lo recibe.

 1. Modificar la mac de origen en el script de envío por una no existente en la red, y probarlo

 1. Configurar la mac de origen en el script de envío, colocando la dirección MAC de otro nodo en la red. Probar enviar una trama a distintos destinos.


### Bibliografía
[FOR07] Capítulo 13: “Lan Cableadas: Ethernet”
[KUR12] Capítulo 5.4 y 5.5: "Capa de Enlace y Redes de Área Local"







