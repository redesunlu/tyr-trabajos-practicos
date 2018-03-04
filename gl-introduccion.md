# GL - Introducción y Conceptos Básicos

**Bibliografía sugerida:** [STA] Capítulos 1 –  [KUR] Capítulo 1.

**Otros recursos:** http://www.ietf.org/

### 1. ¿Qué es una red y qué es un sistema distribuido? ¿Qué características ofrecen? Mencione alguna que conozca y sus prestaciones.

#### Notas para ayudantes

Una red de computadoras es un conjunto de computadoras autónomas interconectadas, permanentemente o no, que tienen como objetivo compartir recursos. El concepto de autonomía significa que cada nodo de la red (cada maquina conectada a la red) tiene capacidad de procesamiento propia, es decir, memoria y procesador.

Los objetivos básicos de las redes son:

 * Permitir comunicación entre los integrantes.
 * Compartir recursos.

Para sistemas distribuidos podemos encontrar dos definiciones clásicas:

 - Sistema donde los componentes (Hardware y Software), unidos mediante una red, se comunican y coordinan sus acciones solo a través del pasaje de mensajes, dado que no existe bus en común.
 - Según [COLOURIS], un SD es una colección de computadoras autónomas conectadas por una red, y con el Software adecuado para que el sistema sea visto por sus usuarios como una única entidad capaz de proporcionar facilidades de computación.

Características de las redes y de los SD:

 * No hay tiempo global, no existe reloj común
 * No existe memoria global (cada nodo tiene la suya)
 * La comunicación se establece unicamente mediante el envió de mensajes
 * Existe “nombrado” global: El mismo nombre de recurso es valido en todo el sistema
 * Existe disponibilidad global: El sistema sigue funcionando correctamente frente a fallos parciales
 * Hay escalabilidad a bajo costo
 * Tolerancia a fallos
 * La transparencia es un objetivo de diseño

Ejemplos de redes: Red LAN de la UNLu, Internet.

#### --- Fin notas para ayudantes ---

### 2. ¿Por qué los nodos de una red deben ser autónomos? ¿Qué ocurre si no lo son?

#### Notas para ayudantes

Deben ser autonomos debido a que las redes conectan dispositivos que necesitan comunicar datos y deben ser capaces de procesarlos y almacenarlos. En caso de no ser autonomos, no tendrian capacidad de compartir recursos solicitados.

#### --- Fin notas para ayudantes ---


### 3. ¿Qué es un enlace? ¿Qué elementos lo componen? Brinde 3 ejemplos.

#### Notas para ayudantes

Un enlace es un vinculo entre dos dispositivos que necesitan transferir datos. Cada dispositivo debe implementar un conjunto de instrucciones que permitan realizar un control de dicho enlace. Aquellas funciones encargadas de dicha gestion se agrupan en la capa 2 del modelo OSI, llamado identicamente Capa de Enlace.

Los elementos que lo componen:

 - Fuente
 - Transmisor
 - Medio
 - Receptor
 - Destino

Algunos ejemplos serian:

 - 1 PC con modem conectada a un servidor mediante la red publica de telefonía
 - 2 Telefonos conectados mediante la misma red que en el caso anterior
 - 1 Televisor conectado por una antena a la empresa proveedora

#### --- Fin notas para ayudantes ---

### 4. ¿Qué dispositivos (no computadoras) conoce que se conectan a una red? ¿Qué similitudes y diferencias presentan respecto de la conectividad un smartphone o una PC de escritorio?

#### Notas para ayudantes

 - Tablets
 - Smartphone
 - Routers
 - Telefonos con tecnologia para VOIP

El smartphone se conecta mediante protocolos que permiten el acceso inalambrico a la red (ya sea wifi o red de datos de los proveedores de telefonia movil). La computadora de escritorio suele tener interfaz de conectividad por red cableada (tipicamente ethernet).

#### --- Fin notas para ayudantes ---

### 5. ¿Qué es una red de área amplia? ¿Y una LAN? ¿Qué las diferencia? Brinde un ejemplo en cada caso.

#### Notas para ayudantes

WAN: Red que cubre una amplia area geografica y que ademas de incluir rutas de acceso publico requieren solicitar acceso a entidades proveedora de servicios de telecomunicación. Incluye una serie de servicios de conmutacion interconectados. Estos conmutadores tienen como objetivo encaminar los datos hacia destino, y no les interesa la información que contienen (Al menos en terminos tecnicos).

LAN: Es una red que suele pertenecer a una entidad, hogar u organizacion, suele no ser abierta al publico y no permite que otras redes cursen trafico por su interior a menos que sea el destino de los mismos.

Las principales diferencias de LAN y WAN son:

 - Cobertura geografica pequeña (uno o varios edificios cercanos, por ej)
 - Una LAN suele pertenecer a la organización que la utiliza. En la WAN esto no suele ser así.
 - En LAN se poseen velocidades de transmision superiores que en WAN principalmente por el tipo de tecnologia que se utiliza.

#### --- Fin notas para ayudantes ---

### 6. ¿Qué es una red global? ¿Cómo se encuentra organizada? ¿Qué otra además de Internet conoce?

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 7. Describa   los   elementos   que   componen   el   “Modelo para las comunicaciones” presentado.

#### Notas para ayudantes

ETD: Data Terminal Equipment, es el elemento que genera los datos a transmitir o recibe los transmitidos, o sea, es una fuente o destino.

ETCD o DCE: Data Circuit-Terminating Equipment: Convierte los datos en señales para que puedan viajar por el medio o viceversa.

#### --- Fin notas para ayudantes ---

### 8. Describa   los objetivos  que   se   persiguieron   en  la   construcción   del   Modelo   OSI. Explique por qué no se implementa tal como se propone.

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 9. Describa las funciones de cada capa del modelo OSI. Detalle la diferencia de servicios ofrecidos de capa 2 y capa 4. Brinde ejemplos en cada caso.

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 10. ¿Por qué se plantea que para lograr una comunicación ambos extremos deben dialogar utilizando el mismo protocolo? ¿Cómo se realiza el diálogo si se tiene en cuenta que hay varios niveles?

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 11. ¿Qué similitudes y diferencias presentan el modelo OSI y la pila de protocolos TCP/IP?

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 12.  En el modelo OSI, explique la forma por la cual las entidades pares se comunican.

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 13. ¿Qué es un protocolo? ¿Qué es un protocolo de comunicaciones? Brinde un ejemplo en cada caso. ¿Qué define un protocolo de comunicaciones?

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 14. ¿Por qué se plantean arquitecturas de protocolos? ¿Por qué son jerárquicas? ¿Por qué predomina un modelo de capas?

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 15. Describa los tipos de servicio que proveen los protocolos. Ejemplifique en cada caso con un escenario cuyas condiciones requieran necesariamente uno y no otro.

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 16. Brinde un ejemplo concreto de función para cada capa del modelo OSI.

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 17. Defina: SAP, PDU, SDU, ICI, encapsulamiento, fragmentación y reensamblado.

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 18. ¿Cuáles son las primitivas de servicio (según OSI) que deben intercambiarse a los efectos de solicitar una conexión?

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 19. Revise el articulo “How the Internet works: Submarine fiber, brains in jars, and coaxial cables” ¿Qué elementos de comunicaciones se presentan como parte de la infraestructura? ¿Con qué capa/s del modelo OSI se relaciona cada uno?

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 20. Presente gráficamente el encapsulamiento bajo el juego de protocolos TCP/IP. ¿Qué protocolo de enlace se debe utilizar?

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 21. ¿Existen otras arquitecturas de protocolos alternativas a OSI y TCP/IP? Brinde un ejemplo y compárelas capa por capa (si es posible).

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 22. ¿Qué diferencia hay entre el control de flujo y el control de congestión, teniendo en cuenta que ambos solucionan situaciones de saturación?

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 23. En un protocolo de comunicaciones, qué función cumplen las cabeceras. ¿Cómo se podría implementar un protocolo sin éstas?

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 24. ¿Qué son la IETF, la ISOC y la IANA? ¿Qué tareas realizan?

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 25. ¿Qué son los Request for Comment? ¿Cómo se generan y organizan?

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

### 26. Revise el artículo “Brief History of Internet”. Revise en Wikipedia las biografías de cada uno de los autores del mismo e indiqué qué aporte fundamental ha realizado. ¿Qué ideas principales impulsaron el desarrollo de la red? ¿El modelo de desarrollo de la red actual es igual al descripto en el artículo? ¿Por qué?

#### Notas para ayudantes



#### --- Fin notas para ayudantes ---

