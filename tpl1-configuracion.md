TPL 1 - Configuración inicial de la red del laboratorio
=======================================================

**Fecha de Entrega:** Luján 28/03/2019

**Objetivo:** Conocer el procedimiento inicial y hacer habitual la práctica de configuración de un host en una red basada en el juego de protocolos TCP/IP.

#### Notas para ayudantes

* Por Florge 2019. Cambiado dmesg por ip link, . ¿Será necesario poner una salida de ip link show explicándola? tshark por tcpdump, y reordenado el punto de asignar nombre al host.

* Durante la primera práctica de 2018 encontramos las siguientes cuestiones para resolver/corregir:
  * En el punto 1, la herramienta `mii-tool` no devuelve si hay enlace o no (de hecho, indica que "no conoce la interfaz") mientras la interfaz está dada de baja (que es lo normal cuando se inicia el sistema).
    * Una alternativa viable es reemplazar el comando `mii-tool` por `ip link set group default up` (o el que corresponda a la/las interfaces disponibles) y luego verificar mediante `ip link show` que en alguna NO diga NO-CARRIER.
  * Asociado a lo anterior, a los estudiantes les cuesta determinar mediante `dmesg` cual es la interfaz (además de "qué es una interfaz"), debido al reciente cambio de nomenclatura `ethN` ==> `enpNsN`.
    * Una alternativa viable es reemplazar el uso de dmesg con `ip link show`, e indicar que los números de la izquierda indican la cantidad de interfaces, y que una máquina por defecto tiene `lo` y las interfaces de red que siguen. Hay que dejarles bien claro que _interfaz_ es la denominación del dispositivo que allí aparece, y que en todo lo sucesivo donde diga _interfaz_ hay que reemplazarlo por dicho "nombre".
  * Por otro lado, hay que remover todas las referencias a ethN del TP.

#### --- Fin notas para ayudantes ---

**Consignas**

Salvo indicación en contrario, todos los comandos siguientes se deben ejecutar con permisos de usuario administrador (`root`). Para obtenerlos, utilice el comando `su`.

1. Verificar la/s interfaces físicas de red (NIC) que el sistema operativo haya detectado. Para ello, utilizar el comando `ip link show`, el cual muestra las interfaces físicas y su estado. El primer dígito en cada línea es el número de interfaz (comúnmente llamada _placa de red_), el segundo texto es el nombre de la interfaz, y lo que figura entre símbolos <> es su estado.

    Las interfaces con nombres `eth{N}`, `eno{N}`, `ens{N}f{N}`, `enp{N}s{N}`, `w{N}g{N}` son interfaces físicas (_hardware real_). Existe al menos una interfaz virtual denominada `lo` o `loopback` y es posible que existan otras interfaces virtuales con nombres diversos (`tun{N}`, `br{N}`, ...).

    El primer paso de este práctico es determinar cual de todas las interfaces es la real y tomar nota de su nombre. Aparecerá en el listado con el estado _BROADCAST_.

        ip addr add dev {interfaz} {dirección_IP[/{prefijo_máscara]} \
           [broadcast {dir_difusión}]
        ip link set dev {interfaz} up   # "levantar" el enlace de red

    Por ejemplo:

        ip addr add dev {interfaz} 192.168.0.143/24 broadcast 192.168.0.255
        ip link set dev {interfaz} up

    Verificar configuración con:

        ip addr show

3. Verificar que es posible contactar a otros 2 equipos de la red utilizando el comando `ping`:

        ping {DIRECCIÓN IP}

4. Configuración del nombre del equipo:

    a. Temporal: utilizando el comando `hostname`:

            hostname {nombre_equipo}

         donde `{nombre_equipo}` es el nombre que le corresponde al equipo según el diagrama establecido de la red.

    b. Permanente: Editar el archivo `/etc/hostname`, asignando el nombre que le corresponde al equipo.

\pagebreak

5. Resolución de nombres de hosts a direcciones IP.

    a. Completar el archivo `/etc/hosts` con los nombres y las direcciones de red de al menos 2 máquinas del laboratorio para la resolución local de nombres.

    b. Verificar que es posible contactar otros 2 equipos de la red utilizando nombres de host ejecutando `ping {NOMBRE DE HOST}`

7. Ver la tabla de ruteo definida utilizando el comando `ip route show`.  
   ¿Cuáles son las redes accesibles?

8. Agregar la dirección `10.4.11.30` como ruta por defecto para acceder a otras redes:

        ip route add default via 10.4.11.30

    Verificar nuevamente la tabla de ruteo.

9. Realizar una captura de las PDU intercambiadas mientras se utiliza el comando `ping` para verificar conectividad con otro equipo. Las acciones que debe realizar son:

    a. Iniciar la captura redireccionando la salida a un archivo para su posterior análisis:

            tcpdump -n -p -w NOMBRE_ARCHIVO.PCAP 'icmp && host DIRECCION_IP'

        Parámetros utilizados:

        -n
        : no resuelve nombres de objetos de red (por ej. nombres de host, puertos TCP y UDP).

        -p
        : no capturar en modo promiscuo.

        -w
        : guarda paquetes capturados en el archivo indicado.

        'icmp && host DIRECCION_IP'
        : filtrar, en este caso, sólo tramas que lleven mensajes de protocolo ICMP **y** provengan o estén destinadas a la dirección IP especificada.

    b. En otra terminal ejecutar el comando ping para enviar un mensaje ICMP Echo Request:

            ping Dirección_IP -c 3

    c. Una vez obtenida la respuesta del comando _ping_ (deberán recibirse tres respuestas), detener la captura (finalizar el proceso _tcpdump_ presionando **Ctrl+C**)

    d. Analizar el volcado del programa de captura utilizando la aplicación wireshark (o cualquier otro analizador de tráfico que permita leer archivos en formato _pcap_), representando en un gráfico ideado por usted el intercambio de mensajes. Indicar cuál es la función de cada uno identificando los datos de encabezados mas relevantes.

**Bibliografía**

* Guía del comando TCPdump. Jeremy Stretch. Traducido al español por el equipo de LabRedes  
  <http://www.labredes.unlu.edu.ar/files/site/data/tyr/tcpdump-esp-draft1.pdf>
* "Redes globales de información con Internet y TCP/IP". Tercera Edición. Douglas E. Comer, Prentice Hall. Capítulo 5: "Transformación de direcciones Internet en direcciones físicas.
* "Comunicaciones y Redes de Computadoras", Sexta Edición, William Stallings, Prentice Hall. Capítulo 14.1: “Ethernet (CSMA/CD)”
* El manual del Administrador de Debian. Raphaël Hertzog, Roland Mas. Freexian. 2016.  
  Apéndice B: "Curso breve de emergencia"  
  <https://debian-handbook.info/browse/es-ES/stable/short-remedial-course.html>
* Tcpdump Examples: Practical examples to lift your network troubleshooting.  
  Hacker Target Pty Ltd. 2018  <https://hackertarget.com/tcpdump-examples/>


\pagebreak

Mapa de la red del laboratorio
==============================

![](images/topologia-laboratorio.png)

* Dirección de red: **10.4.11.0**
* Máscara de red: **255.255.255.0** o bien **/24**
* Dirección de broadcast: **10.4.11.255**
