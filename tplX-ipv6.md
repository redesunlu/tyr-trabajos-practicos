Clase Teórico-Práctica de Protocolo IPv6 (Presencial)
=====================================================

#### Notas para ayudantes

Los apuntes teóricos están documentados en [Apuntes de Teoría sobre IPv6](./apuntes-ipv6).

(falta incluir el gráfico de topología IPv6 del Aula para 2018)

Definir un equipo que operará de router entre el uplink y la red del aula, a fin de separar los enlaces para que la captura en el aula sea lo más limpia posible. **Validar que la boca 24 es la de uplink**.

Si fuera necesario establecer autoconfiguración dinámica en Debian, agregar lo siguente en `/etc/network/interfaces`

    auto-hotplug INTERFAZ
    iface INTERFAZ inet6 auto

Recordar que si bien RADVD puede enviar el DNS como una opción dentro del Router Advertisement, aún no es posible que los sistemas Debian tomen el DNS y lo configuren en `resolv.conf`.

#### Configuración para salir con IPv6 desde el Aula 411

Lo más sencillo es utilizar túnel para portar IPv6 sobre IPv4 entre el router de las aulas (que NO tiene IPv6) hasta _barza_ o _router1_ (que tienen IPv6) o bien soda (que puede tener IPv6) según lo indicado en <https://juncotic.com/tunel-ipv6-montando-tunel-ipv6/>

![](./images/esquema-conexion-ipv6.png)

En el caso de querer utilizar el equipo _soda_ para salir por IPv6, previamente asignar la siguiente dirección al mismo y habilitar ruteo:

    # dar direccion ipv6 de red unlu
    ip address add 2800:110:1018:bbbb::37/64 dev enp1s0
    ip route add default via 2800:110:1018:bbbb::1 dev enp1s0

    # crear tunel contra router aulas
    ip tunnel add net6tun mode sit remote 170.210.101.126 local 170.210.96.37
    ip link set net6tun up
    ip route add 2800:110:1018:411::/64 dev net6tun

    sysctl -w net.ipv6.conf.all.forwarding=1
    # establecer reglas de fw para permitir forwarding de trafico ipv6

En el router 1 (central)

    ip route add 2800:110:1018:411::/64 via 2800:110:1018:bbbb::37 dev INTERFAZ

En el router de Aulas

    ip tunnel add net6tun mode sit remote 170.210.96.37 local 170.210.101.126
    ip link set net6tun up
    ip route add ::/0 dev net6tun
    ip route add 2800:110:1018:411::/64 via fe80::...:9999 dev eth0    # ← aqui fe80::...:9999 es la Link-Local del equipo del aula
    sysctl -w net.ipv6.conf.all.forwarding=1
    # establecer reglas de fw para permitir forwarding de trafico ipv6

En UNO de los equipos del aula, que actuará como router local

    ip addr add 2800:110:1018:411::1/64 dev eth1
    ip route add ::/0 via fe80::...:126 dev eth0    # ← aqui fe80::...:126 es la Link-Local del router de Aulas
    sysctl -w net.ipv6.conf.all.forwarding=1

En cualquiera de los equipos del laboratorio

    ip addr add 2800:110:1018:411::xx/64 dev eth0
    ip route add ::/0 via 2800:110:1018:411::1 dev eth0

Nota: para restablecer todo una vez realizada la práctica, quitar las rutas, las direcciones y las interfaces del tunel mediante `ip [route|address|tunel] del` y quitar el módulo SIT mediante `modprobe -r sit`.

#### Notas para ayudantes

Guía clase 2018
---------------

La idea es iniciar con:

- introducción al protocolo,
- formato de la pdu, encabezado, opcionales,
- direccionamiento (link-local, global),
- autoconfiguración (estático, dinámico, slaac, dhcp6),
- protocolos auxiliares (ICMPv6 como reemplazo de ARP, neighbour discovery, router advertisement)
- DNS sobre IPv6 (registros AAAA y consultas sobre IPv6)

La red del laboratorio es la `2800:110:1018:411::0/64` (en adelante abreviada como `PREFIJO`). Existe un router (uno de los equipos en el aula) que posee la dirección `PREFIJO::1` dentro de esa red e interconecta con las restantes redes IPv6 de la Universidad.

Los estudiantes deberán:

#### Fin notas para ayudantes

1. Quitar las direcciones y la configuración IPv4 que tuviera su equipo.

        ip route flush all
        ip address flush dev eth0
        ip -6 address flush dev eth0

2. Iniciar una captura de tráfico.

3. Asignar estáticamente una dirección IPv6 a la interfaz que posee enlace, dentro del rango designado.

        ip -6 address add 2800:110:1018:411::100/64 dev eth0
        ip link set eth0 up

4. Verificar conectividad con otro equipo de su misma red mediante las direcciones de enlace local `fe80:...`.

        ping6 fe80:...

5. Agregar la ruta por defecto a través del router `PREFIJO::1`.

        ip -6 route add default via 2800:110:1018:411::1

6. Verificar conectividad con equipos de redes externas:

        ping6 2800:110:1018:cccc::2   # servidor web www.unlu.edu.ar

7. Configurar un servidor de nombres que opere sobre IPv6:

        echo "nameserver 2800:110:1018:bbbb::2" > /etc/resolv.conf

8. Validar que puede resolver nombres adecuadamente:

        ping6 www.unlu.edu.ar

9. Navegar a las siguientes direcciones:
    - <http://www.unlu.edu.ar/>
    - <https://whatismyipaddress.com/es/mi-ip>
    - <https://www.google.com/>
    - ...

10. Quitar la dirección IPv6 asignada estáticamente, reiniciando o mediante

        ip -6 address del 2800:110:1018:411::100/64 dev eth0
        ip -6 address flush dev eth0
        ip link set eth0 down

    Los docentes iniciarán ahora el demonio `radvd` en el Router IPv6, a fin de que provea autoconfiguración mediante Router Advertisements (falta incluir aquí la configuración de `radvd`)

11. Ejecutar la configuración automática de IPv6, para lo cual sólo es necesario dar de alta la interfaz de red

        ip link set eth0 up

12. Validar que la red opera correctamente repitiendo los pasos desde el punto 6.

### Bibliografía

- DEERING, S., HINDEN, R. 2017. _Internet Protocol, Version 6 (IPv6) Specification_, RFC 8200.  
  <https://tools.ietf.org/html/rfc8200>
- HINDEN, R., DEERING, S. 2006. _Ip Version 6 Addressing Architecture_, RFC 4291  
<https://tools.ietf.org/html/rfc4291>
- STALLINGS, W. 2007. Capítulo 18. Sección 1. IPv6. en _Data and Computer Communications (8th ed)_. pp. 586-595. Prentice Hall.
- O'FLAHERTY, C. et al. 2009. _IPv6 para Todos: Guía de uso y aplicación para diversos entornos._ ISOC.Ar Asociación Civil de Argentinos en Internet.  
  <www.ipv6tf.org/pdf/ipv6paratodos.pdf>
- NARTEN, T., et al. 2007. _Neighbor Discovery for IPv6_, RFC 4861  
<https://tools.ietf.org/html/rfc4861>
- BIERINGER, P. 2017. _Linux Ipv6 HOWTO_  
  <http://tldp.org/HOWTO/Linux+IPv6-HOWTO/>

#### Notas para ayudantes

Trabajo Práctico 2009
---------------------

Este trabajo es una copia del existente en <http://www.tyr.unlu.edu.ar/tallerII/2009/docs/TallerII-2009-TP1-IPv6.pdf>

**Objetivo:** Configurar una red sobre SO Linux utilizando el protocolo IPv6 y analizar intercambios de paquetes.

Para todas las actividades que involucren el intercambio de datos, deberá realizar la captura correspondiente (utilizando Wireshark) para su análisis. Debe entregar un informe con los comandos utilizados en cada caso junto con el resultado obtenido.

La topología del laboratorio es la siguiente:

(imagen omitida por corresponder a una topología obsoleta)

### Consignas

1. Configuración de interfaces en linux y verificación.

    a. Para asignar direcciones de red ipv6 a una interfaz, utilizar el comando:

        ip -6 addr add dev {Interface} {Dirección IP/{Prefijo máscara de red}

    b. Verificar configuración.

        ip addr show

2. Prueba de conectividad (ICMPv6).

    ping6 {DIRECCIÓN IPv6}

3. Verificar caché de resolución direcciones IPv6 a direcciones de nivel enlace:

4. Habilitar ruteo (verificar opciones en `/proc/sys/net/ipv6`)

5. Definir rutas estáticas en los hosts y el router.

    ip route add {network/mask} via {dirección ipv6 router}

6. Verificar redes accesibles (tabla de rutas)

7. Ping a una dirección multicast (mecanismo interesante para detectar hosts activos en un link).

8. Iniciar el servidor web Apache y el servicio SSH. Verificar que el sistema está esperando por conexiones en el puerto correspondiente:

9. Probar conectividad localmente con el servidor web y con otro en otro host.

10. Resolver consultas DNS a través de IPv6 (comando `dig`). Revise el archivo de configuración de BIND del laboratorio.

11. Definir como servidor DNS al router del laboratorio, editando `/etc/resolv.conf` e indicando la dirección IPv6 según la red en la que se encuentre. Establezca una sesión SSH con `host3.taller2.unlu.edu.ar` utilizando IPv6.

12. Investigue cómo opera un tunel IPv4 para interconectar 2 redes IPv6. Explique gráficamente su funcionamiento y la configuración necesaria en el laboratorio.

#### --- Fin notas para ayudantes ---
