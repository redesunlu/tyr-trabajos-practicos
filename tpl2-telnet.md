TPL 2 - Aplicaciones 1: Cliente/Servidor - Telnet
=================================================

**Fecha de Entrega:** Luján 05/04/2018


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

\pagebreak

3. Instale un servidor _telnet_:

        apt-get install telnetd

4. Establezca una sesión Telnet a otro host del laboratorio, obtenga un listado de procesos (mediante `ps`), y finalice la sesión, realizando una captura de todo el proceso utilizando `tshark`.

    Analice la captura, identifique las tramas que corresponden a la transmisión de datos a nivel aplicación, cuáles a protocolos auxiliares (si existen) y al establecimiento y cierre de la conexión TCP.  Comente las características de la información en tránsito con respecto a la confidencialidad.

5. Investigue acerca de la diferencia en la ejecución de procesos servidores en modo stand-alone y como esclavos del proceso _inetd_ (provisto por alguno de los paquetes _openbsd-inetd, inetutils-inetd, xinetd_). Mencione ventajas y desventajas de cada modelo.

6. Instale e inicie en **netkit** el laboratorio de Telnet provisto por los docentes, disponible en <https://github.com/redesunlu/netkit-labs/raw/master/tarballs/netkit-lab_telnet-TYR.tar.gz>

    El laboratorio cuenta con dos hosts. El primer host actuará como cliente telnet (_client_), mientras que el segundo host actuará como servidor remoto de telnet (_remote_).

    1. Asigne una dirección IP al host _cliente_ dentro de la red `172.16.0.0/24`.
    2. Inicie una captura de tráfico en el enlace A.
    3. En la terminal del host _cliente_, conéctese mediante telnet al host _remoto_, cuya dirección IP es `172.16.0.10`. Utilice el nombre de usuario `root` y la clave `ultrasecreta`.
    4. Con la sesión iniciada en el host _remoto_, ejecute el siguiente comando respetando la sintaxis.

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
    (stdin)= HASH-MD5-DE-LA-LINEA-ANTERIOR

por ejemplo

    root     pts/0        Mar 15 11:31 (172.16.0.2)
    (stdin)= f94cccb03ebbffef4aa22b514211a503

El hash (md5) se solicita para validar que el estudiante no cambió el texto de la salida. Hay que recordar que la IP del cliente puede variar pues se deja a libre elección del estudiante.

#### --- Fin notas para ayudantes ---


#### Bibliografía

* "TCP/IP Illustrated Vol.1", Richard Stevens, Addison Wesley.  Capítulo 26: "Telnet and Rlogin: Remote Login".
* "Redes globales de información con Internet y TCP/IP". Tercera Edición. Douglas E. Comer, Prentice Hall. Capítulo 23: "Aplicaciones: acceso remoto (TELNET, Rlogin)".

#### Recursos en internet

* Para cada uno de los protocolos (TELNET, HTTP, DNS, FTP, etc.) a desarrollar a lo largo de la cursada, busque
cuales son los Request For Comments (RFC) o Internet Draft que los describen, siguiendo la cadena de
actualizaciones. Recurra a <http://www.faqs.org>, <http://www.rfc-editor.org>, y <http://www.ietf.org>
