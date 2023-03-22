Teleinformática y Redes
=======================

### Temario General

- Teoría Introducción, Redes y OSI
    - Slides 01 Introducción
    - Slides 02 Protocolos y OSI
    - [Guía de lectura - Introducción](./gl-introduccion.md)
- [TPL#1 Configuración inicial del laboratorio](./tpl1-configuracion-inicial.md)
- [TPL#1 parte 2 Configuración inicial de una red en netkit](./tpl1-parte2.md)
- Teoría Comunicaciones de datos (modelo, señales, multiplexación)
    - Slides 03 Modelo Comunicaciones
    - Slides 04 Multiplexación
    - Slides 05 Medios
    - [TP Transmisión de datos](./tp-transmision-datos.md)
- [TPL#2 Cliente-Servidor - Telnet](./tpl2-telnet.md)
- Teoría Redes y Conmutación
    - Slides 06 Redes
- [TPL#3 Servicio de Nombres (DNS)](./tpl3-dns.md)
- Teoría Capa de Enlace (1)
    - Slides 09 Capa de Enlace
- [TPL#4 Correo Electrónico](./tpl4-correo-electronico.md)
  - [Ejemplo envio de correo](./ejemplo-envio-correo.md)
- Teoría Capa de Enlace (2) + Redes Locales (1)
    - Slides 10 Redes de Area Local
    - [TP Eficiencia del enlace](./tp-control-enlace.md)
- [TPL#5 World Wide Web - HTTP](./tpl5-http.md)
    - [Temario clase teórica HTTP](./temario-clase-http.md)
- Teoría Redes Locales (2)
    - Guía de lectura - Enlace
- [Teoría/Práctica Cableado Estructurado](./cableado-estructurado.md)
    - Documento "Cableado Estructurado"
    - Documento adicional (Cableado Estructurado)
- Teoría WLANs + Resolución TPLs (y consultas)
    - Slides 10 Wireless LANs (WLANs)
- Primer parcial
- Teoría Capa de Red, IPv4, Infraestructura de Internet
    - Slides 07 Infraestructura de Internet
    - Slides 11 Capa de Red e IP
    - Slides 12 Capa de Transporte y TCP
- Práctica Subnetting, CIDR, VLSM
- [Teoría Ruteo Estático / Ruteo Dinámico](./teoria-ruteo.md)
    - Guía de lectura - La Capa de Red en Internet
- [Práctica Ruteo Dinámico](./tplX-ruteo-dinamico-2018.md)
- Teoría Capa de Transporte y TCP (1)
- Teoría Capa de Transporte y TCP (2)
    - Ejercicio Control de Congestión
- [Práctica DHCP](tplX-dhcp.md) y [Práctica UDP](tplX-udp.md)
- [Captura para Trabajo Práctico Integrador 2019](./receta-tp-integrador-2019.md)
- Práctica Interface de Sockets
- [Teoría y Práctica IPv6](./tplX-ipv6-presencial.md)
- Consultas/Ejercicios integradores
- Segundo parcial
- Recuperatorio + Expo TP Integrador
- Teoría HTTP/2.0
    - Slides 13 HTTP/2
- Guía de Estilo para la entrega de Trabajos Prácticos

- [Trabajo Práctico Integrador 2017 y previos](./receta-tp-integrador-2017.md)
- [Trabajo Práctico Integrador 2018](./receta-tp-integrador-2018.md)

- [Preguntas para examen, con respuesta esperada](./preguntas.md)

#### Pasos para generar los Trabajos Prácticos en PDF

Si ya se posee una copia del repositorio

    git pull && make

Si no se posee una copia del repositorio

    git clone https://github.com/redesunlu/tyr-trabajos-practicos.git
    apt-get --no-install-recommends install \
        pandoc lmodern texlive-xetex texlive-generic-recommended \
        texlive-fonts-recommended fonts-dejavu
    cd tyr.wiki
    git pull && make

Si se desea (re)generar sólo un documento md (y no todos), por ejemplo "seguridad.md" -> "seguridad.pdf"

    make pdf/seguridad.pdf

Los documentos generados quedan en el directorio `./pdf/`
