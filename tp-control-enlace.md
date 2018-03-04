# TP - Control del Enlace de Datos

**Bibliografía sugerida:** [STA] Capítulos 7.

#### Notas para ayudantes

Hoja de formulas


#### -- Fin notas para ayudantes ---

### 1) ¿Cuál es el producto retardo x ancho de banda de un enlace de 256 Kbps y RTT = 30 ms? ¿Cómo se modifica si el RTT sube a 500 ms? ¿Cómo afecta al rendimiento de los protocolos?

#### Notas para ayudantes

Tasa = 256 Kbps
RTT = 30 ms = 0,03 s

B = Tasa * RTT/2 = 256 Kbps * 0,03 s / 2 = 3,84 Kb

RTA 1: El producto es 3,84 Kb

si RTT = 500 ms = 0,5 s

B = 256 Kbps * 0,5 s / 2 = 64 Kb

RTA 2: Crece a 64Kb

RTA 3: El retardo de transmisión puede afectar la utilizacion del enlace para protocolos con tramas pequeñas y distancias muy largas, donde se infrautilice el enlace. El aumento de retardo genera que para mantener el enlace "lleno" de bits, deben transmitirse mayor cantidad de datos.

#### -- Fin notas para ayudantes ---

### 2) Suponga que se requiere transmitir información desde un satélite de comunicaciones hasta una base en la luna (distancia 4 x 10 ^ 5 km). Para ello se tiene un canal de 1024 Kbps. Calcule el RTT del enlace y el producto retardo x ancho de banda. Y si quisiera transmitir desde una estación terrestre: ¿Qué valores toman tales parámetros? ¿Qué utilización se obtendrían con un protocolo S&W y uno con SW (con W = 128)?

#### Notas para ayudantes

d = 4 x 10 ^ 5 km
V = 300.000 Km / s
RTT = 2 * T_{propag}
T_{propag} = distancia / Velocidad

RTT = T_{propag} * 2 = (d / V) * 2 = (4 x 10 ^ 5 km / 300.000 Km / s) * 2 = 1,33 s * 2 = 2,66 seg

B = T_{propag} * BW = 1,33 seg * 1024 Kbps = 1361,92 Kb

Desde estacion terrestre

d = 36.000 km
RTT = T_{propag} * 2 = (d / V) * 2 = (36.000 km / 300.000 Km / s) * 2 = 0,24 seg
B = 0,12 seg * 1024 Kbps = 122,88 Kb

Analisis de Utilizacion

L = 8000 bits (No esta en el enunciado)
a = T_{propagacion} / T_{trama}
T_{propagacion} = distancia / Velocidad
T_{trama} = L / Tasa

CASO 1: Satelite a Luna

T_{trama} = 8000 bits / 1024 Kbps = 0,008 seg
T_{propagacion} = 1,33 seg
a = 1,33 seg / 0,008 seg = 166,25

S&W:

U = 1 / (1 + 2 * a) = 1 / (1 + 2 * 166,25) = 0,003

W:

W=128

w < 1 + 2 * a:

U = w / (1 + 2 * a) = 128 / (1 + 2 * 166,25) = 0,38

CASO 2: Satelite a base en tierra

T_{trama} = 8000 bits / 1024 Kbps = 0,008 seg
T_{propag} = 36.000 km / 300.000 Km / s = 0,12 seg
a = 0,12 seg / 0,008 seg = 15

S&W:

U = 1 / (1 + 2 * a) = 1 / (1 + 2 * 15) = 0,03

W:

W=128

w > 1 + 2 * a:

U = 1

#### -- Fin notas para ayudantes ---

### 3) Un enlace de 50km de longitud y un ancho de banda de 1 Mbps se gestiona utilizando un protocolo con control de flujo por S&W. Calcule el tamaño de trama necesario para obtener la mayor eficiencia si el retardo es de 50 ms.

#### Notas para ayudantes



#### -- Fin notas para ayudantes ---

### 4) Calcular el throughput para un enlace que utiliza un protocolo de ventana deslizante cuyo tamaño de trama es de 100 bytes y la ventana es 8. La tasa del enlace es de 1.45 Mbps y el RTT =  50 ms. ¿Cuál es el rendimiento (U) del enlace?

#### Notas para ayudantes



#### -- Fin notas para ayudantes ---

### 5) Un canal tiene una velocidad de transmisión de 4 Kbps y un retardo de 20 ms. ¿Para qué rango de tamaños de trama se conseguirá un esquema de parada y espera con una eficiencia (U) mínima del 50%?

#### Notas para ayudantes


#### -- Fin notas para ayudantes ---

### 6) Dos estaciones se comunican a través de un enlace de 1 Mbps con un retardo de propagación de 270 ms. Si se usan tramas HDLC de 1024 bits con números de secuencia de 3 bits ¿Cuál será el rendimiento máximo posible considerando sólo los datos transportados?

#### Notas para ayudantes



#### -- Fin notas para ayudantes ---

### 7) Analizar para qué tamaño de ventana resulta el throughput óptimo si se cuenta con un enlace de 512 Kbps y RTT = 500 ms y el tamaño de trama es de 800 bytes.

#### Notas para ayudantes



#### -- Fin notas para ayudantes ---

### 8) Calcule la utilización de un enlace de fibra óptica de 500 metros cuya tasa de transferencia es de 500 Mbps si se utiliza un protocolo con control de flujo mediante parada y espera cuyas tramas son de 1000 bytes. ¿Cómo se modifica la situación si se utilizan ventanas? ¿Qué tamaño de W brinda la mayor utilización?

#### Notas para ayudantes



#### -- Fin notas para ayudantes ---

### 9) ¿Qué ocurre en el caso anterior si se tiene una probabilidad P=0.2 de error y se utiliza ARQ con: a) S&W y b) retransmisión selectiva?

#### Notas para ayudantes



#### -- Fin notas para ayudantes ---

### 10) ¿Con qué parámetros se puede obtener una utilización superior al 50% para un enlace con tramas de 53 bytes, de 100 Kms y 30 Mbps si la probabilidad de error es P=0.35?

#### Notas para ayudantes



#### -- Fin notas para ayudantes ---
