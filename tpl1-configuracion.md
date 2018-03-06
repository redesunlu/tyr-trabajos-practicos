TPL 1 - Configuración inicial de la red del laboratorio
=======================================================

**Fecha de Entrega:** Luján 29/03/2018

**Objetivo:** Conocer el procedimiento inicial y hacer habitual la práctica de configuración de un host en una red basada en el juego de protocolos TCP/IP.

#### Notas para ayudantes

* Acá van notas nuestras que consideren pertinentes.
* En caso de requerir insertar un salto de pagina en cualquier parte del documento, escribir \pagebreak en una linea en blanco.
* Le saqué los # a los comandos porque los estudiantes lo escribían. Si hace falta, lo vuelvo a poner.

#### --- Fin notas para ayudantes ---

**Consignas**

Salvo indicación en contrario, todos los comandos siguientes se deben ejecutar con permisos de usuario administrador (`root`). Para obtenerlos, utilice el comando `su`.

1. Verificar que el sistema operativo haya detectado la/s interfaces físicas de red (NIC). A tal efecto utilizar el comando `dmesg` y buscar las referencias a la interfaz de red (`eth{n}` , `eno{N}` , `ens{N}f{N}` o `enp{N}f{N}`).

    Utilizar el comando `mii-tool` para verificar el estado del enlace para cada interfaz física de red.

2. Configuración del nombre del equipo:

    a. Temporal: utilizando el comando `hostname`:

            hostname {nombre_equipo}

        donde `{nombre_equipo}` es el nombre que le corresponde al equipo según el diagrama establecido de la red.

    b. Permanente: Editar el archivo `/etc/hostname`, asignando el nombre que le corresponde al equipo.

3. Configuración de interfaces de red para utilizar el protocolo TCP/IP:

    Para asignar direcciones de red a una interfaz e iniciar el enlace, utilizar el comando:

        ip addr add dev {interfaz} {dirección_IP[/{prefijo_máscara]} [broadcast {dir_difusión}]
        ip link set dev {interfaz} up   # "levantar" el enlace de red

    Por ejemplo,

        ip addr add dev eth2 192.168.0.143/24 broadcast 192.168.0.255
        ip link set dev eth2 up

    Verificar configuración con:

        ip addr show

4. Verificar conectividad con al menos 2 equipos de la red utilizando el comando `ping`:

        ping {DIRECCIÓN IP}

5. Resolución de nombres de hosts a direcciones IP. Completar el archivo `/etc/hosts` con los nombres y las direcciones de red de al menos 2 máquinas del laboratorio para la resolución local de nombres.

6. Verificar conectividad con al menos 2 equipos de la red utilizando nombres de host.

        ping {NOMBRE DE HOST}

7. Ver la tabla de ruteo definida utilizando el comando `ip route show` o `route`. ¿Cuáles son las redes accesibles?

8. Agregar la dirección `10.4.11.30` como ruta por defecto para acceder a otras redes:

        ip route add default via 10.4.11.30

    Verificar nuevamente la tabla de ruteo.

9. Realizar una captura de las PDU intercambiadas mientras se utiliza el comando `ping` para verificar conectividad con otro equipo. Las acciones que debe realizar son:

    a. Iniciar la captura redireccionando la salida a un archivo para su posterior análisis:

            tshark -n -V -f 'icmp && host Dirección_IP' > nombre_archivo

        Parámetros utilizados:

        -n
        : no resuelve nombres de objetos de red (por ej. nombres de host, puertos TCP y UDP)

        -V
        : Muestra decodificación de protocolos para cada trama.

        -f
        : filtro, en este caso, sólo tramas que contengan el protocolo icmp y la dirección ip especificada.

    b. En otra terminal ejecutar el comando ping para enviar un mensaje ICMP Echo Request:

            ping Dirección_IP -c 2

    c. Una vez obtenida la respuesta del comando _ping_, detener la captura (finalizar el proceso _tshark_ presionando **Ctrl+C**)

    d. Analizar el volcado del programa de captura, representando en un gráfico ideado por usted el intercambio de mensajes. Indicar cuál es la función de cada uno identificando los datos de encabezados mas relevantes.


#### Bibliografía

* Páginas de manual de cada comando utilizado.
* "Redes globales de información con Internet y TCP/IP". Tercera Edición. Douglas E. Comer, Prentice Hall. Capítulo 5: "Transformación de direcciones Internet en direcciones físicas.
* "Comunicaciones y Redes de Computadoras", Sexta Edición, William Stallings, Prentice Hall. Capítulo 14.1: “Ethernet (CSMA/CD)”

\pagebreak

Mapa de la red del laboratorio
==============================

![](images/topologia-laboratorio.png)

* Dirección de red: **10.4.11.0**
* Máscara de red: **255.255.255.0** o bien **/24**
* Dirección de broadcast: **10.4.11.255**
