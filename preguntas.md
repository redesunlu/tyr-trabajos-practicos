Base de preguntas para exámenes
===============================

La siguiente lista engloba preguntas que pueden llegar a tomarse en exámenes,
en conjunto con un puntero al tema en la documentación, los puntos esperados
para considerar la respuesta satisfactoria, y algunos tópicos opcionales
que suman crédito adicional.


Primer Parcial
--------------

### Preguntas de clases teóricas

TO-DO


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

- Una aplicación solicita al sistema operativo la resolución del nombre news.jpl.nasa.gov, sin embargo el servidor ns1.nasa.gov que responde consultas sobre el dominio nasa.gov está caído (fuera de línea). ¿Obtiene la aplicación una respuesta a su consulta? Responda y justifique.
     - Puntero: clase de DNS (TODO: si hay bibliografía, anotar cual)
     - Esperado: ambas respuestas son válidas, dependiendo de la justificación:
         - Si SI recibe respuesta, puede ser porque la obtuvo de un servidor DNS secundario o bien de caché del servidor DNS de su ISP.
         - Si NO obtiene respuesta, debe indicarse que TODOS los servidores DNS de nasa.gov están caídos y que no hay respuestas cacheadas por el momento.

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

- ¿Qué protocolos y qué actores de software intervienen para que dos personas puedan intercambiar correos electrónicos? Descríbalos en un párrafo por cada uno de ellos.
    - Puntero: bibliografía de MAIL (TODO: anotar cual)
    - Esperado: DNS, SMTP, POP o IMAP // UAs origen y destino, MTA origen, MTA destino // descripción omitida por brevedad.

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
    - Esperado: Porque no hay relación entre una transacción (petición/respuesta) y la siguietne. Uno. No necesariamente, depende de las URLs especificadas en HTML. Utilizando el método POST e incluyendo el recurso en el cuerpo del mensaje. En los encabezados HTTP (de petición y respuesta) para indicar el tipo de contenido que se envía/recibe.


Segundo parcial
---------------

### Preguntas de clases teóricas

TO-DO


### Preguntas de clases prácticas

TO-DO


#### Bibliografía

- [^GOR17]: The Illustrated Network: How TCP/IP Works in a Modern Network (2nd ed).
            Walter Goralski. Morgan Kaufmann, 2017.
- ...
