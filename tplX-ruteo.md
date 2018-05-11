Ejercicio de Ruteo Dinámico con Netkit
======================================

Una organización está vinculada con su sucursal a través de un proveedor de servicios de conectividad el cual -además- le brinda acceso a Internet. Dicho proveedor interconecta a sus clientes a través de una red propia (nube), que utiliza el bloque de direcciones IP `200.44.0.0` con máscara `255.255.255.0`. A su empresa le ha asignado la red `200.14.32.0` con máscara `255.255.255.0`. La Figura 1 representa gráficamente la topología de la red de la organización.

Con esta información usted debe especificar, en un laboratorio de Netkit, la configuración que permita que la Casa Central se comunique con la Sucursal y mantenga conectividad completa en sus redes internas. Luego, se permita acceso a Internet a la Gerencia, los Servidores (los cuales prestan servicios al exterior) y a la Sucursal.

- Asigne las direcciones de red a las interfaces de todos los dispositivos.
- Las tablas de rutas de los ruteadores deben ser completadas utilizando algún protocolo de ruteo dinámico (RIP / OSPF).
- Escriba las tablas de rutas finales de un dispositivo de cada red y de los routers 1, 3 y 4.
- Como resolución, entregue un informe con las respuestas a estas consignas y con el laboratorio de Netkit (comprimido) listo para ser iniciado en una instalación de Netkit.

![](./images/topologia-ruteo.png){ width=100% }

### Notas para ayudantes

A partir de la explicación de Tomás:

La clase de Ruteo se divide usualmente en tres partes:

  - Presentación básica de Netkit y explicación de cómo se arma un laboratorio (eso lleva un rato);
  - Explicación de ruteo dinámico con RIP y OSPF utilizando zebra/quagga;
  - Utilización de un laboratorio básico.

Para el laboratorio utilizamos las [slides oficiales de Netkit](http://wiki.netkit.org/netkit-labs/netkit-labs_basic-topics/netkit-lab_rip/netkit-lab_rip.pdf). En ese caso se levanto por proyector el [labo oficial](http://wiki.netkit.org/netkit-labs/netkit-labs_basic-topics/netkit-lab_rip/netkit-lab_rip.tar.gz) y se siguieron las cosas de la slide al pie de la letra.

Sin embargo, por los cambios en nuestro "netkit" ese laboratorio tal como está no funciona por temas de rutas a binarios, directorios que no están creados y permisos. Creo que se usó el que está [colgado de la web de TyR](http://www.labredes.unlu.edu.ar/sites/www.labredes.unlu.edu.ar/files/site/data/tyr/netkit-lab_rip-TYR.tar.gz) que es idéntico al de las slides en cuanto a topo logia y configuración (por ahí cambia algún directorio).

Más abajo en "Punteo clase demostrativa" se explica punto por punto esta parte.

Una vez finalizado eso, se les entrega este práctico (armado por Tomás para 2018, con OK de Gabriel). Cito las palabras de Tomás:
​
> Ese ejercicio es inventado por mi 100% (basado en alguno viejo de TyR). Si detectan errores o alguna mejora siéntanse libres agregarlas.

> La idea era que armen el laboratorio de Netkit desde cero, y ese era el entregable. El ejercicio no fue obligatorio el año pasado (2017) y nadie lo entregó. Desconozco la obligatoriedad del mismo para 2018.

> La clase así parece corta, pero tenía al principio la explicación de cómo se arma un labo de Netkit, que según entiendo, ya lo vieron al principio de la cursada esta vez. Igual el labo les va a llevar un rato asi que para el resto de la clase les alcanza. (Yo cuando lo redacté, lo armé y me llevo un rato armar los archivos y eso)

### Punteo clase demostrativa

 - Recordar algoritmos base de ruteo dinámico: link-state / distance-vector
 - Para la demostración utilizaremos el laboratorio `netkit-lab_rip.pdf`,
   con la topología diagramada en las slides 6-9.
 - Explicar brevemente qué es Zebra/Quagga ?
 - Dar daemons ya configurados.
 - Demostración:
   - Iniciar el laboratorio.
   - Mostrar tabla de rutas de kernel con `route -n` o `ip route show`
   - Reproducir `ping` a rutas directas (debería funcionar / slide 11).
   - Reproducir `ping` a rutas indirectas (debería fallar / slide 12).
     Consultar a estudiantes acerca de por qué falla.
   - Hablar sobre la configuración de RIP.  
     Copiar la slide 4 de `netkit-lab_rip.pdf (ripd.conf)`
     - `redistribute connected` informa las rutas aprendidas por RIP y
       además las rutas a las cuales está conectado directamente (aunque
       en tales enlaces/interfaces no se intercambie RIP).
     - `network net_addr/mask` se usa para definir en qué redes/interfaces
       el router anuncia mediante protocolo RIP.
   - Iniciar demonios de ruteo en `r1, r2, r3, r4` con
     `service quagga start` o similar en c/router.
   - Reproducir `ping` a rutas indirectas (debería funcionar / slide 15).
   - Mostrar tabla de rutas de kernel con `route -n` o `ip route show`
     (slide 16).
   - Opcionalmente: pedir a estudiantes cual sería la tabla de rutas una
     vez arribado el estado consistente.
   - Capturar mediante `tcpdump -i any -v -n -s 1518`
     (`tshark` no funciona pues requiere >32 MB RAM).
   - Mostrar mensaje RIP: longitud, protocolo de transporte, entradas de la
     tabla intercambiada (slide 18).
   - Mostrar tabla de rutas RIP conectándose al demonio ripd y ejecutando
     `show ip rip` (slide 20). Recordar que:
     - La clave por defecto es `zebra`, `quagga`, o bien `root`
     - R> significa ruta aprendida por RIP, mientras que
     - C> significa ruta conectada directa
     - en los valores del tipo `[120/3]` se interpreta `120` como distancia
       administrativa de la ruta y `3` como métrica en saltos (hops); para
       OSPF, la distancia administrativa es otra que indica mayor prioridad.
     - Tiempo de vida de las entradas: 3 minutos, decreciendo.

   - Repaso sobre tablas de rutas:
     - Consultar a los estudiantes si un `ping` de r2 a r5 funciona (no lo hará).
     - En r2, hacer `ping` a r5 (opc indicar IP origen con `ping -I origen destino`).
       Validar que no hay respuesta.
     - Consultar a qué se debe? (no indicar nada aún)
     - En r5, hacer captura con `tcpdump -v`. Deben verse los ICMP Echo Request,
       pero ninguna respuesta.
     - Sucede que r5 no tiene ruta hacia r2. Recibe los requests, pero al
       intentar responderlos, no tiene ruta hacia la/las redes de r2.
     - Establecer en r5 una ruta estática hasta la red origen del ping de r2 y
       validar que ahora sí llegan los pings.

   - Consultar a estudiantes sobre qué falta para dar conectividad hacia
     Internet.
     - Agregar ruta por defecto, estática, en `r4` mediante
       `route add default gw IP-R5` (slide 22).
     - Publicar la ruta por defecto en RIP agregando `route 0.0.0.0/0`
       en la configuración de quagga (en línea o por archivo de conf) 
       (slides 24-26).
   - Opcionalmente, capturar en `r1` y dar de baja un enlace mediante
     `ifdown ethN` o `ip link ethN set down` (slides 29-32).

 - En algún momento: Hablar sobre la configuración interactiva de quagga
   (simil CISCO).
   Tomar como base la slide 16 de `lab_quagga.pdf`, donde se representa la
   diferencia entre interfaz de usuario sin privilegios, interfaz de 
   usuario con privilegios, e interfaz de configuración.

 - Mostrar comando `show interface ethN` ?
 - Mostrar comando `show ip route` ? ver si esto funciona con RIP y si,
   en tal caso, muestra las rutas aprendidas, para evitar utilizar
   `show ip rip`


#### Práctica

 - La práctica constituye en brindar un laboratorio similar a los ejercicios de
   exámenes parciales previos: red administrativa, de producción, servidores
   (DMZ), gerencia, con al menos 3 routers, de los cuales uno es del ISP (no
   utilizará RIP). En el enunciado, solicitar la configuración de todos los
   routers internos a la organización (obligatorio dinámico), y la
   configuración estática de los hosts clientes y servidores.
     - Esta práctica ya fue armada por Tomás y es la incluida más arriba en este TP.

#### --- Fin notas para ayudantes ---
