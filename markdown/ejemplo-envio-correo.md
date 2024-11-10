Ejemplo de envío de correo
==========================

Conectarse al servidor `mail3.unlu.edu.ar` mediante nc con la línea siguiente

    nc -C mail3.unlu.edu.ar 25

y luego enviar los siguientes correos (reemplazar destinatario por quien corresponda)

~~~~~~~
NOOP === 8bit ===

HELO tyr13
MAIL FROM: maumeloni@gmail.com
RCPT TO: maurom@unlu.edu.ar

DATA
From: maumeloni@gmail.com
Subject: Ejemplo de envio de correo (8bit)
Date: Thu, 16 Apr 2020 03:00:00 -0300
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Estimado asociado, me comunico con usted en nombre de la
Asociación de Fútbol 5 "Bartolomé Agüero" para recordarle
que mañana Viernes 20 tendrá lugar la primera fecha del
Torneo de Otoño, a las 20:00 hs en la sede de la Asociación.

En caso de no poder asistir al encuentro, rogamos notificar
con al menos 6 hs de antelación.

Por cierto, los encabezados requeridos según la RFC 5322
son From y Date (cuadro pág 20).


Cordialmente,

Mauro
.

NOOP === quoted-printable ===

MAIL FROM: maumeloni@gmail.com
RCPT TO: maurom@unlu.edu.ar

DATA
From: leomessi@fcbarcelona.es
Subject: Ejemplo de envio de correo (quoted)
Date: Thu, 16 Apr 2020 03:00:00 -0300
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Estimado asociado, me comunico con usted en nombre de la
Asociaci=C3=B3n de F=C3=BAtbol 5 "Bartolom=C3=A9 Ag=C3=BCero" para recordar=
le
que ma=C3=B1ana Viernes 20 tendr=C3=A1 lugar la primera fecha del
Torneo de Oto=C3=B1o, a las 20:00 hs en la sede de la Asociaci=C3=B3n.

En caso de no poder asistir al encuentro, rogamos notificar
con al menos 6 hs de antelaci=C3=B3n.

Por cierto, los encabezados requeridos seg=C3=BAn la RFC 5322
son From y Date (cuadro p=C3=A1g 20).


Cordialmente,

Mauro
.

NOOP === base64 ===

MAIL FROM: maumeloni@gmail.com
RCPT TO: maurom@unlu.edu.ar

DATA
From: despacho@casarosada.gob.ar
Subject: Ejemplo de envio de correo (base64)
Date: Thu, 16 Apr 2020 03:00:00 -0300
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RXN0aW1hZG8gYXNvY2lhZG8sIG1lIGNvbXVuaWNvIGNvbiB1c3RlZCBlbiBub21icmUgZGUgbGE
NCkFzb2NpYWNpw7NuIGRlIEbDunRib2wgNSAiQmFydG9sb23DqSBBZ8O8ZXJvIiBwYXJhIHJlY2
9yZGFybGUNCnF1ZSBtYcOxYW5hIFZpZXJuZXMgMjAgdGVuZHLDoSBsdWdhciBsYSBwcmltZXJhI
GZlY2hhIGRlbA0KVG9ybmVvIGRlIE90b8OxbywgYSBsYXMgMjA6MDAgaHMgZW4gbGEgc2VkZSBk
ZSBsYSBBc29jaWFjacOzbi4NCg0KRW4gY2FzbyBkZSBubyBwb2RlciBhc2lzdGlyIGFsIGVuY3V
lbnRybywgcm9nYW1vcyBub3RpZmljYXINCmNvbiBhbCBtZW5vcyA2IGhzIGRlIGFudGVsYWNpw7
NuLg0KDQpQb3IgY2llcnRvLCBsb3MgZW5jYWJlemFkb3MgcmVxdWVyaWRvcyBzZWfDum4gbGEgU
kZDIDUzMjINCnNvbiBGcm9tIHkgRGF0ZSAoY3VhZHJvIHDDoWcgMjApLg0KDQoNCkNvcmRpYWxt
ZW50ZSwNCg0KTWF1cm8=
.

QUIT
~~~~~~~
