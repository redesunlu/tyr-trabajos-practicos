Clase Teórica sobre Ruteo Estático y Dinámico
=============================================

Algunas notas varias

- Clase 1 Jue 23/May --> Ruteo estático y 1ra parte de dinámico
- Clase 2 Jue 30/May --> 2da parte ruteo dinámico y práctica
- Separar slides de IPv4 en dos: IPv4 y Ruteo
- Bibliografía: Ver Peterson y Stevens 2da ed (y ver Kurose pues tengo la sensación de que había algo bueno ahí también). Brindar la documentación a los estudiantes.
- [Slides originales de Gabriel](http://www.tyr.unlu.edu.ar/pub/11-Red.pdf)
- Para las diapos nuevas, Gabriel propuso utilizar gráficos _basados en_ los del libro de Kurose.
- Reducir el gráfico de encaminamiento que figura en las slides, a 4 hosts con 2 routers.

Temario

- Definición de Encaminamiento
    - Recordar conmutación de paquetes y la decisión de por dónde se (re)enviará un paquete.
    - Partir de una red de capa 2 (LAN), consultar si es posible cursar paquetes allí; extender a dos redes interconectadas. Cómo es posible cursar un paquete de una a otra y viceversa?
    - Richard Martin discrimina Ruteo vs Reenvío. _Rutear_ es tomar la decisión de por donde (re)enviar un paquete. _Reenviar_ es la acción siguiente: (re)inyectarlo en el medio.
- Explicar tipo de entrega
    - Directa (misma red de capa 2)
    - Indirecta (otra red de capa 2 anexa)
- Tabla de rutas
    - Explicar cada columna de `route`
    - Explicar cómo se selecciona / busca la ruta elegida (AND)
    - Explicar qué es _gateway_
    - Qué pasa si uno quiere enviar un paquete a direcciones desconocidas? (pie para default gw)
    - Explicar qué es un _default gateway_
- Cómo se llena una tabla de rutas?
    - Manualmente mediante `ip address add` e `ip route add`
        - Ver tema rutas directas (addr add) e indirectas (route add)
    - Dinámicamente (protocolos de ruteo dinámico)
    - Mensajes ICMP Redirect

Hasta aquí debería llevar aproximadamente 1 hora.

- Dibujar topología en el pizarrón y realizar ejercicio de papel