TPL 2 - Aplicaciones 1: Cliente/Servidor - Telnet
=================================================

**Fecha de Entrega:** Luján 05/04/2018

**Objetivo:** _TODO_

### Consignas

1. Creación de un modelo simple Cliente/Servidor

    Acuerde con otro compañero en los roles iniciales que tendrá cada uno y el número de puerto a utilizar. Realice una captura de todo el proceso utilizando la herramienta `tshark`, guardándola en un archivo en formato _pcap_ para su posterior análisis:

        tshark -­w nombre_archivo -­f 'host x.x.x.x' -­i interfaz

    En el host que actuará como servidor, inicie el proceso `nc`, indicando que abra un número de puerto dado en modo de _escucha_ o _listening_. Para ello, ejecute:

        nc -­l número_de_puerto

    Verifique desde otra terminal que el proceso esté en "escucha" en el puerto indicado ejecutando:

        netstat -­ltnp
o bien
        ss -­ltnp

    En el host que actuará como cliente, inicie el proceso `nc`, indicando que realice una conexión al servidor y puerto dados. Para ello, ejecute:

        nc ip_host_servidor nro_de_puerto

    Una vez establecida la conexión, la entrada estándar del proceso _nc_ se reenviará al otro extremo del socket, donde la instancia par de _nc_ la copiará en su salida estándar, creando una suerte de "chat". Ahora pruebe escribir mensajes en su consola, recordando que la comunicación es bidireccional. Una vez realizado el intercambio de mensajes en ambos sentidos, puede finalizar la conexión enviando EOF (Ctrl+D) o deteniendo el proceso _nc_ (Ctrl+C) desde cualquiera de los hosts.

    Una vez finalizada la conexión, detenga el proceso _tshark_ que se encuentra capturando (CTRL+C).

    Analice la captura almacenada en el archivo utilizando `tshark` con el parámetro `-r`, y diversos parámetros de visualización (consulte la página de manual correspondiente).

    Ejemplos:

        tshark -­r nombre_archivo
        tshark -­r nombre_archivo ­-nV
        tshark -­r nombre_archivo ­-O tcp
        tshark -­r nombre_archivo -­nqz follow,tcp,hex,0

    Realice un diagrama representando el intercambio de tramas indicando las que corresponden a protocolos auxiliares (si existen), al establecimiento y cierre de la conexión TCP y a las de transmisión de datos a nivel aplicación.

2. Describa someramente el protocolo Telnet. Características y usos.

3. Instale un servidor _telnet_:

        apt-­get install telnetd

4. Establezca una sesión Telnet a otro host del laboratorio, obtenga un listado de procesos (mediante `ps`), y finalice la sesión, realizando una captura de todo el proceso utilizando `tshark`.

    Analice la captura, identifique las tramas que corresponden a la transmisión de datos a nivel aplicación, cuáles a protocolos auxiliares (si existen) y al establecimiento y cierre de la conexión TCP.  Comente las características de la información en tránsito con respecto a la confidencialidad.

5. Investigue acerca de la diferencia en la ejecución de procesos servidores en modo stand-alone y como esclavos del proceso _inetd_ (provisto por alguno de los paquetes _openbsd-inetd, inetutils-inetd, xinetd_). Mencione ventajas y desventajas de cada modelo.


#### Notas para ayudantes

6. Instale e inicie en el entorno **netkit** el laboratorio de telnet provisto por los docentes, disponible en <direccion_url> y realice las siguientes actividades:

    1. El laboratorio cuenta con dos hosts. Un host actuará como cliente telnet, mientras que el segundo host actuará como servidor remoto. Tenga en cuenta que **la ventana del servidor no aparecerá en pantalla** para dar la idea de que es un servidor _remoto_.
    2. Inicie una captura de tráfico en el enlace A.
    3. Asigne una dirección IP al host cliente dentro de la red `172.16.0.0/24`.
    4. En la terminal del host _cliente_, conectese mediante telnet al host _remoto_, cuya dirección IP es `172.16.0.10`. Utilice el nombre de usuario `root` y la clave `secreta`. Ahora deberá estar ejecutando comandos en el host _remoto_.
    5. Estando en el host _remoto_, ejecute el siguiente comando respetando su sintaxis.

        who && who | openssl dgst

    6. Salga del host remoto mediante el comando `exit`
    7. Copie la salida de dicho comando como resolución de este ejercicio. Añada además todos los comandos que ejecutó para lograr dicho resultado.
    8. Detenga la captura de tráfico, guardela a un archivo y remítala como parte de la tarea.
    9. (opcional) Analice la captura y busque entre los datos cargados por los paquetes IP la clave que utilizó para acceder al servidor remoto. ¿Puede leerse fácilmente?
   10. (opcional) Identifique los paquetes que establecen la conexión TCP entre los hosts.

**Para este ejercicio tenemos (nosotros) que crear un laboratorio basándonos en el webserver. Más o menos lo tengo armado, pero prefiero tenerlo bien resuelto antes de subirlo a github.**

Spoiler! El ejercicio está bien resuelto cuando el comado `who` devuelve

root   pts/0       Fecha Hora (IP-DEL-CLIENTE)
HASH-SHA256-DE-LA-LINEA-ANTERIOR

por ejemplo

root   pts/0       Mar 14, 14:51 (172.16.0.2)
HASH-SHA256-DE-LA-LINEA-ANTERIOR

El hash se solicita para validar que el estudiante no cambió el texto de la salida.
Hay que recordar que la IP del cliente puede variar pues se deja a libre elección del estudiante.


#### --- Fin notas para ayudantes ---


#### Bibliografía

* "TCP/IP Illustrated Vol.1", Richard Stevens, Addison Wesley.  Capítulo 26: "Telnet and Rlogin: Remote Login".
* "Redes globales de información con Internet y TCP/IP". Tercera Edición. Douglas E. Comer, Prentice Hall. Capítulo 23: "Aplicaciones: acceso remoto (TELNET, Rlogin)".

#### Recursos en internet

* Para cada uno de los protocolos (TELNET, HTTP, DNS, FTP, etc.) a desarrollar a lo largo de la cursada, busque
cuales son los Request For Comments (RFC) o Internet Draft que los describen, siguiendo la cadena de
actualizaciones. Recurra a <http://www.faqs.org>, <http://www.rfc-editor.org>, y <http://www.ietf.org>
