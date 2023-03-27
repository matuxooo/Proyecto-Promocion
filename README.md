#  Proyecto Marquesina VGA - Ing. Electrónica 2023

###Integrantes del grupo	
**Ajmat, Juan Ignacio - Figueroa, Matias**

## Breve descripción
Lo que nosotros elegimos hacer es una marquesina, la cual presenta un mensaje en una pantalla de 5 caracteres, centrados en la misma. Comenzamos por buscar informacion en internet sobre como sincronizar la placa FPGA con la salida VGA del monitor, en base a esos datos comenzamos a elaborar un componente de sincronismo para escribir, en negro los 640x480 píxeles de la pantalla, sumado a los porches y los periodos de sincronismo de cada lado, lo que hacemos para el sincronismo es hacer dos contadores, uno vertical y el otro horizontal ya que los pixeles se recorren de izquierda a derecha y luego saltamos a la siguiente fila, a esto le sumamos un reloj de 25MHz con el cual en cada periodo del reloj teniamos una cuenta. En el sincronismo tambien determinamos la parte que sera visible de la pantalla que serian los 640x480 pixeles.
Una vez generado el sincronismo, nos pusimos a elaborar el resto del código para poder presentar letras y símbolos, por lo que utilizamos el código ASCII el cual, con ayuda del profesor qeuin generó nuestra fuente a partir de una imagen que contenia los caracteres en formato 8x8, con ello hicimos la tabla de caracteres que lo que hace es asignar al caracter que queremos mostrar, lo que se le pide del codigo posicion_texto. Luego ingresamos manualmente en binario el número de la tabla de ASCII del caracter que deseamos representar. El programa se va a la tabla de caracteres, lo ubica y lo asigna a Char que con el código generador, genera el caracter que nosotros le solicitamos y lo asigna a px_visible el cual se envía a salida de video que es lo que mostramos en pantalla


## Utilidades del proyecto
El proyecto realizado muestra en pantalla un mensaje que se va desplazando. Este se puede cambiar a discreción por el usuario. Se puede utilizar para mostrar información de distintos tipos, sin la necesidad de una pantalla muy grande ya que se trata de una sola linea de texto que se va moviendo. Es utilizada en colctivos de larga distancia y de línea urbana para indicar su destino o su recorrido. Tambien solemos encontrarlos en aerocon el mismo proposito, o en locales comerciales para indicar por ejemplo su horario de atención.

El objetivo de este trabajo final es poder mostrar un cartel mediante el uso de una FPGA por un monitor con entrada VGA

## Etapas del proyecto

- Buscar información sobre el funcionamiento de un monitor VGA y la presentacion de informacion en un monitor a partir de una FPGA

- Armado de los diferentes módulos que serán necesarios a la hora de transmitir una imagen.

- Conexión de la FPGA y carga del programa

- Armado del archivo `top.vhd` que utilizamos para conectar nuestros componentes en la **FPGA** 

## Bloques del proyecto
- Sync.vhd
- generador.vhd
- posicion_texto.vhd
- tabla_caract.vhd

- clock_video_pll



## Descripcion por bloque


###  Sync.vhd

Este código describe una serie de señales de entrada y salida. Las señales de entrada incluyen un reinicio "rst", un reloj "clk" y una señal "sync_v" de sincronización vertical. Las señales de salida incluyen una señal "sync_h" de sincronización horizontal, una señal de muestra "muestra", y señales de fila y columna que se utilizan para posicionar la muestra en la pantalla. El código implementa un proceso que utiliza dos flip-flops para contar el número de ciclos de reloj para la sincronización vertical y horizontal. Además, hay dos procesos adicionales que se utilizan para actualizar las señales de fila y columna en función del conteo del flip-flop. Por último, hay un proceso de "data_visible" que determina si la señal de muestra debe ser visible en la pantalla en función de las señales de sincronización y conteo del flip-flop. 




### Generador.vhd

Este código tiene una entrada de tres vectores, una señal de muestra, y una salida de una sola señal de lógica estándar. Este codigo genera una señal "px_visible" que estará activada o desactivada dependiendo de la combinación de las entradas recibidas.
La lógica detrás de la señal "px_visible" se basa en el valor de los vectores de entrada "fila_z" y "columna_z". A partir de estos valores, se ubica un valor de “char” y se lo compara con la señal de entrada "muestra". Si "muestra" está activa y el bit en la posición calculada del vector "char" está activo, la señal de salida "px_visible" estará activa. Este componente nos sirve para enviar la salida de video que conectaremos con unos de los pines de salida de la fpga.

### Posicion_texto.vhd

 Este codigo lo que hace es tomar las entradas de los valores de “fila”, “columna”, “char” y “muestra” y a partir de estos le asigna a las salidas los 3 bits mas significativos de los 10 de “fila” y “columna” a los vectores “fila_z” y “columna_z” y luego los alinea restando a la “fila” 211 lugares, con este componente posicionamos el texto en el lugar de la pantalla que deseamos.


### Tabla_caract.vhd

 Este código define una entidad llamada "tabla_caract" que toma una entrada de 7 bits llamada "codigo_char" y produce una salida de 64 bits llamada "char". La arquitectura de la entidad define una señal interna llamada "codigo_char_e" que se utiliza para convertir la entrada en un valor entero. A continuación, utiliza una declaración "with" para seleccionar la salida en función del valor de "codigo_char_e". La salida es una tabla de caracteres codificados en hexadecimal que se asignan a cada posible valor de entrada. En resumen, esta entidad es una tabla de búsqueda que devuelve el código de carácter en función del valor de entrada.


## Top.vhd

Este código unifica y conecta todo, posee un puerto de entrada "clk" (reloj) y tres puertos de salida "salida_vid", "sync_h" y "sync_v". El diseño incluye componentes adicionales (sync, clock_video_pll, generador, posicion_texto y tabla_caract), cuyas señales de entrada y salida se conectan a los puertos de la entidad mediante la correspondiente instrucción "port map". En este componente conectamos entre sí los componentes antes descriptos mediante señales internas y es el que define cuales seran las señales de los componentes internos que luego conectaremos a las salidas y entradas fisicas de la FPGA mediante el uso de software especifico como ser el `ICECube` y el `Diamond Programmer`.








Formas del texto:
# Titulo
## Subtitulo
**Negritas**
`resaltado en gris`
````
bloque en gris
````

