TPL 4 - Correo Electrónico SMTP - POP3 - IMAP4 - MIME
=====================================================

**Fecha de Entrega:** 22/04/2024

**URL de Entrega:** <https://tinyurl.com/TyR-2024-TP4>

**Objetivo:** Permitir la comprensión del funcionamiento del servicio de correo electrónico, a través del análisis de los principales protocolos y agentes que integran su arquitectura.

### Consignas

1. Un usuario redacta un mensaje destinado a `consultas@empresax.com.ar` en su cliente de correo y lo envía mediante su propio MTA. Detalle paso a paso el procedimiento que debe seguir el MTA del usuario para entregar el mensaje al destinatario.

2. Comente los problemas que plantea el uso de SMTP en cuanto a que el protocolo no requiere obligatoriamente la autenticación por parte del usuario que envía correo y el abuso que esto puede acarrear.

3. Instale e inicie en el entorno **kathará** el laboratorio de email provisto por los docentes, disponible en
<https://github.com/redesunlu/kathara-labs/blob/main/tarballs/kathara-lab_email.tar.gz> y realice las siguientes actividades:

    1. Inicie una captura desde el host.
    2. Desde la **pc1**, utilizando `nc`, conéctese al servidor SMTP `mail.lugroma3.org` (TCP puerto 25) y envíe un mensaje cuyo remitente sea `<su-nombre@lugroma3.org>` destinado a la cuenta de correo `<guest@nanoinside.net>`.
        - Indique en el encabezado Subject: "Resolucion del ejercicio 3". Escriba un cuerpo de mensaje de al menos 3 líneas, incluyendo su nombre y su legajo.
        - Finalice el mensaje escribiendo un punto en una línea en blanco. Deberá ver la respuesta `250 OK id=...` indicando que el mensaje fue procesado correctamente.
    3. Desde la **pc2**, utilizando `nc`, conéctese al servidor POP3 `pop.nanoinside.net` (TCP puerto 110). Acceda a la cuenta de usuario `guest` (contraseña `guest`), recupere el mensaje almacenado en la casilla, bórrelo y finalice adecuadamente la sesión POP.
    4. Detenga el proceso de captura en el host.
    5. Analice la captura y discuta acerca de la confidencialidad de los datos transmitidos.
    6. Identifique la conexión TCP que se establece entre los MTA's. Utilice `tshark` para mostrar el contenido de dicho stream y adjúntelo.
    7. ¿Qué cosas adicionó al mensaje original el servidor `mail.lugroma3.org`?

4. Utilizando el comando `nc -C` (el parámetro `-C` es requerido para este ejercicio), conéctese al servidor SMTP `smtp.ethereal.email` (puerto 25) y efectúe toda la transacción SMTP necesaria para enviar un mensaje a la dirección de correo `<rozella.crist@ethereal.email>`

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


### Preguntas (guía de lectura)

Describa el objetivo y como opera la aplicación correo electrónico, indicando los elementos involucrados: que son y cuál es la función de los agentes de usuario (user agents - UAs) y agentes de transferencia de mensajes (mail transfer agent - MTAs).

¿Cuáles son los comandos SMTP de una implementación mínima? Describa someramente cada uno.

Describa el formato de mensajes de Internet (Internet Message Format - IMF). Utilidad y alcance. ¿Qué resultado se obtendrá si se envía un correo electrónico que no respete el IMF?

¿Cuál es el objetivo de las extensiones MIME? Describa cómo se implementa y brinde ejemplos de diferentes tipos de contenidos y codificación.

¿Cuál es el propósito de los protocolos POP e IMAP? Describa brevemente los comandos disponibles para el protocolo POP3. ¿Qué ventajas ofrece el protocolo IMAP4 sobre POP3?
