# Apunte de comandos para TyR

Compendio de comandos necesarios para abordar las practicas de laboratorio
de la asignatura Teleinformatica y Redes (10040).

## Obtener acceso root

```
$ su -
Contraseña: *****
# <comando como root>
```

## Comando `ip`
Comando general para manipulación y consulta de parametros de red, interfaces, etc...

```
# ip <module> [<parametros>]
$ man ip
$ man ip-<module>
```

### Comando `ip link`

Configura y Muestra información sobre interfaces de red.
```
$ ip link show
$ ip link show INTERFAZ
$ man ip-link
```

Activar interfaces disponibles:
```
# ip link set group default up # Todas las interfaces
# ip link set dev INTERFAZ up # La interfaz de nombre INTERFAZ
```

### Comando `ip address`
Administra y muestra los parametros de red

```
# ip addr add dev INTERFAZ DIRECCIÓN_IP/PREFIJO_MÁSCARA
$ ip addr show
$ man ip-address
```

### Comando `ip route`
Administra y muestra la tabla de rutas

```
$ ip route show
# ip route add DIRECCION_RED/PREFIJO_MASCARA via IP_GATEWAY dev INTERFAZ
# ip route add default via DEFAULT_GATEWAY
```

## Comando `ping`
Herramienta de diagnostico de red. Permite verificar si la configuración de red
(hasta capa 3) funciona adecuadamente.
```
$ ping DIRECCIÓN_IP
$ man ping
```

## Comando `hostname`
Permite consultar y editar el nombre del host
```
$ hostname
# hostname NOMBRE_EQUIPO
```
(Esta edicion es efimera, al reiniciar el equipo se pierde)

## Comando `tcpdump`
Permite crear capturas de red y volcarlas a un archivo para su posterior
analisis.

Ejemplo de captura:
```
# tcpdump -n -p -w NOMBRE_ARCHIVO.PCAP 'icmp && host DIRECCION_IP'
$ man tcpdump
```
El comando anterior captura todo el trafico de protocolo ICMP dirigido a la IP
DIRECCION_IP.

## Archivos relevantes del sistema
En todos los casos puede utilizar el editor `nano` para editar los archivos.

- `/etc/hostname` permite modificar el nombre del host.

- `/etc/hosts` permite la gestión manual de la resolución de nombres.

## Generales

### Documentacion de un comando
```
$ man comando
```
### Prompt
Son los primeros caracteres a la izquierda de la terminal:
```
usuario@host:~$
```
Indican que la consola esta lista para recibir comandos. En caso de
administrador (root) se ve asi:
```
root@host:~#
```
Habitualmente se usan los caracteres `$` y `#` para indicar si un comando debe
ejecutarse como usuario normal (sin privilegios) o como administrador (root),
respectivamente.
