TPL 2 - Aplicaciones 1: Cliente/Servidor - Telnet
=================================================

**Fecha de Entrega:** 02/04/2020

La presente guía tiene por objetivo familiarizar el trabajo con aplicaciones cliente/servidor y, como primer ejemplo de aplicación de la pila TCP/IP, el protocolo de acceso remoto telnet.

Las actividades prácticas deberán ser resueltas íntegramente utilizando netkit.

Para el estudio previo de los temas se sugiere la siguiente lectura:

Modelo cliente/servidor: Capítulo 17 (hasta pagina 546) [FOR09]

Multiplexación en capas de transporte de la pila TCP/IP: ["TCP/IP Processes, Multiplexing and Client/Server Application Roles"](http://www.tcpipguide.com/free/t_TCPIPProcessesMultiplexingandClientServerApplicati.htm), y temas siguientes hasta "Common TCP/IP Applications and Assigned Well-Known and Registered Port Numbers"

Establecimiento de conexiones TCP, Negociación de 3 Vías (three way handshake): <https://www.youtube.com/watch?v=ixBAG8apsFM> (minuto 2:0 en adelante)
 
Protocolo Telnet: Capítulo 20.1 [FOR09]

# Primer parte: Creación de un modelo simple Cliente/Servidor

Utilice para esta practica el laboratorio de Netkit _webserver_. Al inciarlo, cada terminal tendra un rol asignado. Defina un numero de puerto para el servidor (superior a 1024) y verifique las IPs de cada terminal. Realice una captura de todo el proceso utilizando la herramienta `tcpdump`, guardándola en un archivo en formato _pcap_ para su posterior análisis.

Un host debera actuar como servidor, indicando como parámetro el numero de puerto. Una vez iniciado el proceso, este servicio quedara en modo de _escucha_ o _listening_. En el otro host inicie un cliente indicándole como parámetros la IP del servidor y puerto establecido en el comando servidor.

#### Notas para ayudantes

Esto lo veo complicado de hacer sin multiplexor de terminal...
Verifique desde otra terminal que el proceso servidor esté en "escucha" en el puerto indicado (usando comandos tipo `ss` o `netstat`).

#### --- Fin notas para ayudantes ---

Si generó correctamente los procesos servidor y cliente, debería poder ver una especie de "chat". Intercambie varios mensajes con el otro dispositivo y finalice la conexión. Luego detenga la captura (CTRL+C).

Analice la captura almacenada en el archivo utilizando `tshark` y diversos parámetros de visualización (consulte la guia de comandos provista por la materia).

a) "Extraiga" de la captura solamente los datos intercambiados a nivel aplicación y remítalos.

b)  Realice un diagrama representando el intercambio de tramas indicando las que corresponden al establecimiento de la conexión TCP a las de transmisión de datos a nivel aplicación, y a las del cierre de la conexión TCP.

c) ¿Todas las tramas en las que identifica el protocolo TCP transportan datos de aplicación?. ¿Si no es así puede explicar el porqué?


# Segunda parte: Protocolo de acceso remoto TELNET

Instale e inicie en **netkit** el laboratorio de Telnet provisto por los docentes, disponible en <https://github.com/redesunlu/netkit-labs/raw/master/tarballs/netkit-lab_telnet-TYR.tar.gz>

El laboratorio cuenta con dos hosts. El primer host actuará como cliente telnet (_client_), mientras que el segundo host actuará como servidor remoto de telnet (_remote_).

Asigne una dirección IP al host _cliente_ dentro de la red `172.16.0.0/24`.

Inicie una captura de tráfico en el enlace A.

En la terminal del host _cliente_, conéctese mediante telnet al host _remoto_, cuya dirección IP es `172.16.0.10`. Utilice el nombre de usuario `root` y la clave `ultrasecreta`.

Con la sesión iniciada en _remoto_, ejecute el siguiente comando respetando la sintaxis.

            who && who | openssl dgst

Copie la salida de dicho comando como resolución de este ejercicio. Añada además todos los comandos que ejecutó para lograr dicho resultado.

Salga del host remoto escribiendo el comando `exit`

Detenga y guarde la captura de tráfico. Remítala como parte de la tarea.

Analice la captura:

a) Identifique e indique identifique las tramas que corresponden a la transmisión de datos a nivel aplicación, cuáles a protocolos auxiliares (si existen) y al establecimiento y cierre de la conexión TCP.

b) Comente las características de la información en tránsito con respecto a la confidencialidad.

#### Notas para ayudantes

    8. (opcional) Analice la captura y busque entre los datos cargados por los paquetes IP la clave que utilizó para acceder al servidor remoto. ¿Puede leerse fácilmente?
    9. (opcional) Identifique los paquetes que establecen la conexión TCP entre los hosts.

Spoiler! El ejercicio está bien resuelto cuando el comado `who` devuelve

    root     pts/0        Fecha y Hora (IP-DEL-CLIENTE)
    (stdin)= HASH-MD5-O-SHA256-DE-LA-LINEA-ANTERIOR

por ejemplo

    root     pts/0        Mar 15 11:31 (172.16.0.2)
    (stdin)= f94cccb03ebbffef4aa22b514211a503

El hash (md5 o sha256, dependiendo de la versión de openssl) se solicita para validar que el estudiante no cambió el texto de la salida. Hay que recordar que la IP del cliente puede variar pues se deja a libre elección del estudiante.

Old bibliografia

* "TCP/IP Illustrated Vol.1", Richard Stevens, Addison Wesley.  Capítulo 26: "Telnet and Rlogin: Remote Login".
* "Redes globales de información con Internet y TCP/IP". Tercera Edición. Douglas E. Comer, Prentice Hall. Capítulo 23: "Aplicaciones: acceso remoto (TELNET, Rlogin)".

#### --- Fin notas para ayudantes ---

### Bibliografía

[FOR09] Capítulo 17: "Introduction to the Application Layer" (hasta pagina 546)

[FOR09] Capítulo 20: "Remote Login: TELNET and SSH"

### Recursos en internet

* Para cada uno de los protocolos (TELNET, HTTP, DNS, FTP, etc.) a desarrollar a lo largo de la cursada, busque cuales son los Request For Comments (RFC) o Internet Draft que los describen, siguiendo la cadena de actualizaciones. Recurra a <http://www.faqs.org>, <http://www.rfc-editor.org>, y <http://www.ietf.org>

### Referencia

[FOR09] FOROUZAN, B.A. TCP IP Protocol Suite. McGraw-Hill Higher Education, 2009.


### Preguntas (guía de lectura)

En la capa de aplicación a qué se denomina cliente y a qué servidor.

En el stack TCP/IP, ¿cómo es posible que un protocolo de transporte brinde servicio a n procesos ejecutándose en un mismo host.?

Cuáles son las características y usos del protocolo telnet.
