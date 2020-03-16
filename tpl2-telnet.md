TPL 2 - Aplicaciones 1: Cliente/Servidor - Telnet
=================================================

**Fecha de Entrega:** 02/04/2020


1. Creación de un modelo simple Cliente/Servidor

    Acuerde con otro compañero en los roles iniciales que tendrá cada uno y el número de puerto a utilizar. Realice una captura de todo el proceso utilizando la herramienta `tcpdump`, guardándola en un archivo en formato _pcap_ para su posterior análisis.

    Un host debera actuar como servidor, indicando como parametros el numero de puerto. Iniciado el proceso, este servicio quedara en modo de _escucha_ o _listening_. En el otro host se debera iniciar un cliente indicandole IP del servidor y puerto establecido en el comando servidor. Verifique desde otra terminal que el proceso servidor esté en "escucha" en el puerto indicado (usando comandos tipo `ss` o `netstat`).

    Si generó correctamente los procesos servidor y cliente, deberia poder ver una especie de "chat". Intercambie varios mensajes con el otro dispositivo y finalice la conexión. Luego detenga la captura (CTRL+C).

    Analice la captura almacenada en el archivo utilizando `tshark` y diversos parámetros de visualización (consulte la guia de comandos provista por la materia).

    Realice un diagrama representando el intercambio de tramas indicando las que corresponden al establecimiento y cierre de la conexión TCP y a las de transmisión de datos a nivel aplicación.

2. Describa someramente el protocolo Telnet. Características y usos.

3. Instale o verifique que el cliente `telnet` y el servidor telnet correspondiente (llamado `telnetd`) se encuentran en el dispositivo.

4. Establezca una sesión Telnet a otro host del laboratorio, obtenga un listado de procesos y finalice la sesión, realizando una captura de todo el proceso en consola aparte.

    Analice la captura, identifique las tramas que corresponden a la transmisión de datos a nivel aplicación, cuáles a protocolos auxiliares (si existen) y al establecimiento y cierre de la conexión TCP.  Comente las características de la información en tránsito con respecto a la confidencialidad.

5. Investigue acerca de la diferencia en la ejecución de procesos servidores en modo stand-alone y como esclavos del proceso _inetd_ (provisto por alguno de los paquetes _openbsd-inetd, inetutils-inetd, xinetd_). Mencione ventajas y desventajas de cada modelo.

6. Instale e inicie en **netkit** el laboratorio de Telnet provisto por los docentes, disponible en <https://github.com/redesunlu/netkit-labs/raw/master/tarballs/netkit-lab_telnet-TYR.tar.gz>

    El laboratorio cuenta con dos hosts. El primer host actuará como cliente telnet (_client_), mientras que el segundo host actuará como servidor remoto de telnet (_remote_).

    1. Asigne una dirección IP al host _cliente_ dentro de la red `172.16.0.0/24`.
    2. Inicie una captura de tráfico en el enlace A.
    3. En la terminal del host _cliente_, conéctese mediante telnet al host _remoto_, cuya dirección IP es `172.16.0.10`. Utilice el nombre de usuario `root` y la clave `ultrasecreta`.
    4. Con la sesión iniciada en _remoto_, ejecute el siguiente comando respetando la sintaxis.

            who && who | openssl dgst

    5. Copie la salida de dicho comando como resolución de este ejercicio.
       Añada además todos los comandos que ejecutó para lograr dicho resultado.
    6. Salga del host remoto escribiendo el comando `exit`
    7. Detenga y guarde la captura de tráfico. Remítala como parte de la tarea.

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

[FOR09] Capítulo 20: “Remote Login: TELNET and SSH”

### Recursos en internet

* Para cada uno de los protocolos (TELNET, HTTP, DNS, FTP, etc.) a desarrollar a lo largo de la cursada, busque cuales son los Request For Comments (RFC) o Internet Draft que los describen, siguiendo la cadena de actualizaciones. Recurra a <http://www.faqs.org>, <http://www.rfc-editor.org>, y <http://www.ietf.org>

### Referencia

[FOR09] FOROUZAN, B.A. TCP IP Protocol Suite. McGraw-Hill Higher Education, 2009.
