TPL 4 - Correo Electrónico SMTP - POP3 - IMAP4 - MIME
=====================================================

**Fecha de Entrega:** Luján xx/xx/xxxx

**Objetivo:** Permitir la comprensión del funcionamiento del servicio de correo electrónico, a través del análisis de los principales protocolos y agentes que integran su arquitectura.

#### Notas para ayudantes

* Acá van notas nuestras que consideren pertinentes.
* Le saqué los # a los comandos porque los estudiantes lo escribían. Si hace falta, lo vuelvo a poner.

#### --- Fin notas para ayudantes ---

1. Describa el objetivo y como opera la aplicación correo electrónico, indicando los elementos involucrados: que son y cuál es la función de los agentes de usuario (user agents - UAs) y agentes de transferencia de mensajes (mail transfer agent - MTAs), ¿qué servicio adicional se requiere para la transferencia de mensajes?.

2. ¿Qué es un Relay Agent, qué función cumple y en qué casos se utiliza?.

3. ¿Cuáles son los comandos SMTP de una implementación mínima?  
   Describa someramente cada uno.

4. Comente los problemas que plantea el uso de SMTP en cuanto a que el protocolo no requiere obligatoriamente la autenticación por parte del usuario que envía correo y el abuso que esto puede acarrear.

5. ¿Cuál es el propósito de los protocolos POP e IMAP? Describa los comandos disponibles para el protocolo POP3.

6. ¿Qué ventajas ofrece el protocolo IMAP4 sobre POP3?

7. ¿Para qué se definió la extensión MIME? Describa cómo se implementa y los diferentes tipos de contenidos y codificación MIME.

8. Instale e inicie en el entorno **netkit** el laboratorio de email provisto por los docentes, disponible en
<http://www.unlu.edu.ar/~tyr/netkit/netkit-lab_email-TYR.tar.gz> y realice las siguientes actividades:

    1. Inicie una captura desde el host.
    2. Desde la **pc1**, utilizando `nc`, conéctese al servidor SMTP `mail.lugroma3.org` (TCP puerto 25) y envíe un mensaje cuyo remitente sea `su-nombre@lugroma3.org` destinado a la cuenta de correo `guest@nanoinside.net`.
        - Indique en el encabezado Subject: "Resolucion del ejercicio 9". Escriba un cuerpo de mensaje de al menos 3 líneas, incluyendo su nombre y su legajo.
        - Finalice el mensaje escribiendo un punto en una línea en blanco. Deberá ver la respuesta `250 OK id=...` indicando que el mensaje fue procesado correctamente.
    3. Desde la **pc2**, utilizando `nc`, conéctese al servidor POP3 `pop.nanoinside.net` (TCP puerto 110). Acceda a la cuenta de usuario `guest` (contraseña `guest`), recupere el mensaje almacenado en la casilla, bórrelo y finalice adecuadamente la sesión POP.
    4. Detenga el proceso de captura en el host.
    5. Analice la captura y discuta acerca de la confidencialidad de los datos transmitidos.
    6. Identifique la conexión TCP que se establece entre los MTA's. Utilice `tshark` para mostrar el contenido de dicho stream y adjúntelo.
    7. ¿Qué cosas adicionó al mensaje original el servidor `mail.lugroma3.org`?

9. Utilizando `nc`, conéctese al servidor SMTP indicado por el docente (puerto 25) y envíele un mensaje. El mismo debe cumplir con los requisitos de la RFC 5322, indicará en FROM su apellido y legajo, y un cuerpo del mensaje tipo MIME Text/Plain donde debe responder cuales son los campos de encabezado obligatorios según RFC5322.

#### Bibliografía

* "Comunicaciones y Redes de Computadoras", Sexta Edición, William Stallings, Prentice Hall. Capítulo 19.3:
_"Electronic Mail: SMPTP and MIME"_.
* "TCP/IP Illustrated Vol.1", Richard Stevens, Addison Wesley. Capítulo 28: _"SMTP: Simple Mail Transfer Protocol"_.
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
