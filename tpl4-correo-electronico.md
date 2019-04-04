TPL 4 - Correo Electrónico SMTP - POP3 - IMAP4 - MIME
=====================================================

**Fecha de Entrega:** Luján 24/04/2019

**Objetivo:** Permitir la comprensión del funcionamiento del servicio de correo electrónico, a través del análisis de los principales protocolos y agentes que integran su arquitectura.

#### Notas para ayudantes

* Agregué el ejercicio 9 donde los estudiantes deben obtener el código fuente
  de un mensaje de correo electrónico de tipo SPAM que posea en su casilla.

    Pido un mensaje de SPAM para no lidiarme con todo el tema de la
    confidencialidad y demás. Un spam no debería tener datos privados.

#### --- Fin notas para ayudantes ---

1. Describa el objetivo y como opera la aplicación correo electrónico, indicando los elementos involucrados: que son y cuál es la función de los agentes de usuario (user agents - UAs) y agentes de transferencia de mensajes (mail transfer agent - MTAs), ¿qué servicio adicional se requiere para la transferencia de mensajes?.

2. ¿Qué es un Relay Agent, qué función cumple y en qué casos se utiliza?.

3. ¿Cuáles son los comandos SMTP de una implementación mínima?  
   Describa someramente cada uno.

4. Comente los problemas que plantea el uso de SMTP en cuanto a que el protocolo no requiere obligatoriamente la autenticación por parte del usuario que envía correo y el abuso que esto puede acarrear.

5. ¿Cuál es el propósito de los protocolos POP e IMAP?  
   Describa brevemente los comandos disponibles para el protocolo POP3.  
   ¿Qué ventajas ofrece el protocolo IMAP4 sobre POP3?

7. ¿Para qué se definió la extensión MIME? Describa cómo se implementa y los diferentes tipos de contenidos y codificación MIME.

8. Instale e inicie en el entorno **netkit** el laboratorio de email provisto por los docentes, disponible en
<https://github.com/redesunlu/netkit-labs/raw/master/tarballs/netkit-lab_email.tar.gz> y realice las siguientes actividades:

    1. Inicie una captura desde el host.
    2. Desde la **pc1**, utilizando `nc`, conéctese al servidor SMTP `mail.lugroma3.org` (TCP puerto 25) y envíe un mensaje cuyo remitente sea `su-nombre@lugroma3.org` destinado a la cuenta de correo `guest@nanoinside.net`.
        - Indique en el encabezado Subject: "Resolucion del ejercicio 8". Escriba un cuerpo de mensaje de al menos 3 líneas, incluyendo su nombre y su legajo.
        - Finalice el mensaje escribiendo un punto en una línea en blanco. Deberá ver la respuesta `250 OK id=...` indicando que el mensaje fue procesado correctamente.
    3. Desde la **pc2**, utilizando `nc`, conéctese al servidor POP3 `pop.nanoinside.net` (TCP puerto 110). Acceda a la cuenta de usuario `guest` (contraseña `guest`), recupere el mensaje almacenado en la casilla, bórrelo y finalice adecuadamente la sesión POP.
    4. Detenga el proceso de captura en el host.
    5. Analice la captura y discuta acerca de la confidencialidad de los datos transmitidos.
    6. Identifique la conexión TCP que se establece entre los MTA's. Utilice `tshark` para mostrar el contenido de dicho stream y adjúntelo.
    7. ¿Qué cosas adicionó al mensaje original el servidor `mail.lugroma3.org`?

9. Utilizando `nc`, conéctese al servidor SMTP indicado por el docente (puerto 25) y envíele un mensaje. El mismo debe cumplir con los requisitos de la RFC 5322, indicará en FROM su apellido y legajo, y un cuerpo del mensaje tipo MIME Text/Plain donde debe responder cuales son los campos de encabezado obligatorios según RFC5322.

9. Seleccione un mensaje dentro de la carpeta SPAM de su casilla de correo y,
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

* STALLINGS, W. 2002. Capítulo 19.3: "Electronic Mail: SMPTP and MIME" en _Comunicaciones y Redes de Computadoras (6ta ed)_. Prentice Hall.
* STEVENS, R. 1994. Capítulo 28: "SMTP: Simple Mail Transfer Protocol" en _TCP/IP Illustrated Vol.1_. Addison Wesley.
* GORALSKI, W. 2017. Capítulo 25: "SMTP and Email" en _The Illustrated Network: How TCP/IP Works in a Modern Network (2nd ed)_. Morgan Kaufmann.  
  <https://www.sciencedirect.com/science/book/9780128110270>
* RFC 5321 Simple Mail Transfer Protocol
* RFC 2487 SMTP Service Extension for Secure SMTP over Transport Layer Security
* RFC 2554 SMTP Service Extension for Authentication
* RFC 1939 Post Office Protocol - Versión 3
* RFC 1734 POP3 AUTHentication command
* RFC 3501 IMAP4 (Internet Message Access Protocol v4)
* RFC 1731 IMAP4 Authentication Mechanisms
* RFC 5322, Internet Message Format
* RFC 2045, 2046, 2047, 2049, 4288, 4289 MIME (Multipurpose Internet Mail Extensions).

#### Entorno Netkit

* <https://github.com/redesunlu/netkit-doc/>
* <https://github.com/redesunlu/netkit-doc/blob/master/manual-de-uso.md>
* <https://github.com/redesunlu/netkit-doc/blob/master/preguntas-frecuentes.md>
