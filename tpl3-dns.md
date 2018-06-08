TPL 3 - Domain Name System
==========================

**Fecha de Entrega:** Luján 12/04/2018

**Objetivo:** Comprender el propósito, funcionamiento y servicio provisto por el Sistema de Nombres de Dominio (DNS). Familiarizarse con la estructura en árbol de nombres de dominio, con los tipos de registros de recurso y con la composición de una Zona DNS.

#### Notas para ayudantes

* Hay una muy buena presentación con teoría y práctica de DNS en
  <http://cereal.forest.usf.edu/linux/L3/w02-dns_proxy/O4L01/online-module-guide.pdf>
* Para la próxima consultar los NS de `www.telecom.com.ar` y consultar que tienen de curioso.  
  (gulp.arnet.com.ar, oktubre.arnet.com.ar, lobosuelto.arnet.com.ar, corderoatado.arnet.com.ar)

Ejercicio removido en 2018 por florge-maurom
8. Acceda a la herramienta en línea de reporte DNS <http:/www.howismydns.com/> y solicite chequear el dominio 
`unlu.edu.ar`. Describa al menos 3 de los chequeos/verificaciones realizados y los resultados obtenidos.

#### --- Fin notas para ayudantes ---

### Consignas

1. Describa el objetivo del sistema DNS, su estructura, elementos que intervienen y 
tipos de datos (Resource Records) típicos que se pueden consultar.

2. Utilizando la herramienta `dig` (o `nslookup`) realice consultas al servidor DNS indicado por el docente, (o desde su hogar al provisto por su ISP, o bien al de acceso público `8.8.8.8`) para obtener la siguiente información: 

    a. ¿Cuál es la dirección IP del host `straval.unlu.edu.ar`?
    b. ¿Cuál es la dirección IP del host `resoluciones.unlu.edu.ar`? ¿Qué diferencia nota en la respuesta respecto al punto anterior?
    c. ¿Cuáles son los intercambiadores de mail (mnemónico y dirección IP) del dominio `unl.edu.ar`?
    d. ¿Cuál es el nombre del host cuya dirección IP es `170.210.103.35`?
    e. ¿Cuáles son los servidores de nombres (mnemónicos y dirección IP) para el dominio `ripe.net`?
    f. ¿Cuál es la dirección IPv6 del host `www.icann.org`?

3. Utilice la herramienta DNS BAJAJ disponible en <http://www.zonecut.net/dns/> para obtener información en forma de grafo acerca del dominio `afip.gov.ar`. ¿Cuáles son los servidores (nombre y dirección IP) para dicho dominio?

4. Defina cómo estará compuesta la zona de un servidor DNS administrado por Ud., de manera tal que sea el servidor primario del dominio `SU-NRO-LEGAJO.tyr` (suponiendo que `.tyr ` es un TLD), definiendo:

    a. El nombre de su host en el nuevo dominio, y su respectivo puntero reverso.
    b. El host `ns1` como `10.4.11.30` y el respectivo reverso.
    c. Su propio host y `ns1` como name servers del dominio.
    d. Al menos otras 2 máquinas del aula, siguiendo el mapa de red del laboratorio, identificando a los equipos con su nuevo dominio, y sus respectivos punteros reversos.
    e. Alias para `www.SU-NRO-LEGAJO.tyr` y `ftp.SU-NRO-LEGAJO.tyr` que devuelvan su propia dirección IP.

    Complete la planilla adjunta a partir de las definiciones previas.

5. Instale e inicie en el entorno netkit el laboratorio de dns provisto por los docentes disponible en  http://www.unlu.edu.ar/~tyr/netkit/netkit-lab_dns-TYR.tar.gz y realice las siguientes actividades:

    a. Inicie una captura desde el host.
    b. Desde pc1.lugroma3.org, ejecute el comando `ping -c 4 pc2.nanoinside.net`
    c. Una vez recibidas las 4 respuestas ICMP, detenga la captura.
    d. Analice la captura y describa cómo es el proceso de resolución de nombres para determinar la dirección ip de pc2.nanoinside.net, representando gráficamente el intercambio de mensajes dns, e indicando el propósito de cada uno.

6. Analice la captura `captura_ejemplo_dns.pcap` y represente el intercambio de mensajes. ¿Puede indicar alguna particular que observe en la misma?

7. ¿Cómo un desarrollador de aplicaciones puede acceder al servicio DNS? (Por ej. si es necesario resolver, en una aplicación de software, mnemónicos a direcciones IP o viceversa)

8. ¿Quién tiene a su cargo la administración de los nombres de dominio bajo el dominio `.ar`? ¿Qué y cuáles son las zonas especiales? ¿Que requisito especial se requiere para solicitar un dominio `.org.ar`?

#### Bibliografía

* COLOURIS, G., DOLLIMORE, J., KINDBERG T. 2001. Capítulo 9: "Servicios de Nombres" en _Sistemas Distribuidos, Conceptos y Diseño_. Addison Wesley.
* STEVENS, R. 1994. Capítulo 14: "DNS: The Domain Name System" en _TCP/IP Illustrated Vol.1_. Addison Wesley.
* GORALSKI, W. 2017. Capítulo 23: "The Domain Name System" en _The Illustrated Network: How TCP/IP Works in a Modern Network (2nd ed)_. Morgan Kaufmann.  
  <https://www.sciencedirect.com/science/book/9780128110270>
* COMER, D. Capítulo 22: "Sistema de nombre de dominio (DNS)" en _Redes globales de información con Internet y TCP/IP_. Prentice Hall.

#### Recursos en Internet
* Para cada uno de los protocolos desarrollados a lo largo de la cursada, busque cuales son los Request For Comments (RFC) o Internet Draft que los describen, siguiendo la cadena de actualizaciones. Recurra a 
<http://www.faqs.org>, <http://www.rfc-editor.org> y <http://www.ietf.org>
* HERTZOG, R., MAS, R., Capítulo 10.6: "Servidores de nombres de dominio (DNS)" en _El libro del administrador de Debian_.  
  Disponible en <http://debian-handbook.info/browse/es-ES/stable/sect.domain-name-servers.html>
* LUPI, F. 2014. Capítulo 26: "The Domain Name System" en _The NetBSD Guide_. The NetBSD Foundation  
  Disponible en <https://www.netbsd.org/docs/guide/en/chap-dns.html>

\pagebreak

Documentación de configuración de la zona `SU-NRO-LEGAJO.tyr`
===============================================================

    Nombre de la zona DNS: ______________.tyr
    Nombre del servidor DNS: ________________.tyr
    Dirección de correo del contacto: _______________________________
    Número de serie de la zona: ___________
    Tiempo de vida en caché: _____ segundos


#### Resource Records (RR)

| Nombre de Host | Clase | Tipo de RR | Datos del RR     | Comentario |
| -------------- | :---: | :--------: | ---------------- | ---------- |
| straval        |  IN   | A          | 190.104.80.57    | (ejemplo)  |
|                |  IN   |            |                  |            |
|                |  IN   |            |                  |            |
|                |  IN   |            |                  |            |
|                |  IN   |            |                  |            |
|                |  IN   |            |                  |            |
|                |  IN   |            |                  |            |
|                |  IN   |            |                  |            |
|                |  IN   |            |                  |            |
|                |  IN   |            |                  |            |
|                |  IN   |            |                  |            |

#### Zona de Punteros Reversos

| Nombre de Host              | Clase | Tipo de RR | Datos del RR      | Comentario |
| --------------------------- | :---: | :--------: | ----------------- | ---------- |
| 57.80.104.190.in-addr.arpa. |  IN   |    PTR     | straval.unlu.edu.ar. | (ejemplo)  |
|                             |  IN   |            |                   |            |
|                             |  IN   |            |                   |            |
|                             |  IN   |            |                   |            |
|                             |  IN   |            |                   |            |
|                             |  IN   |            |                   |            |
