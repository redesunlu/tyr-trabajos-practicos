Teleinformática y Redes
=======================

### Temario 2017

- Teoría Introducción, Redes y OSI
    - Slides 01 Introducción
    - Slides 02 Protocolos y OSI
    - [Guía de lectura - Introducción](./gl-introduccion)
- [TPL#1 Configuración inicial del laboratorio](./tpl1-configuracion)
- [TPL#1 parte 2 Configuración inicial de una red en netkit](./tpl1-parte2)
- Teoría Comunicaciones de datos (modelo, señales, multiplexación)
    - Slides 03 Modelo Comunicaciones
    - Slides 04 Multiplexación
    - Slides 05 Medios
    - [TP Transmisión de datos](./tp-transmision-datos)
- [TPL#2 Cliente-Servidor - Telnet](./tpl2-telnet)
- Teoría Redes y Conmutación
    - Slides 06 Redes
- [TPL#3 Servicio de Nombres (DNS)](./tpl3-dns)
- Teoría Capa de Enlace (1)
    - Slides 09 Capa de Enlace
- [TPL#4 Correo Electrónico](./tpl4-correo-electronico)
  - [Ejemplo envio de correo](./ejemplo-envio-correo)
- Teoría Capa de Enlace (2) + Redes Locales (1)
    - Slides 10 Redes de Area Local
    - [TP Eficiencia del enlace](./tp-control-enlace)
- [TPL#5 World Wide Web - HTTP](./tpl5-http)
    - [Temario clase teórica HTTP](./temario-clase-http)
- Teoría Redes Locales (2)
    - Guía de lectura - Enlace
- [Teoría/Práctica Cableado Estructurado](./cableado-estructurado)
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
- [Teoría Ruteo Estático / Ruteo Dinámico](teoria-ruteo-estatico-dinamico.md)
    - Guía de lectura - La Capa de Red en Internet
- [Práctica Ruteo Dinámico](./tplX-ruteo)
- Teoría Capa de Transporte y TCP (1)
- Teoría Capa de Transporte y TCP (2)
    - Ejercicio Control de Congestión
- [Práctica DHCP](tplX-dhcp) y [Práctica UDP](tplX-udp)
- [Captura para Trabajo Práctico Integrador 2018](./receta-tp-integrador)
- Práctica Interface de Sockets
- [Teoría y Práctica IPv6](./tplX-ipv6)
- Consultas/Ejercicios integradores
- Segundo parcial
- Recuperatorio + Expo TP Integrador
- Teoría HTTP/2.0
    - Slides 13 HTTP/2
- Guía de Estilo para la entrega de Trabajos Prácticos

- [Trabajo Práctico Integrador 2017 y previos](./receta-tp-integrador-2017)

#### Pasos para generar los Trabajos Prácticos en PDF

Si ya se posee una copia del repositorio

    git pull && make

Si no se posee una copia del repositorio

    git clone https://gitlab.com/tolosoft/tyr.wiki.git
    apt-get --no-install-recommends install \
        pandoc lmodern texlive-xetex texlive-generic-recommended \
        texlive-fonts-recommended fonts-dejavu
    cd tyr.wiki
    git pull && make

Los documentos generados quedan en el directorio `./pdf/`
