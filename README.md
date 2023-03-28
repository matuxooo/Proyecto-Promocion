#  Proyecto Marquesina VGA - Ing. Electrónica 2023

### Integrantes del grupo	
**Ajmat, Juan Ignacio - Figueroa, Matias**

## Breve descripción
Lo que nosotros elegimos hacer es una marquesina, la cual presenta un mensaje en una pantalla de 5 caracteres, centrados en la misma. Comenzamos por buscar informacion en internet sobre como sincronizar la placa FPGA con la salida VGA del monitor, en base a esos datos comenzamos a elaborar un componente de sincronismo para escribir, en negro los 640x480 píxeles de la pantalla, sumado a los porches y los periodos de sincronismo de cada lado, lo que hacemos para el sincronismo es hacer dos contadores, uno vertical y el otro horizontal ya que los pixeles se recorren de izquierda a derecha y luego saltamos a la siguiente fila, a esto le sumamos un reloj de 25MHz con el cual en cada periodo del reloj teniamos una cuenta. En el sincronismo tambien determinamos la parte que sera visible de la pantalla que serian los 640x480 pixeles.
Una vez generado el sincronismo, nos pusimos a elaborar el resto del código para poder presentar letras y símbolos, por lo que utilizamos el código ASCII el cual, con ayuda del profesor qeuin generó nuestra fuente a partir de una imagen que contenia los caracteres en formato 8x8, con ello hicimos la tabla de caracteres que lo que hace es asignar al caracter que queremos mostrar, lo que se le pide del codigo posicion_texto. Luego ingresamos manualmente en binario el número de la tabla de ASCII del caracter que deseamos representar. El programa se va a la tabla de caracteres, lo ubica y lo asigna a Char que con el código generador, genera el caracter que nosotros le solicitamos y lo asigna a px_visible el cual se envía a salida de video que es lo que mostramos en pantalla


## Función del proyecto
El proyecto realizado muestra en pantalla un mensaje que se va desplazando. Se puede utilizar para mostrar información de distintos tipos, sin la necesidad de una pantalla muy grande ya que se trata de una sola línea de texto que se va moviendo. Es utilizada en colectivos de larga distancia y de línea urbana para indicar su destino o su recorrido. También solemos encontrarlos en aeropuertos con el mismo propósito, o en locales comerciales para indicar por ejemplo su horario de atención.
El objetivo de este trabajo final es poder mostrar un cartel mediante el uso de una FPGA por un monitor con entrada VGA

El objetivo de este trabajo final es poder mostrar un cartel mediante el uso de una FPGA por un monitor con entrada VGA

## Etapas del proyecto

- Buscar información sobre el funcionamiento de un monitor VGA y la presentacion de informacion en un monitor a partir de una FPGA

- Armado de los diferentes módulos que serán necesarios a la hora de transmitir una imagen.

- Conexión de la FPGA y carga del programa

- Armado del archivo `top.vhd` que utilizamos para conectar nuestros componentes en la **FPGA** 

## Bloques del proyecto
- Sincronismo
- generador
- posicion de texto
- tabla de caracteres
- generador de desplazamiento




## Descripción por bloque


###  Sincronismo


Este bloque sirve para determinar el sincronismo de columnas y filas y para contar las columnas y filas que vamos recorriendo. De él obtendremos también información sobre si nos encontramos en un área visible de la pantalla o no.





### Generador

Este componente nos sirve para enviar la salida de video que conectaremos con unos de los pines de salida de la FPGA.

### Posición texto

 Con este componente posicionamos el texto en el lugar de la pantalla que deseamos.

### Tabla de caracteres

 Es una tabla de búsqueda que devuelve el código de carácter (en hexadecimal) a mostrar en función del valor de entrada.

### Generador de desplazamiento

La señal de desplazamiento  se actualiza con el valor actual del contador de desplazamiento. Este módulo se utiliza para poder mover los caracteres en la pantalla.




## Top

En este componente conectamos entre sí los componentes antes descritos mediante señales internas y es el que define cuales son las señales de los componentes internos que luego conectaremos a las salidas y entradas físicas de la FPGA mediante el uso de software específico como ser el ICECube y el Diamond Programmer.











