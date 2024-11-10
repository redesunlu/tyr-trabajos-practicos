# DHCP

Tener acceso completo desde un dispositivo a los servicios de una red requiere la configuración de diversos parámetros de la misma, a saber:

* Dirección IP (que debe ser univoca)
* Mascara
* Default Gateway
* Nombres locales
* DNS

En despliegues donde se cuenta con un profesional que construye la infraestructura física y lógica de la red, es posible manejar toda esta información de forma manual. Sin embargo, las necesidades emergentes de las organizaciones han llevado a que el enfoque manual no responda de forma flexible a la demanda de conexión.

Pongase ahora el caso de un proveedor de servicios, donde si bien en un momento inicial envía un técnico al domicilio del cliente a configurar la instalación, posteriormente nuevos usuarios llegan al domicilio y desean acceder a la red (p.e. a través de un enlace wireless provisto por el router instalado).

Resulta claro que una asignación manual es poco practica, incluso ofreciendo los servicios. Resulta deseable que exista un mecanismo para que los parámetros de red puedan ser negociados de forma automática por los dispositivos.

Esta función es cumplida por el protocolo DHCP (Dynamic Host Configuration Protocol). 

## Introducción

DHCP (RFC 2131) es un protocolo de capa aplicación cliente / servidor, donde el objetivo del cliente es solicitar al servidor DHCP un conjunto de parámetros para autoconfigurar la red, tales como IP, mascara, default gateway IP y servidor DNS. Una versión equivalente para IPv6 existe (RFC 3315) y el objetivo es idéntico, aun cuando IPv6 tiene un mecanismo propio de autoconfiguración. Pero DHCP original fue concebido para ser usado con IPv4.

A nivel transporte se utiliza [UDP](apuntes-udp), y el cliente utiliza el puerto 68 mientras que el servidor hace lo propio con el 67. DHCP surge de un protocolo anterior y mas limitado llamado BOOTP o Internet Bootstrap Protocol. La principal novedad es el *lease* (arrendamiento), que permite a los dispositivos que la asignación de la IP y el resto de los parámetros sea limitado temporalmente.

DHCP comprende 2 partes principales:

* Gestión de direcciones: Permite asignación dinámica de direcciones y provee el lease a los clientes
* Entrega de configuración: Tipo de mensajes y la gestión de los estados.

Un servidor DHCP maneja 3 tipos de asignación:

* Estática: Un cliente solicita al servidor pero la IP que se asigna es siempre la misma y fija (al igual que en BOOTP).
* Automática: Un cliente solicita la configuración y se le asigna una dirección de un rango o *pool* disponible en el servidor. La asignación no puede ser revocada.
* Dinámica: Idéntico a automática, pero la asignación de la IP puede revocarse.

## Funcionamiento

El servidor DHCP suele ser configurado con un conjunto de direcciones o *pool* exclusivas para el uso por dicho server. Típicamente un cliente realiza una petición de dirección IP al server DHCP, el cual asigna una IP disponible dentro del *pool*, y esta asignación es por un periodo de tiempo, llamado *lease duration*. Dentro del protocolo existe el mecanismo para solicitar extensión de este tiempo antes de que finalice, y en condiciones normales y de disponibilidad, el servidor renueva el tiempo. Esta duración es configurable y dependen del uso de la red el valor óptimo.

En ocasiones, al realizar la petición el cliente puede brindar información al servidor, por ejemplo, un nombre, una duración de la asignación, la dirección usada por ultima vez o en uso. El servidor puede utilizar esta información proporcionada o incluso otra (por ejemplo la MAC del cliente) o incluso información externa (hora, interfaz por donde se recibió) para realizar la asignación. Esta asignación se almacena en memoria permanente, de manera que si el servidor se reinicia, las duraciones se mantienen inalterables.

### PDU de DHCP

DHCP y BOOTP son compatibles en cuanto al formato del mensaje. Los campos son:

Op: identifica el mensaje (request - 1 o reply 2).

HW type: Tipo de dirección en capa 2. 1 referencia a Ethernet.

HW len: cantidad de bytes de la dirección de capa 2. vale 6 para ethernet.

Hops: Numero que inicia en 0 en indica la cantidad de relays que atraviesa el mensaje. Cada relay suma uno en este campo.

Transaction ID: Un id random para identificar la respuesta de una petición especifica.

Secs: Cantidad de segundos transcurridos desde el primer intento de pedir o renovar una dirección.

Flags: 1 byte en uso, el flag de broadcast, que indica que el cliente no puede o no desea procesar (por ejemplo, el cliente no tiene una IP asignada). En consecuencia el servidor debería enviar la respuesta por broadcast.

Client IP address (ciaddr): la IP del dispositivo solicitante, si tiene, 0 en otro caso.

Your IP address (yiaddr): IP asignada por el servidor.

Next Server IP Address (siaddr): Siguiente servidor que seguirá procesando los mensajes de inicio del cliente (usado en la instalación de sistemas operativos en red por ejemplo).

Gateway IP Address (giaddr): Del gateway que reenvia el mensaje.

Client Hardware Addres (chaddr): Direccion de Capa 2 del dispositivo, usada por el server de diversas maneras (p.e. re asginar la misma IP al cliente en diferentes peticiones)

Server Name (sname) o Boot File Name (file): campos que indican nombre del servidor o path al archivo de boot. Son opcionales y a veces también se usan como extensión del campo de opciones.

Options: Campo de opciones utilizado principalmente por DHCP. Todo campo no disponible en BOOTP y necesario para DHCP fue asignado a esta área. Existen muchas opciones, pero algunas típicas son:

Subnet Mask (1), Router Address (3), Domain Name Server (6), Domain Name (15), Requested IP Address
(50), Address Lease Time (51), DHCP Message Type (53), Server Identifier (54), Parameter Request List (55), DHCP Error Message (56), Lease Renewal Time (58), Client Identifier (61), Domain Search List (119).

La opcion 53 hace referencia al tipo de mensaje DHCP, entre los que se destacan:

DHCPDISCOVER (1), DHCPOFFER (2), DHCPREQUEST (3), DHCPDECLINE (4), DHCPACK (5), DHCPNAK (6), DHCPRELEASE (7), DHCPINFORM (8), DHCPFORCERENEW (9) [RFC3203], DHCPLEASEQUERY (10), DHCPLEASEUNASSIGNED (11), DHCPLEASEUNKNOWN (12), and DHCPLEASEACTIVE (13).

![PDU del protocolo DHCP y BOOTP](./images/dhcp-pdu.jpg)

### DHCP Modo de Operación

Mensajes DHCP son mensajes BOOTP con opciones. El proceso comienza cuando el cliente se agrega a una red. El primer paso es iniciar un proceso de descubrimiento de servidores DHCP disponibles. Los servidores disponibles responden al mensaje de descubrimiento con un ofrecimiento. El cliente acepta uno de todos, y realiza la petición.

![Modo de operación de DHCP en discover](./images/dhcp-discover-and-request.png)

DHCPDISCOVER: Mensaje con Op BOOTREQUEST. Dirección IP 0.0.0.0 (puerto 68), al broadcast 255.255.255.255 (puerto 67) desde cliente al server. En el sentido contrario, server a cliente responde con IP de el (puerto 67) y al broadcast y puerto 68.

DHCPOFFER: Setea en yiaddr la IP ofrecida, ademas de mascara y DNS (típicamente). Ademas el *lease time (T)*, y existen otros tiempos como renewal time (cantidad de tiempo para empezar a renovar el lease time - T/2), o rebinding time, tiempo para empezar a renovar la asignación de IP (7T/8). También envía la opción identificador del servidor.

DHCPREQUEST: Creado por el cliente, es enviado al broadcast pero incluyendo el server identifier option recibido en el DHCPOFFER. De esta manera, todos los servers DHCP reciben el mensaje pero solo lo procesa el servidor elegido.

DHCPACK: Respuesta del server, indicando al cliente que puede asignarse la IP.

DHCPNAK: Respuesta del server, indicando al cliente que NO puede asignarse la IP.

Si el cliente detecta que la IP esta en uso (checkea usando ARP, p.e.), envía un mensaje DHCPDECLINE.

Si un cliente desea renunciar a la IP antes de que termine el *lease time* utiliza el mensaje DHCPRELEASE.

Cuando un cliente desea renovar el *lease time*, realiza directamente un mensaje DHCPREQUEST.

DHCPINFORM es usado para cuando el cliente no necesita renovar pero si otro tipo de información desde el servidor.

### Comandos

En linux, para iniciar el proceso de asignación de IP se hace vía 

```bash
dhclient # Solicitar IP o renovación
dhclient -r # Liberar la asignación
```

## IPv6

El modo stateless de IPv6 permite autoconfiguración de la dirección. Sin embargo, DHCPv6 es necesario, por ejemplo, para obtener la dirección del DNS.

## DHCP Relay

![DHCP Relay Agent](./images/dhcp-relay-agent.png)

El mecanismo no es transparente a los mensajes DHCP, sino que el relay agrega/modifica un conjunto de opciones amplio. La idea es que un DHCP server centralizado pueda ser desplegado en un contexto donde la solicitud de asignaciones se haga desde diferentes segmentos de red.

## Autenticación

Las primeras versiones de DHCP no proveían seguridad, de manera que clientes no deseados podían solicitar acceso. Existen opciones especificas de autenticación agregadas en actualizaciones posteriores (RFC3118). Sin embargo, no son características utilizadas.