Base de preguntas para exámenes
===============================

La siguiente lista engloba preguntas que pueden llegar a tomarse en exámenes,
en conjunto con un puntero al tema en la documentación, los puntos esperados
para considerar la respuesta satisfactoria, y algunos tópicos opcionales
que suman crédito adicional.


Primer Parcial
--------------

### Preguntas de clases teóricas

TODO: Agregar más


Capa física / Multiplexación

- ¿Qué metodología permite combinar dos o más canales de comunicación sobre un mismo medio compartido? Enuncie y describa brevemente las técnicas más habituales.  
  Si las circunstancias lo requirieran, ¿podrían aplicarse dos técnicas en simultáneo? Justifique su respuesta.
    - Puntero: clase de Multiplexación (TODO: si hay bibliografía, anotar cual)
    - Esperado: Frequency-Domain-Multiplexing, Time-Domain-Multiplexing,
      Statistical-Time-Domain-Multiplexing. Sí, cuando se requiera enviar y
      recibir múltiples _señales_ en simultáneo (FDM) y a la vez existan varios
      dispositivos desde los cuales se transmite o bien varios procesos dentro
      de un mismo dispositivo (TDM).


Capa de enlace

- ¿Qué mecanismo de control de acceso al medio se utiliza en el protocolo Ethernet?  
  Existen variantes del mismo mecanismo denominadas Collision Detection (CD) y Collision Avoidance (CA), ¿qué aporta cada una de estas variantes al mecanismo tradicional?
    - Puntero: bibliografía sobre Control de Acceso al Medio (TODO: anotar cual)
    - Esperado: Carrier-Sense-Multiple-Access. TODO: completar diferencia CD vs CA.

- ¿Cómo opera el mecanismo de aprendizaje de direcciones de un switch de capa dos tradicional? ¿Qué condiciones deben haberse dado para que un switch opere en forma óptima en todos los puertos donde tiene enlace? ¿Por qué tienen un tiempo de expiración los registros en las tablas de un switch?
    - Puntero: clase de Ethernet (TODO: si hay bibliografía, anotar cual)
    - Esperado: TO-DO: completar


Capa de red

- Un host desea enviar un datagrama a otro host remoto alojado en una red diferente a la propia.
    - ¿Qué direcciones origen y destino contendrá el paquete en su encabezado IP?
    - ¿Qué direcciones origen y destino contendrá la trama que lo encapsula en su encabezado Ethernet?
    - **Preguntas alternativas**
    - ¿Cómo obtiene el host remitente las direcciones de Capa 2 adecuadas?
    - ¿Cómo obtiene el host remitente la dirección de Capa 2 del destino? *
    - ---
    - Puntero: clase de Ruteo (TODO: si hay bibliografía, anotar cual)
    - Esperado: IP Origen: propia, IP Destino: la del destino;
      MAC Origen: propia, MAC Destino: gateway que lleva a dicha red (default o específico); mediante resolución Address Resolution Protocol (ARP) en el enlace, o mediante Neighbor Discovery (ND) si es IPv6, o las tiene cacheadas temporalmente en tabla ARP.  
      (*) Tricky: no la obtiene, no la necesita ni puede obtenerla.

- ¿Podría existir una red que se implemente el stack TCP/IP sobre Ethernet sin utilizar el protocolo ARP?  
    Si considera que es posible, ¿cómo podría lograrse? ¿qué ventajas y desventajas presentaría este escenario?  
    Si considera que NO es posible, ¿qué características del stack TCP/IP lo impiden?
    - Esperado: SI, alternativamente podría fijarse una tabla estática de asociaciones (MAC, IP). No encuentro ventaja alguna salvo el ahorro de mensajes ARP (y poca latencia al momento de dialogar con otro host). La mayor desventaja es que ante la incorporación o remoción de un host o interfaz de red hay que redistribuir la tabla de asociaciones. Otra alternativa, real, es la implementada en IPv6 mediante la utilización de Neighbor Discovery (ND) (aunque no habrán visto IPv6 en esta instancia del examen).

- Considere el siguiente escenario y secuencia de eventos sucesivos.  
    En una red Ethernet existen 3 hosts: A, B, y C.
    1. El host A envía un mensaje ARP Reply (respuesta unicast) al host B indicando la asociación entre la dirección IP de C con la dirección MAC de A (la propia).
    2. El host A envía un mensaje ARP Reply (respuesta unicast) al host C indicando la asociación entre la dirección IP de B con la dirección MAC de A (la propia).
    Siendo que el protocolo ARP es un protocolo sin estado (no hay asociación entre preguntas y respuestas), a) ¿qué consecuencias trae el accionar del host A sobre los intercambios de datagramas IP que sucedan a continuación? b) ¿puede ofrecer alguna solución?
    - Esperado: TO-DO


Capa de transporte

- Desde un host se desea enviar un payload de aplicación de 100 bytes hacia otro host remoto. Si la tasa de transferencia de un enlace es suficientemente rápida y el RTT del mismo es 500 ms, cuánto se demorará en:
    - enviar el payload sobre una conexión UDP
    - enviar el payload sobre una conexión TCP nueva
    - enviar el payload sobre una conexión TCP existente
(bueno, es un poco tramposo)
    - finalmente, cual es el overhead de transporte (peso de los headers capa 4) para cada escenario?
    - ---
    - Esperado: (sólo considerando el tiempo de propagación, eh)
        - UDP: ninguno (pq no existen "conexiones" UDP) o 500 ms (ambas válidas) pues no hay ACK
        - TCP nueva: 500 ms SYN * 3 de apertura + 500 ms + 500 ms * 3 de cierre (opcional)
        - TCP existente: 500 ms + 500 ms ACK (+/-) dep delay ACK (o nada si se considera que con el envío alcanza)
    - Si el estudiante se da cuenta tiene dos opciones:
        - dice que no puede enviarse sobre una *conexión* UDP, o bien
        - puede calcular el RTT en 500 ms, total es un solo datagrama sin ACK



### Preguntas de clases prácticas

Agrego las que propuse. Borren las que no sean útiles.


DNS

- Dada una organización cuyo Mail Transfer Agent es `correo.organizacion.org.ar`, ¿qué Resource Records (RR) DEBEN EXISTIR en la zona DNS de organizacion.org.ar para que un servidor externo pueda enviar un correo electrónico a usuario@organizacion.org.ar? ¿qué valores deben tener tales RR?
    - Puntero: bibliografía de DNS (TODO: anotar cual)
    - Esperado: MX y A, al menos  
      organizacion.org.ar IN MX 10 correo.organizacion.org.ar (el número 10 es opcional)  
      correo.organizacion.org.ar IN A X.X.X.X
    - Extra:  
      organizacion.org.ar IN NS dns.organizacion.org.ar  
      dns.organizacion.org.ar IN A X.X.X.Y  
      Y.X.X.X.in-addr.arpa IN PTR correo.organizacion.org.ar

- Una aplicación desea obtener la dirección IP del host web.whatsapp.com. Describa las consultas DNS que deben intercambiarse como mínimo para obtener una respuesta definitiva, indicando destino dominio por el que se consulta, servidor/es a los que se consulta y respuesta a la consulta en cada mensaje DNS. Suponga que toda caché de respuestas está vacío.
    - Puntero: bibliografía de DNS (TODO: anotar cual)
    - Esperado: TODO: falta consignar

- Una aplicación solicita al sistema operativo la resolución del nombre news.jpl.nasa.gov. El servidor ns1.nasa.gov que debería responder consultas sobre el dominio nasa.gov está caído (fuera de línea). Sin embargo, la aplicación obtiene respuesta a su consulta. ¿Es esto posible?  
Si este escenario es posible, explicite de qué manera pudo haberse resuelto la consulta. Si tal escenario no es posible, justifique por qué.
     - Puntero: clase de DNS (TODO: si hay bibliografía, anotar cual)
     - Esperado: ambas respuestas son válidas, dependiendo de la justificación:
         - Si SI recibe respuesta, puede ser porque la obtuvo de un servidor DNS secundario o bien de caché del servidor DNS de su ISP.
         - Si NO obtiene respuesta, debe indicarse que TODOS los servidores DNS de nasa.gov están caídos y que no hay respuestas cacheadas por el momento.

- El servidor de nombres de dominio `ns.foobar.com.ar` mantiene los siguientes registros para la zona `foobar.com.ar` correspondiente a la empresa FooBar

        $TTL 3D
        @       IN      SOA     foobar.com.ar. hostmaster.foobar.com.ar. (
                                199609206       ; serial, todays date + todays serial #
                                8H              ; refresh, seconds
                                2H              ; retry, seconds
                                4W              ; expire, seconds
                                1D )            ; minimum, seconds
                        NS      ns.foobar.com.ar.
                        NS      ns.proveedorremoto.net.
        ns              A       201.6.177.3
        www             A       203.159.141.192
        mail            A       203.159.141.250
                        MX      10 foobar.com.ar.
        mobile          CNAME   www.foobar.com.ar.

    Suponiendo que un cliente desea acceder al sitio web de la empresa, y considerando que ningún servidor tiene almacenada una copia temporal de los registros: enuncie las consultas DNS que se efectuarán en toda la red planteada antes de que el cliente pueda establecer una conexión TCP con el servidor web remoto. Detalle origen y destino de las consultas, y cuáles de ellas son recursivas y cuales iterativas.

     - Puntero: clase de DNS (TODO: si hay bibliografía, anotar cual)
     - Esperado: TO-DO: explicitarlo

                   ns.foobar.com.ar   root server   DNS Server .com.ar
                         \                   \      /
            Empresa --- ISP Remoto   ---   Internet --- ISP Local --- Estación de Trabajo Cliente
                         /                   /               /
                  www.foobar.com.ar    DNS Server .ar    DNS Proveedor Local

- El sistema DNS basa su funcionamiento en una base de datos jerárquica distribuida que en su operación es consultada por los clientes desde la/las raíces hacia las hojas.
    ¿Qué analogías pueden establecerse entre el sistema DNS y una estructura de listas enlazadas en un lenguaje de programación?
    - Esperado: la respuesta es abierta, pero podría mencionar:
      nodo = servidor dns / dominio; nodo raíz; hoja = host final;
      enlace = registro NS; no son doblemente enlazadas pues los subdominios no
      suelen apuntar al dominio padre.

- En el sistema DNS, ¿es correcto afirmar que cada zona debe contener un sólo registro NS? Justifique su respuesta.
     - Puntero: bibliografía (TODO: anotar cual) y clase de DNS
     - Esperado: NO, la recomendación de la RFC (TODO: validar!) es poseer un
       servidor de nombres primario y uno o más secundarios, preferentemente en
       redes distintas, a fin de brindar disponibilidad en caso de que uno de
       los servidores o una de las redes esté fuera de línea.

MAIL

- Existen al menos dos protocolos que permiten a un Agente de Usuario descargar correo desde un servidor de correo electrónico.  
  ¿Cuáles son y qué ventajas presenta el más completo de ellos por sobre el más sencillo?  
  Eligiendo uno de ellos, describa tres comandos que debe implementar un servidor que provea dicho protocolo para que pueda ser utilizado por un cliente de correo.
    - Puntero: bibliografía de MAIL (TODO: anotar cual)
    - Esperado: POP, IMAP (falta especificar ventajas)  
      Comandos posibles: USER, PASS, LIST, RETR, DELE, TOP, ...

- ¿Por qué son necesarias las extensiones MIME en correo electrónico? ¿Qué recaudos hay que tener al enviar un correo electrónico sin utilizar MIME?
    - Puntero: bibliografía de MAIL (TODO: anotar cual)
    - Esperado: para enviar correos con archivos adjuntos, con otros modos de codificación y representación. En caso de no utilizar MIME, sólo se puede enviar texto en ASCII de 7 bits.


HTTP

- ¿Cómo está formada la PDU del protocolo HTTP? ¿Qué diferencias evidentes puede mencionar entre una PDU de Ethernet vs una PDU HTTP en cuanto a sus valores y tamaño de campos de encabezado? ¿Cómo determina un cliente HTTP el final de los encabezados de respuesta?
    - Puntero: bibliografía de HTTP (TODO: anotar cual)
    - Esperado: Encabezados (Generales, de Petición/Respuesta y de Entidad) y Cuerpo (opcional). La PDU HTTP no tiene tamaño fijo. Los campos y valores están especificados "en texto plano" y sus tamaños pueden variar. El final de los encabezados se indica con una línea en blanco.

- ¿Cómo está formada una URL o URI? ¿Qué indica cada componente de la misma?
    - Puntero: bibliografía de HTTP (TODO: anotar cual)
    - Esperado: schema/protocolo, hostname, puerto (opcional), ruta en el servidor, ? (opcional), querystring (opcional)

- Responda las siguientes preguntas y justifique su respuesta:
    - ¿Por qué se dice que HTTP es un protocolo sin estado?
    - En HTTP 1.0/1.1 ¿cuántos recursos o entidades obtiene el navegador web luego de realizar cada petición HTTP?
    - Luego de que el navegador web recibe un recurso HTML, ¿todos los recursos que dicha página posee se obtienen desde el mismo servidor web?
    - ¿Cómo envía un navegador web un recurso (entidad) a un servidor web?
    - ¿Dónde y para qué se utilizan las extensiones MIME en HTTP?
    - ---
    - Puntero: bibliografía de HTTP (TODO: anotar cual)
    - Esperado: Porque no hay relación entre una transacción (petición/respuesta) y la siguiente. Uno. No necesariamente, depende de las URLs especificadas en HTML. Utilizando el método POST e incluyendo el recurso en el cuerpo del mensaje. En los encabezados HTTP (de petición y respuesta) para indicar el tipo de contenido que se envía/recibe.

- Una organización decide incorporar un equipo que actuará como servidor proxy en su red. Describa dos situaciones hipotéticas por las que esta organización considera adecuado incorporar tal servicio.
    - Puntero: bibliografía de HTTP-Proxy (TODO: anotar cual)
    - Esperado: caché de recursos de reciente/frecuente descarga, filtrado/control de acceso.


Segundo parcial
---------------

### Preguntas de clases teóricas

TO-DO


### Preguntas de clases prácticas

TO-DO


Preguntas de integración de conocimientos
-----------------------------------------

- Para cada protocolo de los siguientes: Ethernet, TCP, IP, HTTP, POP3, UDP, DNS, HDLC
    - Indique si provee un servicio "orientado a la conexión" o "no orientado a la conexión", justificando para cada uno de ellos
    - Indique qué cambios deberían realizarse sobre la sintaxis, semántica y temporización del protocolo para que soporte el servicio contrario.
    - ---
    - (para variar la respuesta, elegir 3 o 4 de ellos en cada mesa de examen; y tener en cuenta que HDLC provee ambos servicios según la documentación que leí; no puse ICMP porque no lo vemos en detalle; y por lo visto, en Wikipedia existe algo llamado Connection-Oriented Ethernet (?))

- ¿Qué protocolos y qué actores de software intervienen para que dos personas puedan intercambiar correos electrónicos? Descríbalos en un párrafo por cada uno de ellos.
    - Puntero: bibliografía de MAIL (TODO: anotar cual)
    - Esperado: DNS, SMTP, POP o IMAP // UAs origen y destino, MTA origen, MTA destino // descripción omitida por brevedad.

- Un usuario redacta un mensaje en un cliente de correo de escritorio (tal como Outlook o Thunderbird) y lo envía desde su cuenta de correo (remitente@organizacion.com.ar) a través del servidor de correo de su organización, hacia una cuenta de correo destinatario@yahoo.com.ar. El mensaje arriba a los servidores de correo de Yahoo!, y el destinatario del mensaje lo visualiza posteriormente mediante la interfaz web del servicio de correo Yahoo.  
    - Enuncie los protocolos (de todas las capas intervinientes) que intervienen en el proceso, y el rol que cumple cada uno en cada etapa.
    - ---
    - Puntero: clase de MAIL y HTTP (TODO: si hay bibliografía, anotar cual)
    - Esperado:
        - Capa de enlace: Ethernet, Opcionalmente 802.3, 802.11 y/o otro protocolo de enlace
        - Opcional: ARP
        - Capa de red: IPv4 o IPv6 (no podría ser de otra manera)
        - Capa de transporte: TCP (para SMTP y HTTP) y UDP (para DNS)
        - Capa de aplicación: DNS (para determinación de MX y direcciones IP), SMTP (para el envío del mensaje de UA-MTA y MTA-MTA), HTTP (para la visualización en Yahoo!) (no se debería mencionar POP3).
        - (puede que me olvide alguno)


#### Bibliografía

- [^GOR17]: The Illustrated Network: How TCP/IP Works in a Modern Network (2nd ed).
            Walter Goralski. Morgan Kaufmann, 2017.
- ...


### Preguntas obsoletas

- **[OBSOLETA]** Un usuario accede a una aplicación mediante un navegador de Internet

    http://empresa.com/aplicacion.aspx

    La aplicación muestra un formulario que cuyos campos se van validando a medida que el usuario los completa, realizando sucesivas peticiones a la siguiente dirección web

    http://empresa.com/validar.aspx?campo=valor

    Una vez completados y validados todos los campos del formulario, el usuario hace clic en "Enviar" y el navegador remite los datos a la dirección

    http://empresa.com/procesar.aspx

    - Enumere las tecnologías web que permiten brindar la interacción con el usuario.
    - Represente en un gráfico los distintos componentes involucrados (servidor, cliente, etc) y los hipotéticos mensajes HTTP que se intercambian entre los componentes, indicando el método HTTP utilizado en cada caso.
    - ---
    - Puntero: clase de HTTP (TODO: si hay bibliografía, anotar cual)
    - Esperado: HTTP / AJAX (TODO: explicitar transacciones)

- **[OBSOLETA]** Describa los conceptos HTTP, HTML y JavaScript. Relacionelos. Puede utilizarse cada tecnología en forma independiente de las demas? Justifique su respuesta y, de ser posible, enuncie ejemplos.


---

Otras preguntas pendientes

[Q] De WLAN había teoría? entra en el parcial anterior o en este? se podría agregar una pregunta al respecto (mecanismo(s) de acceso al medio, problema del nodo oculto? solución?).

[Q] Hubo algún ejercicio sobre fragmentación en IP? Podríamos agregar una topología al estilo

Cliente DNS --- mtu 576 --- Router --- mtu 1400 --- Router -- mtu 1500 --- Servidor DNS

en el que dada una Consulta DNS (UDP) de 516 bytes y una respuesta de 1450 bytes (UDP)
- se fragmentará el paquete que lleva la consulta al servidor?
- se fragmentará el paquete que lleva la respuesta al cliente?
- qué equipos fragmentarán y cuales reensamblarán
- en los casos que se requiera fragmentar, indicar el tamaño de los fragmentos y qué campos del encabezado serán modificados (respuesta: longitud, id, offset, flags, checksum)
- plus para alguien que quiera sacarse 10: el valor de los campos longitud, id, offset, more-fragments para cada fragmento

(desde luego este ejercicio puede simplificarse)

[Q] alguna consulta de DHCP ya que se añadió en esta cursada? al menos el diálogo Discover, Offer, Request, ACK

[Q] alguna consulta de UDP? servicio provisto, encabezado,
