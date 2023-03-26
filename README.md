#  Proyecto Cartel VGA - Ing. Electrónica 2023
**Ajmat, Juan Ignacio - Figueroa, Matias**

El objetivo de este trabajo final es poder mostrar un cartel mediante el uso de una FPGA por un monitor con entrada VGA

## Etapas del proyecto

- Buscar información sobre el funcionamiento de un monitor VGA y la presentacion de informacion en un monitor a partir de una FPGA

- Armado de los diferentes módulos que serán necesarios a la hora de transmitir una imagen.

- Conexión de la FPGA y carga del programa


## Modulos creados
`Sync.vhd`
En primer lugar creamos el modulo del sincronismo, cuyo objetivo es contabilizar las filas y columnas recorridas por el monitor y definir el area visible que sea aprovechada para mostrar el mensaje



Formas del texto:
# Titulo
## Subtitulo
**Negritas**
`resaltado en gris`
````
bloque en gris
````

