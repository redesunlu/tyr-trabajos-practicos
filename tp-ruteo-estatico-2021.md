TP - Ruteo estático y dinámico con RIP
===========================

**Fecha de Entrega Comisión 6 (Luján): 23/06/2021 - Comisión 35 (Chivilcoy): 25/06/2021**

**URL de Entrega:** <https://tinyurl.com/TyR-2021-TP6>

#### Notas para ayudantes

Algunas mejoras claras que hay que hacerle a este TP en ediciones posteriores:
* Cambiar Administración y Gerencia, para que se obligue a jugar con R4. Como
esta actualmente les alcanza con no poner default a R3 y listo. Si en cambio
Administración esta en la topología de Gerencia, R4 si tiene que tener Default,
y eso empuja a que aclaren que el que no tiene default es el disp de usuario.
* Un bloque mas pequeño para que al subdividir no alcance para todas las redes.
Esto obligaria a usar al menos un bloque de privadas (y NAT o Proxy tal vez).
* Toda la parte del ISP esta mal: Bloque de Red no machea con IPs. IP de ISP
en dibujo no es igual que en el enunciado.
* Buscar la manera de "obligarlos" a pensar la red de interconexión R3<->R4
porque sino asignan un bloque gigante de redes (llegue a ver /27 asignados ahi).

#### --- Fin notas para ayudantes ---

### Actividad 1

**Objetivo:** Entender el funcionamiento de redes IP que basan sus estrategias de direccionamiento de paquetes a través del mecanismo de ruteo estático, mediante la configuración de un escenario hipotético.

#### Introducción:
Una organización posee una red que interconecta a su Casa Central con una sucursal y con un ISP que provee acceso a Internet (como se indica en la Figura 1) . Los routers son administrados por la misma organización y están comunicados entre sí a través de la red `200.44.0.112/28`.

La organización posee asignado todo el bloque de direcciones `200.14.32.0` con máscara `255.255.255.0`, que debe asignar para el resto de las redes según el criterio que usted considere adecuado. El ISP provee como punto de salida hacia Internet un router propio cuya interfaz tiene asignada la dirección IP `190.55.115.220`, asignándole a usted para dicho enlace la IP `190.55.115.119/29`. La Figura 1 representa gráficamente la topología de la red de la organización.

Con esta información usted debe especificar la configuración que permita que la Casa Central se comunique con la Sucursal y permita comunicar completamente todas sus redes internas. Luego, se permita acceso a Internet a la Gerencia, los Servidores (los cuales prestan servicios al exterior) y a la Sucursal. La Administración no debe poder cursar paquetes hacia Internet.

#### Consignas

1. Poner nombre a las interfaces de cada host y routers.
2. Asignar direcciones de las redes en cada enlace.
3. Asignar las direcciones IP a las interfaces de todos los routers y de un host de cada red.
4. Definir las tablas de rutas de los ruteadores R1, R2, R3 y R4 para que respondan a los requisitos previamente mencionados.
5. Indicar cualquier otra configuración y/o suposición realizadas (o restricciones impuestas). Justificar.
![Topología de la red de la organización](./images/ejercicio-ruteo-estatico.png){ width=90% }

### Actividad 2

**Objetivo:** Entender el funcionamiento de redes IP que basan sus estrategias de direccionamiento de paquetes a través de un mecanismo de ruteo dinámico realizado en este caso por el protocolo RIP, mediante el descubrimiento del funcionamiento del protocolo partiendo de una captura de tráfico.

#### Consignas
 - Descargue la captura de la siguiente URL: <http://www.labredes.unlu.edu.ar/files/site/data/tyr/captura-ripv2.pcap>
 - Realice un diagrama de secuencia, generado de manera no automatizada, donde muestre el intercambio de mensajes del protocolo de ruteo entre los routers y se identifique la información de rutas aprendidas en cada paso.


#### Bibliografía

- Fall, K. R., & Stevens, W. R. (2011). TCP/IP illustrated, volume 1: The protocols. addison-Wesley. Capítulo 5.
- Kurose, J. F., & (2013). Computer networking: A top-down approach. Pearson. Capítulo 4.
- Peterson, Larry L. & Davie, Bruce S. Computer networks : a systems approach. 5th ed. 2012. Capítulo 3.
