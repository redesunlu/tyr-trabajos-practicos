# Control del Enlace

## Puntos claves

* Capa 2 del modelo OSI y TCP / IP
* Capa 1 resuelve transmision de datos y sincronización. Sin embargo eso no alcanza para comunicar de forma "fiable". Errores y Congestión del receptor. 
* Crear la ilusión de un enlace confiable, o fiable, entre adyacentes es el objetivo de la capa 2.
* Es un conjunto de procedimientos para gestionar y controlar el intercambio entre dispositivos adyacentes.
* 2 objetivos primarios: Control de flujo y control de enlace.

## Introducción

Es la capa 2 del modelo OSI:

![Control del Enlace en el Modelo OSI](images/link-control.png)



Para enviar datos sobre un medio, existen muchos factores a considerar ademas de los considerados en la Capa 1 (sincronizacion de dispositivos, conversion de datos en señales). A todas esas actividades y mecanismos que permiten que la comunicación se realice de forma confiable se los engloba en la capa de control del enlace. Cuando un protocolo de control de enlace se utiliza entre dispositivos, el medio se denomina "enlace de datos".

Entre estos requerimientos / objetivos se pueden mencionar:

* Sincronización de tramas: Division de los datos a ser enviados en "bloques" conocidos como frame o tramas, cuyo principio y final deben distinguidos. 
* Control de Flujo: La estación que envia datos no debe hacerlo a una velocidad mayor de la que la estación receptora pueda recibirlos.
* Control de errores: Corrección de errores introducidos por el sistema de transmisión.
* Direccionamiento: En un medio compartido, p.e. LAN, las estaciones deben poder identificarse y especificarse.
* Datos y control en el mismo enlace: Tener un enlace unico para control y datos, y que el receptor pueda distinguir uno de otro.
* Gestion del enlace: Procedmientos generales para el inicio, mantenimiento y finalizacion del intercambio de datos pueden ser necesarios o requeridos para la comunicación entre los dispositivos.

## Contexto

Medios: Imperfectos (ruido, atenuacion); capacidad finita (ancho de banda); Retardo de propagacion (distancia). -> Posibilidad de errores.

Emisor/Receptor: Tiempos de procesamiento; Tamaño de buffers. -> Control de Flujo.

## Escenarios

* Se transmiten frames: Control + Información
* 

### Escenario 1: Condiciones

Transmisión unidireccional

Transmisor y receptor siempre disponibles

Canal de comunicaciones libre de errores

Tiempo de proceso despreciable

### Escenario 2: Condiciones

Transmisión unidireccional

Transmisor y receptor siempre disponibles

Canal de comunicaciones libre de errores

Tiempo de proceso **NO** despreciable

### Escenario 3: Condiciones

Transmisión unidireccional **de datos**

Transmisor y receptor siempre disponibles

Canal de comunicaciones **con posibilidad** de errores

Tiempo de proceso no despreciable

### Escenario 4: Condiciones

Transmisión **bidireccional** de datos

Transmisor y receptor siempre disponibles

Canal de comunicaciones con posibilidad de errores

Tiempo de proceso no despreciable



## Control de Flujo

Procedimientos y tecnicas para que el emisor no sobrecargue al receptor de datos.

El receptor tiene buffers para mantener la información recibida durante el procesamiento de la misma, antes de pasarla a capas superiores. Estos buffers pueden llenarse si se reciben datos a una tasa mayor de la velocidad de procesamiento.



## Bibliografía

\[STA,2007\]: Stallings, William. *Data and computer communications*. Pearson Education India, 2007. 8va Edición.