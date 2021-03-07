# Commiting your changes


Una vez que hayas terminado los cambios que deseabas hacer y los
añadiste al *Staging Area*, es momento de guardar el estado actual de
los archivos mediante un *commit*. Para esto, tenemos el comando con un
nombre adecuado, `git commit`. Una vez más, este comando tiene flags
opcionales. En este caso la importante es `-m`, corto para `–message`.
En caso de que no se pase esta opción, Git lanzará el editor por defecto
de la terminal, en muchos casos Vim. Para evitar quedar atrapado en Vim,
puedes usar

    $ git commit -m "Mensaje de commit"

para poner un mensaje de confirmación o *commit message* sin necesidad
de abrir un editor de texto. Tradicionalmente el *commit message* se
utiliza para listar los cambios hechos desde el último *commit* en caso
de que sea necesario revertir a ese estado por alguna razón.

Un ejemplo de el output de `git commit -m`, sacado de Pro Git.

    $ git commit -m "Story 182: fix benchmarks for speed"
      [master 463dc4f] Story 182: fix benchmarks for speed
       2 files changed, 2 insertions(+)
       create mode 100644 README

En el texto de salida del comando vemos algunas cosas interesantes. Por
ejemplo vemos el nombre del *branch* o rama al que se confirmaron tus
cambios (en este caso `master`)\[2\], y un código alfanumérico llamado
checksum, en este caso `463dc4f`, y un resumen corto de los cambios,
inserciones y eliminaciones.

Dado que la mayoría del tiempo se quieren agregar todos los archivos
modificados al staging area sería deseable poder brincar el comando `git
add .` y confirmar todos los cambios en un solo comando. Para eso existe
el flag `-a`, el cual equivale a añadir todos los cambios al *Staging
Area* y luego confirmarlos con `commit`. Los flags `-a` y `-m` se pueden
usar juntos, pero poneindo `-m` al final (puesto que la sintaxis usual
de interfaces de command line espera el argumento de un flag
inmediatamente después de que se utilice este flag). Por ejemplo:

    $ git commit -a -m "Fixes"