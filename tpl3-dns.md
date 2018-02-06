TPL 3 - Domain Name System
==========================

**Fecha de Entrega:** Luján xx/xx/xxxx

**Objetivo:** _TODO_

#### Notas para ayudantes

* Acá van notas nuestras que consideren pertinentes.
* Le saqué los # a los comandos porque los estudiantes lo escribían. Si hace falta, lo vuelvo a poner.

#### --- Fin notas para ayudantes ---

### Consignas

1. Describa el objetivo del sistema DNS, su estructura, elementos que intervienen y 
tipos de datos (Resource Records) típicos que se pueden consultar.

2. Utilizando la herramienta `dig` (o `nslookup`) realice consultas al servidor DNS indicado por el docente, (o desde su hogar al provisto por su ISP, o bien al de acceso público `8.8.8.8`) para obtener la siguiente información: 

    a. ¿Cuál es la dirección IP del host `platdig.unlu.edu.ar`?
    b. ¿Cuál es la dirección IP del host `www.labredes.unlu.edu.ar`? ¿Qué diferencia nota en la respuesta respecto al punto anterior?
    c. ¿Cuáles son los intercambiadores de mail (mnemónico y dirección IP) del dominio `unlp.edu.ar`?
    d. ¿Cuál es el nombre del host cuya dirección IP es `170.210.103.35`?
    e. ¿Cuáles son los servidores de nombres (mnemónicos y dirección IP) para el dominio `lacnic.net`?
    f. ¿Cuál es la dirección IPv6 del host `www.isoc.org`?

3. Utilice la herramienta DNS BAJAJ disponible en <http://www.zonecut.net/dns/> para obtener información en forma de grafo acerca del dominio `lujan.gob.ar`. ¿Cuáles son los servidores (nombre y dirección IP) para dicho dominio?

4. Defina cómo estará compuesta la zona de un servidor DNS administrado por Ud., de manera tal que sea el servidor primario del dominio `[su-nro-legajo].tyr` (suponiendo que `.tyr ` es un TLD), definiendo:

    a. El nombre de su host en el nuevo dominio, y su respectivo puntero reverso.
    b. El host `ns1` como `10.4.11.30` y el respectivo reverso.
    c. Su propio host y `ns1` como name servers del dominio.
    d. Al menos otras 2 máquinas del aula, siguiendo el mapa de red del laboratorio, identificando a los equipos con su nuevo dominio, y sus respectivos punteros reversos.
    e. Alias para `www.[su-nro-legajo].tyr` y `ftp.[su-nro-legajo].tyr` que devuelvan su propia dirección IP.

    Complete la planilla adjunta a partir de las definiciones previas.

5. Describa cómo es el proceso de una consulta de un cliente (solicitud de IP de un mnemónico que no es de su dominio) suponiendo que todos los servidores DNS consultados tienen la cache vacía (u operan sin cache). Para ello analice la captura `dns_ejemplo1.pcap`, representando gráficamente el intercambio y de mensajes, y  relacionando cada mensaje con el proceso de resolución dns.

6. Analice la captura `dns_ejemplo2.pcap` y represente el intercambio de mensajes. ¿Puede indicar alguna particular que observe en la misma?

7. ¿Cómo un desarrollador de aplicaciones puede acceder al servicio DNS? (Por ej. si es necesario resolver, en una aplicación de software, mnemónicos a direcciones IP o viceversa)

8. Acceda a la herramienta en línea de reporte DNS <http:/www.howismydns.com/> y solicite chequear el dominio 
`unlu.edu.ar`. Describa al menos 3 de los chequeos/verificaciones realizados y los resultados obtenidos.

9. ¿Quién tiene a su cargo la administración de los nombres de dominio bajo el dominio `.ar`? ¿Qué y cuáles son las zonas especiales? ¿Que requisito especial se requiere para solicitar un dominio `.org.ar`?

#### Bibliografía

* "Sistemas Distribuidos, Conceptos y Diseño", G. Coulouris, j. Dollimore, Tim Kindberg. Addison Wesley. Capítulo 9: "Servicios de Nombres".
* "TCP/IP Illustrated Vol.1", Richard Stevens, Addison Wesley. Capítulo 14: "DNS: The Domain Name System".
* "Redes globales de información con Internet y TCP/IP". Douglas E. Comer, Prentice Hall. Capítulo 22: "Sistema de nombre de dominio (DNS)"

#### Recursos en Internet
* Para cada uno de los protocolos desarrollados a lo largo de la cursada, busque cuales son los Request For Comments (RFC) o Internet Draft que los describen, siguiendo la cadena de actualizaciones. Recurra a 
<http://www.faqs.org>, <http://www.rfc-editor.org> y <http://www.ietf.org>
* "El libro del administrador de Debian". Raphaël Hertzog, Roland Mas. Capítulo 10.6. "Servidores de nombres de dominio (DNS)". 2014. Disponible en <http://debian-handbook.info/browse/es-ES/stable/sect.domain-name-servers.html>
* The NetBSD Guide . The NetBSD Foundation, Federico Lupi . Capítulo 26. "The Domain Name System". 2014. Disponible en <https://www.netbsd.org/docs/guide/en/chap-dns.html>

\pagebreak

Documentación de configuración de la zona `[su-nro-legajo].tyr`
===============================================================

    Nombre de la zona DNS: ______________.tyr
    Nombre del servidor DNS: ________________.tyr
    Dirección de correo del contacto: _______________________________
    Número de serie de la zona: ___________
    Tiempo de vida en caché: _____ segundos


#### Resource Records (RR)

| Nombre de Host | Clase | Tipo de RR | Datos del RR     | Comentario |
| -------------- | :---: | :--------: | ---------------- | ---------- |
| mail           |  IN   | A          | 190.104.80.3     | (ejemplo)  |
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
| 3.80.104.190.in-addr.arpa.  |  IN   |    PTR     | mail.unlu.edu.ar. | (ejemplo)  |
|                             |  IN   |            |                   |            |
|                             |  IN   |            |                   |            |
|                             |  IN   |            |                   |            |
|                             |  IN   |            |                   |            |
|                             |  IN   |            |                   |            |
