Clase Teórico-Práctica de Protocolo IPv6 (Presencial)
=====================================================

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
