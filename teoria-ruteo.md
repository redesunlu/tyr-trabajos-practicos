Clase Teórica sobre Ruteo Estático y Dinámico
=============================================

Algunas notas varias

- Clase 1 Jue 23/May --> Ruteo estático y 1ra parte de dinámico
- Clase 2 Jue 30/May --> 2da parte ruteo dinámico y práctica
- Separar slides de IPv4 en dos: IPv4 y Ruteo
- Bibliografía: Ver Peterson y Stevens 2da ed (y ver Kurose pues tengo la sensación de que había algo bueno ahí también). Brindar la documentación a los estudiantes.
- [Slides originales (PDF) de Gabriel](http://www.tyr.unlu.edu.ar/pub/11-Red.pdf)
- [Slides nuevas en Drive](https://drive.google.com/drive/folders/1kSItBJif2za2kNWXoTAlTo8yGi67kh5P)
- Para las diapos nuevas, Gabriel propuso utilizar gráficos _basados en_ los del libro de Kurose.
- Reducir el gráfico de encaminamiento que figura en las slides, a 4 hosts con 2 routers.
- Desarrollar más las slides de algoritmos de ruteo (DV / LS)
    - 3 slides para c/u (Bellman Ford / Dijkstra)
    - Dar énfasis al algoritmo por sobre los protocolos
- Cambiar simulador de Ruteo dinámico (el de _mathiaz_ no funciona?)

Temario

- Definición de Encaminamiento
    - La red como un grafo
        - Nodos: Dispositivos (finales e intermedios)
        - Aristas: Enlaces de red
    - Recordar conmutación de paquetes y la decisión de por dónde se (re)enviará un paquete.
        - En circuitos virtuales solo es un problema en la fase de establecimiento de la conexion
        - En una red de datagramas, no existe un camino, sino que la decisión del próximo salto se va tomando en cada nodo intermedio, para cada datagrama.
    - Partir de una red de capa 2 (LAN), consultar si es posible cursar paquetes allí; extender a dos redes interconectadas. Cómo es posible cursar un paquete de una a otra y viceversa?
    - Richard Martin discrimina Ruteo vs Reenvío. _Rutear_ es tomar la decisión de por donde (re)enviar un paquete. _Reenviar_ es la acción siguiente: (re)inyectarlo en el medio.
    - Se trata entonces de ver como cada nodo intermedio dispone de TODA la información necesaria para tomar la mejor decisión posible sobre el proximo salto de cada datagrama.
        - Estructura: Tabla de rutas (como se llena dicha tabla?)
    - Objetivo: encontrar el camino mas corto entre 2 nodos
- Explicar tipo de entrega
    - Directa (misma red de capa 2)
    - Indirecta (otra red de capa 2 anexa)
- Tabla de rutas
    - Explicar cada columna de `route` 
        - Red
        - Gateway o salto siguiente
        - Interfaz
        - Metrica (por arriba): Costo, distancia, latencia.
    - Explicar cómo se selecciona / busca la ruta elegida
        - Para cada fila de la tabla de rutas
        - Se hace DIR_DESTINO AND MASCARA-FILA
        - Se compara contra DIR_RED de la FILA
        - Si son iguales, enviar por la interfaz de la fila (al destino o a GW)
        - Si son distintas, seguir revisando
        - Eventualmente podría coincidir con varias entradas. En tal caso gana la que "mas coincide", pero no hablaremos de de Longest-Prefix-Match.
    - Explicar qué es _gateway_
    - Qué pasa si uno quiere enviar un paquete a direcciones desconocidas? (pie para default gw)
    - Explicar qué es un _default gateway_
- Cómo se llena una tabla de rutas?
    - Manualmente mediante `ip address add` e `ip route add`
        - Ver tema rutas directas (addr add) e indirectas (route add)
        - Problema: Cambios en la topología
          - Enlaces se caen
          - Nuevos nodos
          - Costos de enlace cambian
    - Dinámicamente (protocolos de ruteo dinámico)
    - Mensajes ICMP Redirect

Hasta aquí debería llevar aproximadamente 1 hora.

- Dibujar topología estilo parcial en el pizarrón y realizar ejercicio en clase.
- Hacer previo a la clase, la tabla de rutas que sería "ideal".

Esto nos debería tomar 1 hora más.
Y el resto, lo que se pueda, para lo que sigue.

- Antes de Ruteo Dyn hablar de Sistemas Autónomos.
    - Comentar a muy alto nivel la arquitectura de Internet
    - Comentar la administración de las tablas de rutas a gran/mediana escala
    - Diferenciar ruteo interno (vistos) vs ruteo externo (BGP / IS-IS)
      - IGP (Nodos bajo un mismo control administrativo)
      - EGP (Redes de diferentes "dueños")
- Preguntar qué sucede si la cantidad de redes de capa 3 se incrementa --> ir llevándolos a la necesidad de Ruteo Dyn.
- Caracteristicas
    - Dinámicos: Las novedades en la topología son informadas cuando suceden y la red se ajusta en respuesta
    - Distribuidos: Todos los ruteadores de la red reciben las novedades, no hay un nodo que centralice la información
    - Metodo para distribuir las novedades.
    - Metodo para calcular el camino mas corto.
- Algoritmos de ruteo o de _mantenimiento de tablas_
    - Distance-Vector / Bellman-Ford
    - Link-State / Dijkstra
- Explicar ambos con ejemplos
- Bajar a realidad _comentando_ las implementaciones de ambos
    - RIP / OSPF
    - Explicar pero no ahondar demasiado en ellos

## Ejemplos

### Peterson

![Ejemplo de Distance-Vector de Peterson](/home/tomas/workspace/tyr-wiki/images/routing-peterson-distance-vector-graph.png)