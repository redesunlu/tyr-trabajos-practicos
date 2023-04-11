TPL 4 - Correo Electrónico SMTP - POP3 - IMAP4 - MIME
=====================================================

**Fecha de Entrega:** 24/04/2023

**URL de Entrega:** <https://tinyurl.com/TyR-2023-TP4>

**Objetivo:** Permitir la comprensión del funcionamiento del servicio de correo electrónico, a través del análisis de los principales protocolos y agentes que integran su arquitectura.

#### Notas para ayudantes

* Agregué el ejercicio 9 donde los estudiantes deben obtener el código fuente
  de un mensaje de correo electrónico de tipo SPAM que posea en su casilla.

    Pido un mensaje de SPAM para no lidiarme con todo el tema de la
    confidencialidad y demás. Un spam no debería tener datos privados.

* Nota 2020: En el punto 8, en vez de utilizar el servidor `mail.unlu.edu.ar`,
  puse que utilicen uno externo, pues nuestro servidor de correo posee varias
  restricciones para evitar el ingreso de SPAM, y es poco probable que permita
  un mail desde una IP cualquiera. Más abajo pongo el resultado de una de las
  pruebas que efectué.

    En reemplazo, se utiliza el servidor de correo `smtp.ethereal.email`,
    que es un SMTP server que almacena temporalmente los mensajes recibidos
    desde cualquier emisor a un destinatario particular.<br>
    Para TyR, el destinatario es la casilla `jaiden.sipes59@ethereal.email`
    y los mensajes de correo recibidos pueden visualizarse en la web
    accediendo a <https://ethereal.email/messages> con la clave
    `ecSq3z5mn11B2hgUB9` o bien mediante POP o IMAP (con la misma clave).
    Hay que tener en cuenta que los mensajes sólo duran 1 día en la casilla.

  * 2023 la cuenta de ehteral.email no existe mas. Se crea una nueva: "Melissa Veum" melissa.veum@ethereal.email pass capc43DG3Vf3jXNRVW
  
#### --- Fin notas para ayudantes ---

### Consignas

1. Un usuario redacta un mensaje destinado a `consultas@empresax.com.ar` en su cliente de correo y lo envía mediante su propio MTA. Detalle paso a paso el procedimiento que debe seguir el MTA del usuario para entregar el mensaje al destinatario.

2. Comente los problemas que plantea el uso de SMTP en cuanto a que el protocolo no requiere obligatoriamente la autenticación por parte del usuario que envía correo y el abuso que esto puede acarrear.

3. Instale e inicie en el entorno **kathará** el laboratorio de email provisto por los docentes, disponible en
<https://github.com/redesunlu/netkit-labs/raw/master/tarballs/kathara-lab_email.tar.gz> y realice las siguientes actividades:

    1. Inicie una captura desde el host.
    2. Desde la **pc1**, utilizando `nc`, conéctese al servidor SMTP `mail.lugroma3.org` (TCP puerto 25) y envíe un mensaje cuyo remitente sea `<su-nombre@lugroma3.org>` destinado a la cuenta de correo `<guest@nanoinside.net>`.
        - Indique en el encabezado Subject: "Resolucion del ejercicio 3". Escriba un cuerpo de mensaje de al menos 3 líneas, incluyendo su nombre y su legajo.
        - Finalice el mensaje escribiendo un punto en una línea en blanco. Deberá ver la respuesta `250 OK id=...` indicando que el mensaje fue procesado correctamente.
    3. Desde la **pc2**, utilizando `nc`, conéctese al servidor POP3 `pop.nanoinside.net` (TCP puerto 110). Acceda a la cuenta de usuario `guest` (contraseña `guest`), recupere el mensaje almacenado en la casilla, bórrelo y finalice adecuadamente la sesión POP.
    4. Detenga el proceso de captura en el host.
    5. Analice la captura y discuta acerca de la confidencialidad de los datos transmitidos.
    6. Identifique la conexión TCP que se establece entre los MTA's. Utilice `tshark` para mostrar el contenido de dicho stream y adjúntelo.
    7. ¿Qué cosas adicionó al mensaje original el servidor `mail.lugroma3.org`?

4. Utilizando el comando `nc -C` (el parámetro `-C` es requerido para este ejercicio), conéctese al servidor SMTP `smtp.ethereal.email` (puerto 25) y efectúe toda la transacción SMTP necesaria para enviar un mensaje a la dirección de correo `<melissa.veum@ethereal.email>`

    Como remitente del mensaje utilice su propia cuenta de correo y como Asunto (Subject) especifique su nombre completo y legajo. Todo el mensaje debe cumplir con los requisitos de la RFC 5322 y ser de tipo MIME text/plain. Dentro del cuerpo del mensaje responda cuáles son los campos de encabezado obligatorios según RFC5322.

    Como resolución de este ejercicio, copie y pegue los comandos enviados y las respuestas recibidas desde el servidor (es decir, toda la transacción efectuada).

5. Seleccione un mensaje dentro de la carpeta SPAM de su casilla de correo y,
   utilizando el menú ". . .", descargue el código RFC 822 del mismo (en Gmail
   corresponde a la opción _Mostrar original_, en Outlook a _Ver origen del
   mensaje_, en Yahoo a _Ver mensaje original_, etc).
   Analice los encabezados del mensaje e indique:

    * La semántica y el valor de los campos de encabezado vistos en clase
      (From, To, CC, Date, Subject, Reply-To, MIME-Version, Content-Type),
    * El valor del campo Return-Path y si coincide con el valor del campo From,
    * La lista de servidores SMTP por los que fue pasando el mensaje
      (encabezados que comienzan con `Received: from`), la hora en la que pasó
      por cada uno de ellos y qué protocolo se utilizó en la transferencia
      (indicado por `with ...`).
    * Si es MIME de tipo _multipart/*_, determinar para qué se utiliza el valor
      del dato `boundary`, cuantos bloques componen el mensaje, qué tipo de
      contenido (Content-Type) y qué codificación se utiliza
      (Content-Transfer-Encoding) en cada bloque,


#### Bibliografía

* FOROUZAN, B.A. 2009. _TCP IP Protocol Suite_. McGraw-Hill Higher Education.
  * Capítulo 23: “Electronic Mail: SMTP, POP, IMAP and MIME”
* [RFC 5322 Internet Message Format](https://tools.ietf.org/html/rfc5322)
* [RFC 5321 Simple Mail Transfer Protocol](https://tools.ietf.org/html/rfc5321)
* [RFC 1939 Post Office Protocol - Versión 3](https://tools.ietf.org/html/rfc1939)
* RFC 2045, 2046, 2047, 2049, 4288, 4289 MIME (Multipurpose Internet Mail Extensions).

#### Entorno Netkit

* <https://github.com/redesunlu/netkit-doc/>
* <https://github.com/redesunlu/netkit-doc/blob/master/manual-de-uso.md>
* <https://github.com/redesunlu/netkit-doc/blob/master/preguntas-frecuentes.md>

### Preguntas (guía de lectura)

Describa el objetivo y como opera la aplicación correo electrónico, indicando los elementos involucrados: que son y cuál es la función de los agentes de usuario (user agents - UAs) y agentes de transferencia de mensajes (mail transfer agent - MTAs).

¿Cuáles son los comandos SMTP de una implementación mínima? Describa someramente cada uno.

Describa el formato de mensajes de Internet (Internet Message Format - IMF). Utilidad y alcance. ¿Qué resultado se obtendrá si se envía un correo electrónico que no respete el IMF?

¿Cuál es el objetivo de las extensiones MIME? Describa cómo se implementa y brinde ejemplos de diferentes tipos de contenidos y codificación.

¿Cuál es el propósito de los protocolos POP e IMAP? Describa brevemente los comandos disponibles para el protocolo POP3. ¿Qué ventajas ofrece el protocolo IMAP4 sobre POP3?


### Notas para ayudantes

Esta bibliografía queda aparte pues no figura en el listado realizado en 2020

* GORALSKI, W. 2017. [The Illustrated Network: How TCP/IP Works in a Modern Network (2nd ed)](https://www.sciencedirect.com/science/book/9780128110270). Morgan Kaufmann.
  * Capítulo 25: "SMTP and Email"

Otras RFC Relevantes

* RFC 2487 SMTP Service Extension for Secure SMTP over Transport Layer Security
* RFC 2554 SMTP Service Extension for Authentication
* RFC 1734 POP3 AUTHentication command
* RFC 3501 IMAP4 (Internet Message Access Protocol v4)
* RFC 1731 IMAP4 Authentication Mechanisms

#### Problemas con mail.unlu.edu.ar desde fuera de la Universidad

La siguiente es una transcripción de intento de envío de mail desde la red
de mi domicilio hacia un correo de la Universidad, donde pueden verse las
trabas que imponen los mecanismos antispam.

    $ nc mail.unlu.edu.ar smtp
    220 mail.unlu.edu.ar ESMTP
    HELO maurom.com
    250 mail.unlu.edu.ar
    MAIL FROM: maurom@example.com
    250 2.1.0 Ok
    RCPT TO: maurom@unlu.edu.ar
    550 5.7.27 <maurom@example.com>: Sender address rejected: Domain example.com
        does not accept mail (nullMX)
    HELO maurom.com
    250 mail.unlu.edu.ar
    MAIL FROM: someone@unlu.edu.ar
    250 2.1.0 Ok
    RCPT TO: maurom@unlu.edu.ar
    554 5.7.1 Service unavailable; Client host [181.16.123.141] blocked using
        zen.spamhaus.org; https://www.spamhaus.org/query/ip/181.16.123.141
    QUIT
    221 2.0.0 Bye

    $ nc smtp.gmail.com smtp
    220 smtp.gmail.com ESMTP x8sm8613293qti.51 - gsmtp
    HELLO maurom.com
    502 5.5.1 Unrecognized command. x8sm8613293qti.51 - gsmtp
    HELO maurom.com
    250 smtp.gmail.com at your service
    MAIL FROM: maumeloni@gmail.com
    530 5.7.0 Must issue a STARTTLS command first. x8sm8613293qti.51 - gsmtp
    STARTTLS
    220 2.0.0 Ready to start TLS
    MAIL FROM: maumeloni@gmail.com

    $ nc mail.unlu.edu.ar smtp
    220 mail.unlu.edu.ar ESMTP
    HELO maurom.com
    250 mail.unlu.edu.ar
    MAIL FROM: maurom@unlu.edu.ar
    250 2.1.0 Ok
    RCPT TO: maurom@unlu.edu.ar
    554 5.7.1 Service unavailable; Client host [181.16.123.141] blocked using
        zen.spamhaus.org; https://www.spamhaus.org/query/ip/181.16.123.141
    QUIT
    221 2.0.0 Bye
    

2021: Intento de envío usando gmail (si funcionaba tal vez podrían enviar a la cuenta de la materia):

    nc 64.233.184.26 25
    220 mx.google.com ESMTP w26si4443971wmk.159 - gsmtp
    helo mihost.telered.com.ar
    250 mx.google.com at your service
    mail from: <florge@gmail.com>
    250 2.1.0 OK w26si4443971wmk.159 - gsmtp
    rcpt to: <florge@gmail.com>
    250 2.1.5 OK w26si4443971wmk.159 - gsmtp
    data
    354  Go ahead w26si4443971wmk.159 - gsmtp
    Subject: Prueba de envio de mail con nc

    Hola Mundo!
    
    .

    .


y no dio bolilla al fin de datos. (tuve que cortar la conxeción)
Actualización, falta usar "-C" con el nc. El resultado fue:

    550-5.7.1 [181.16.127.234] The IP you're using to send mail is not authorized to
    550-5.7.1 send email directly to our servers. Please use the SMTP relay at your
    550-5.7.1 service provider instead. Learn more at
    550 5.7.1  https://support.google.com/mail/?p=NotAuthorizedError n6si4959770ljc.380 - gsmtp
    
Aguante ehtereal.email

### Fin notas para ayudantes
