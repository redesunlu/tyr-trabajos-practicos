# TP - Transmisión de Datos

**Bibliografía sugerida:** [STA] Capítulos 3, 5 y 6.

#### Notas para ayudantes

Hoja de formulas

Nyquist:
	- C = 2 * B ∗ log_{2}(M)
Shannon:
	- C = B * log_{2}(SNR + 1)
	- SNR_{db} = 10 * log_{10}(SNR)

Donde:
 - C: Tasa de transferencia (bits por segundo o bps)
 - B: Ancho de banda del canal (hertz o hz)
 - M: Niveles de tensión (Es una cantidad)
 - SNR: Relación señal ruido (Adimensional)
 - SNR_{db}: Relación señal ruido (Decibeles o db)

 - SNR Despejado => SNR = 10 ^ (SNR_{db} / 10)
 - M Despejado => M = 2 ^ (C / (2 * B))

#### -- Fin notas para ayudantes ---

### 1) ¿Cuántos niveles de tensión se requieren como mínimo para transmitir a una tasa de 48 Mbps sobre un canal de 8 Mhz de ancho de banda?

#### Notas para ayudantes

B = 8 Mhz
C = 48 Mbps

Por Nyquist

48 Mbps = 2 * 8 Mhz ∗ log_{2}(M)
M = 8

Se requieren al menos 8 niveles de tensión para transmitir a la tasa especificada.

#### -- Fin notas para ayudantes ---

### 2) Se tiene un canal de 10.200 Hz y una SNR = 20dB, con un sistema que puede codificar utilizando 16 niveles de tensión. ¿Cuál es la capacidad máxima del canal?

#### Notas para ayudantes

Utilizar tanto Nyquist como Shannon. El resultado correcto es el menor de ambos

Por Nyquist:

C = 2 ∗ 10200 ∗ log_{2}(16) = 81,6 Kbps

Shannon:

20dB = 10 * log_{10}(SNR) => SNR = 100
C = 10200 * log_{2}(100+1) => C = 67,9 Kbps

Rta: La capacidad teórica máxima es de 67,9 Kbps

#### -- Fin notas para ayudantes ---

### 3) Se requiere implementar un enlace de 16 Mbps utilizando un ancho de banda de 1 Mhz. Con el medio utilizado, la SNR es de 24 dB. ¿Se puede implementar el proyecto? De no ser posible ¿Cómo se puede resolver el problema?

#### Notas para ayudantes

Por Shannon:

SNR_{db} = 24 dB
C_{req} = 16 Mbps
B = 1 Mhz

24 = 10 * log_{10}(SNR)
SNR = 251

C = B * log_{2}(SNR + 1)
C = 1 Mhz * log_{2}(251+1)
C_{real} = 7,977 Mbps

C_{real} < C_{req}

Rta: El proyecto NO se puede realizar. El problema se puede resolver cambiando el medio por uno que permita aumentar la SNR. Para saber cual deberia ser la SNR minima necesaria del medio, se puede obtenr asi:

16 Mbps = 1 Mhz * log_{2}(1+SNR)
SNR = 65535

SNR_{db} = 10 * log_{10}(65535) = 48,16 dB

Se requiere que el medio tenga una SNR_{db} de al menos 48.16.

#### -- Fin notas para ayudantes ---

### 4) Se cuenta con un canal de TV de 40 MHz de ancho de banda. ¿Qué tasa se puede alcanzar si se utiliza una señal de 4 niveles y el canal no tiene ruido. Si el canal tiene ruido: ¿Qué SNR es aceptable para obtener las mismas prestaciones?

#### Notas para ayudantes

Nyquist:
C = 2 * B ∗ log_{2}(M)
C = 160 Mbps

Rta: La tasa alcanzable es de 160 Mbps

Shannon:

C = B * log_{2}(SNR + 1)
SNR = 15

SNR_{db} = 10 * log_{10}(15)
SNR_{db} = 11,76 dB

Rta: La SNR mínima para obtener idénticas prestaciones debe ser de 11,76 dB

#### -- Fin notas para ayudantes ---

### 5) Se define como eficiencia espectral (EE) al cociente [Tasa de transferencia (bps) / Ancho de banda (Hz)] el cual representa una medida de aprovechamiento de una banda de frecuencia para transmitir datos. Suponga que necesita implementar un sistema que alcance una EE ≥ 2.5.

	a) Cuál es el número de niveles que se deben emplear para lograr el objetivo?
	b) Cuál es la EE a partir de la que se requieren más de 2 niveles?

#### Notas para ayudantes

a)

C = 2 * B ∗ log_{2}(M)
C / (2 * B) = log_{2}(M)
EE / 2 = log_{2}(M)
2 ^ (EE / 2) = M
2,378 = M

Rta: Se requieren a partir de 3 niveles para lograr la EE requerida.

b)

EE = 2 *  log_{2}(M)
EE = 2 *  log_{2}(2)
EE = 2

Para una EE > 2 se requieren mas de 2 niveles de codificación.

#### -- Fin notas para ayudantes ---

### 6) Suponga que usted tiene que enviar datos masivos entre dos ciudades cercanas. Una opción es alquilar un enlace de fibra óptica que provee una compañía de transporte de datos cuya tasa de transferencia es de 150 Mbps. La otra opción es llamar a un "delivery" quien puede transportar 2 memorias USB de 24 GB cada una a una velocidad de 30 km/h debido al tráfico. Para qué rango de distancia el servicio de delivery posee una tasa de datos mayor que el enlace de fibra (este ejercicio es una adaptación de [TAN]).

#### Notas para ayudantes

TODO: Encarar

#### -- Fin notas para ayudantes ---

### 7) El estándar para redes inalámbricas 802.11 ofrece una tasa de transferencia teórica de 300 Mbps sobre una canal cuyo ancho de banda es de 40 Mhz. Cuál es la relación señal/ruido máxima aceptable para soportar esta configuración? (Exprese su SNR en dB).

#### Notas para ayudantes

C = 300 Mbps
B = 40 Mhz

C = B * log_{2}(SNR + 1)
300 Mbps = 40 Mhz * log_{2}(SNR + 1)
2 ^ (300 Mbps / 40 Mhz) - 1 = SNR
SNR = 180.019

SNR_{db} = 10 * log_{10}(180.019) = 22,55 dB

Se requiere al menos un SNR_{db} de 22,55 dB para soportar la configuración planteada.

TODO: ESTA MAL REDACTADO EL EJERCICIO?

#### -- Fin notas para ayudantes ---

### 8) Se cuenta con una fibra óptica cuyo ancho de banda es de 2 Ghz y un sistema de codificación que usa 512 niveles de señal. La señal posee una potencia de 405 unidades mientras que el ruido alcanza solo 27 unidades. Calcule la capacidad teórica del canal de comunicaciones. Justifique su respuesta.

#### Notas para ayudantes

SNR = Señal / Ruido = 405 / 27 = 15 db

Nyquist:

C = 2 * B ∗ log_{2}(M)
C = 2 * 2 Ghz * log_{2}(512) = 36 Gbps

Shannon:
C = B * log_{2}(SNR + 1)

SNR_{db} = 10 * log_{10}(SNR)
SNR = 10 ^ (15 / 10) = 31,62

C = 2 Ghz * log_{2}(31,62 + 1)
C = 2 Ghz * 5.027 = 10,05 Gbps

La capacidad teórica del canal es de 10,05 Gbps

#### -- Fin notas para ayudantes ---

### 9) Suponga que se requiere que un sistema de comunicaciones opere a 100 Mbps utilizando un ancho de banda de 70 Mhz. ¿Cuál es la cota inferior de la relación señal/ruido para que el sistema funcione?

#### Notas para ayudantes

C = 100 Mbps
B = 70 Mhz

C = B * log_{2}(SNR + 1)
2 ^ (100 Mbps / 70 Mhz) - 1 = SNR
SNR = 1,69

SNR_{db} = 10 * log_{10}(SNR)
SNR_{db} = 10 * 0,23 = 2,3 db

La cota inferior debe ser de 2,3 db.

#### -- Fin notas para ayudantes ---

