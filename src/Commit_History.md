# Viewing the Commit History

El punto entero de tener un sistema de control de versiones es poder
registrar cambios graduales, por eso se tiene el sistema de commits. En
caso de ser necesario, se puede navegar a puntos anteriores en el
tiempo, y revertir a esos cambios. También se puede experimentar en el
proyecto sin temor a dañar algo y que sea irreversible.

Para revisar el historial de cambios y confirmaciones existe el comando
`git log`. Por ejemplo, al correrlo dará un resultado como este:

    $ git log
      commit ca82a6dff817ec66f44342007202690a93763949
      Author: Scott Chacon <schacon@gee-mail.com>
      Date:   Mon Mar 17 21:52:11 2008 -0700
    
          Change version number
    
      commit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7
      Author: Scott Chacon <schacon@gee-mail.com>
      Date:   Sat Mar 15 16:40:33 2008 -0700
    
          Remove unnecessary test
    
      commit a11bef06a3f659402fe7563abf99ad00de2209e6
      Author: Scott Chacon <schacon@gee-mail.com>
      Date:   Sat Mar 15 10:31:28 2008 -0700
    
          Initial commit

Al correr `git log` sin argumentos se obtiene una lista de los commits
del repo en orden cronológico inverso. Cada listado tiene la información
relevante del commit: el checksum que sirve como identificación única,
nombre y correo electrónico del autor, la fecha y hora de confirmación,
y el mensaje que se dió.

El comando `log` tiene una variedad de opciones. Por ejemplo, la opción
`-n` muestra los \(n\) commits más recientes. La opción `-p`, corto para
`–patch`, muestra los cambios hechos por cada commit. Equivale a correr
`diff` sobre cada commit individualmente. La opción `–stat` da
estadísticas rápidas sobre cada commit como el número de líneas
modificadas.

Si el resultado aparece demasiado extenso hay una opción para hacerlo
más legible: `–pretty`. La opción `–pretty` funciona como un
diccionario key-value. Es decir, se utiliza con otras opciones, por
ejemplo `oneline`, `short`, `full`, `fuller`. Si se necesita aún más
flexibilidad el comando acepta un objeto tipo *format*, en el que se le
puede especificar un *string format* para acomodar los datos que se
crean convenientes en la forma deseada. Puesto que no es muy común no
incluyo más detalles. Se pueden encontrar mejores referencias en , o
simplemente corriendo `man git log`.

Una buena opción para un log corto es `git log –oneline –decorate`, que
da por ejemplo:

    $ git log --oneline --decorate
    a3eb382 (HEAD -> master) Viewing commit history
    ca82a6d Change version number
    17c4c59 Remove unnecessary test
    6cdc27e Initial commit

que solo muestra el número identificador abreviado y el mensaje de
confirmación.

Cuando se está trabajando con diferentes ramas el comando `git log
–graph –oneline –decorate` muestra un arbol con las ramas de
desarrollo y su interacción entre ellas. Hablaremos con más detalle de
ramas más adelante.

Vale la pena mencionar que Git hace una distinción entre *author* y
*committer*. Es decir, el autor es quien hizo los cambios, el
confirmador (*committer*) es simplemente quien los confirmó.

El comando log tiene aún más opciones y funciones, las cuales no tiene
sentido revisar ahora.