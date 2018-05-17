Receta Captura TP Integrador
============================

Este es una especie de racconto para Ayudantes y Docentes, con notas y tareas
que se deben efectuar a fin de preparar el aula y los equipos para efectuar
la Captura Final de Teleinformática y Redes con pocas (o nulas) dificultades.

Para captura 2018
-----------------

En la topología hay un servidor DHCP que asigna direcciones IP a los clientes, por lo que adicionalmente a los borrados que haya que hacer en los equipos, en los clientes deben hacer algo como:

    pkill dhclient           # matar el demonio dhclient
    ip addr flush dev ethX   # eliminar todas las direcciones asignadas
    ip link set ethX down    # dar de baja el enlace
    dhclient ethX            # pedir una nueva dirección IP
    # validar que dhclient hace UP del enlace

También se adiciona un recurso dinámico (cgi o php), en el mismo servidor que tiene las imágenes.

En cuanto a hardware
--------------------

- Designar qué equipos operarán como Routers, y cual será el DNS.
- Conectar las interfaces de todos los equipos intervinientes, incluyendo
  servidores y clientes, en las bocas del HUB.


En todos los equipos que participan
-----------------------------------

Escribir estos pasos en el pizarrón para que todos puedan leerlos y ejecutarlos.

- Detener los servicios superfluos:

        #!/bin/sh
        service apache2 stop
        service exim4 stop
        service nfs-common stop
        service openbsd-inetd stop
        service rpcbind stop
        service ssh stop
        service squid3 stop
        service avahi-daemon stop
        service ntpdate stop
        service ntp stop
        pkill apache
        pkill squid

- Para verificar los procesos que están corriendo y ver si es necesario terminar alguno adicional:

        netstat -tplnu

- Eliminar las direcciones de red existentes:

        ip addr flush dev ethN

- Deshabilitar TCP Segmentation Offloading

        ethtool --offload ethN tso off

- Previo a cada captura, eliminar la tabla ARP con: (Indicar y obligar que lo hagan):

        ip neigh flush all


En los equipos que capturan
---------------------------

- Realizar la captura con tshark para evitar resoluciones innecesarias:

        tshark -i eth0 -n -w legajo.pcap

- Para ver la salida por CLI (1 trama por linea)

        tshark -i eth0 -n


En el cliente HTTP
------------------

- Configurar las interfaces de red, la resolución DNS y las rutas necesarias. [^1]

- Deshabilitar la descarga de `favicon.ico` en `about:config` de Firefox.

        browser.chrome.favicons	false
        browser.chrome.site_icons  false

- Deshabilitar el uso de caché en el navegador. Encontrado en el foro de Mozilla:

        Ingresar en about:config
        Buscar browser.cache.disk.enable y setear en false
        (Reiniciar Firefox)
        Repetir los ultimos 2 pasos para browser.cache.memory.enable

- Agregar las direcciones siguientes a `/etc/hosts`

        127.0.0.3	safebrowsing.google.com
        127.0.0.3	adblockplus.mozdev.org
        127.0.0.3	www.netsurf-browser.com
        127.0.0.3	tiles.services.mozilla.com
        127.0.0.3	location.services.mozilla.com
        127.0.0.3	tiles-cloudfront.cdn.mozilla.net
        127.0.0.3	safebrowsing-cache.google.com
        (y otras que no recuerdo)

    a fin de evitar que se consulte DNS por esos dominios.

- Agregar las direcciones anteriores como excepciones al proxy en el navegador.
- Verificar que es posible consultar las páginas solicitando el archivo `000000.html` 
  que debería instalarse en el webserver previamente.
- En el primer acceso al sitio seguro, aceptar el certificado auto-firmado 
  provisto por el servidor.

Nota:

- La respuesta HTTP resulta ser de tipo HTML (`Content-Type: text/html`), sin 
  embargo la codificación es GZip (`Content-Encoding: gzip`) tanto en el 
  mensaje del servidor web como en el servidor proxy (visible si se realiza 
  `Follow TCP stream` sobre el flujo). Una posible solución a este 
  comportamiento es desactivar el módulo `deflate` en Apache2 mediante:

        a2dismod deflate
        service apache2 restart

    pero sería interesante que los estudiantes detecten tal característica.


En el servidor DNS
------------------

- Configurar las interfaces de red y las rutas necesarias. [^1]

- Instalar BIND:

        apt-get install bind9

- Copiar la configuración local a `/etc/bind`

        cp named.conf.local /etc/bind/

- Copiar la base de datos de zona a `/var/cache/bind`

        cp orgx.com /var/cache/bind/

- Desactivar el uso de DNSSEC añadiendo a `/etc/bind/named.conf.options`
  las sentencias siguientes:

        dnssec-enable false;
        dnssec-validation false;

- Reiniciar el demonio BIND, verificar que se inició correctamente:

        service bind9 restart
        tail /var/log/syslog

- Realizar una consulta al DNS local y verificar que existe respuesta:

        dig @127.0.0.1 www.orgx.com


En el servidor Proxy HTTP
-------------------------

- Configurar las interfaces de red, la resolución DNS (Archivo `resolv.conf`) y las rutas necesarias. [^1]
- Instalar Squid3 [^1]

        apt-get install squid3

- Habilitar el servicio a todas las direcciones, en `/etc/squid3/squid.conf`

        # Reemplazar
        # http_access deny all
        # por
        http_access allow all
        # o bien
        # http_access allow $DIRECCION_DE_RED

- Squid hace caché en memoria y, opcionalmente, en disco. Para vaciar el caché, ejecutar:

        #!/bin/sh
        service squid3 stop
        rm -r /var/spool/squid/*
        squid3 -k
        service squid3 start

    Esto es necesario solo en casos donde se solicite algo al proxy previo al
    momento de las capturas y haya que repetir el request.

- Opcionalmente, desactivar el caché por completo, en `/etc/squid3/squid.conf`,
  según lo indicado en  
  <http://wiki.squid-cache.org/SquidFaq/ConfiguringSquid#Can_I_make_Squid_proxy_only.2C_without_caching_anything.3F>

        cache deny all

En las capturas de 2017, el proxy Squid hizo caché de la resolucion de nombres
de dominio, por lo tanto en muchas peticiones no se observa consulta DNS alguna.

En tal sentido, es probable que haya que definir la sentencia siguiente en el
archivo de configuración de Squid. Ver 
<http://www.squid-cache.org/Versions/v3/3.3/cfgman/positive_dns_ttl.html>

        positive_dns_ttl a 10 seconds

Alternativamente, en la definición de la zona DNS en BIND, acortar el TTL del
SOA para reducir la chance de que se almacene entre distintas capturas.


En los routers
--------------

- Configurar las interfaces de red y las rutas necesarias. [^1]
- Habilitar el reenvío de paquetes:

        # echo 1 > /proc/sys/net/ipv4/ip_forward
        sysctl -w net.ipv4.ip_forward=1   # esto hace lo mismo

Notas:

- Según lo visto (por los estudiantes), la respuesta ARP a una consulta se 
  realiza sobre **todas** las interfaces de red en las que se tenga asignada 
  una dirección IP, según lo documentado en 
  <http://linux-ip.net/html/ether-arp.html>, 
  <https://openvz.org/Multiple_network_interfaces_and_ARP_flux>, y 
  en la documentación del kernel linux `Documentation/networking/ip-sysctl.txt`. 
  Una posible solución a este comportamiento es definir `arp_filter=1`:

        sysctl -w net.ipv4.conf.all.arp_filter=1

    o definir `arp_ignore` y `arp_announce`, pero sería interesante que ellos
    mismos detecten el comportamiento extraño.

- Desactivar ICMP redirect en routers y equipos (Esto lo hace el equipo docente)

Cuando se definen distintas redes IP sobre una misma red Ethernet, es 
posible que los equipos en distintas redes omitan pasar por los routers 
asignados en rutas estáticas. Para corregir este comportamiento, 
desactivar el envío y la aceptación de ICMP redirect en todas las 
interfaces (all) Y EN LA INTERFAZ ethX adecuada también (pues, por lo 
visto, esta opcion de configuración tiene mayor prioridad).

        for i in /proc/sys/net/ipv4/conf/*/{accept,send}_redirects; do
          echo 0 > $i;
        done


En el router con NAT (Router C)
-------------------------------

- Configurar las interfaces de red y las rutas necesarias. [^1]

- Habilitar NAT con el script siguiente:

        #!/bin/sh
        IF_INTERNA=eth0
        IF_EXTERNA=eth1
        IP_EXTERNA=123.12.23.43
        # elimino las configuraciones previas
        iptables -F; iptables -t nat -F; iptables -t mangle -F
        # alternativa 1 (snat). Preferida
        #iptables -t nat -A POSTROUTING -o $IF_EXTERNA -j SNAT --to $IP_EXTERNA
        # alternativa 2 (masquerade)
        iptables -t nat -A POSTROUTING -o $IF_EXTERNA -j MASQUERADE
        # habilito el reenvio
        echo 1 > /proc/sys/net/ipv4/ip_forward


En los servidores HTTP
----------------------

- Configurar las interfaces de red y las rutas necesarias. [^1]
- Instalar apache2 [^1]

        apt-get install apache2

- Copiar los recursos a servir en `/var/www/` o `/var/www/html/` (según 
  la versión) y asignar permisos de lectura a todos los usuarios.
- Verificar que es posible obtener un recuro con wget:

        wget http://127.0.0.1/

- Para evitar tener que cerrar el browser para que se produzcan los cierres
  de conexion TCP, se puede deshabilitar KeepAlive desde el web server.
  En el archivo `/etc/apache2/conf/httpd.conf`

        KeepAlive Off


En el servidor HTTPS
--------------------

- Configurar las interfaces de red y las rutas necesarias. [^1]
- Instalar apache2 y el módulo SSL

        apt-get install apache2 libapache2-mod-ssl

- Copiar los recursos a servir en `/var/www/` o `/var/www/html/` (según 
  la versión) y asignar permisos de lectura a todos los usuarios.
- Habilitar el módulo, el sitio `default-ssl`, y deshabilitar el
  sitio inseguro `default`:

        a2enmod ssl
        a2ensite default-ssl
        a2dissite default
        service apache2 restart

- Agregar un conjunto de datos `000000.html`, `000000-1.png` y `000000-2.png` 
  para pruebas sin necesidad de utilizar los archivos de los alumnos.

- Verificar que es posible obtener un recurso con wget:

        wget --no-check-certificate https://127.0.0.1/


En equipo de captura
--------------------

Tener Wireshark o Tshark encendido para monitorear el tráfico de la red.


Pasos para la captura
---------------------

Estos pasos son los mínimos para realizar la captura de cada uno de los legajos.

 1. ip neigh flush all
 2. Iniciar capturas en equipos designados. legajo.pcap
 3. Abrir navegadores en equipos designados.
 4. Ir a URL http://www.orgx.com/legajo.html
 5. Esperar que se descargue toda la pagina
 6. Esperar 10seg
 7. Cerrar navegador
 8. Finalizar Captura

Repetir estos pasos por cada legajo.

[^1]: tarea de los estudiantes.
