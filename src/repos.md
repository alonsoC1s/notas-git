# Getting a Git Repository

Usualmente uno obtiene un repositorio de Git en dos maneras:

1. Tomas cualquier carpeta local en tu disco, y la conviertes en un
    repositorio con `git init`, o bien

2. *Clonas* un repositorio de Git existente de algún otro lugar.

Para crear un repositorio nuevo desde una carpeta local, basta con
navegar hasta la carpeta deseada a través de la terminal de comandos, y
ejecutar el comando `git init` que creará un repositorio nuevo con todo
lo necesario para usar Git, y rastrear cambios en los archivos de ese
directorio. El comando `init` crea un “esqueleto de git”. En este punto,
ningún archivo está siendo rastreado, todos aparecen como *untracked*.
Si deseas empezar a rastrear cambios, debes cambiar el estatus de los
archivos de *untracked* a *tracked* a través del commando `git add`.
Cabe mencionar que los archivos nuevos, es decir los originales en un
directorio antes de correr `git init`, o aquellos creados o añadidos
después de haber creado el repositorio, siempre aparecerán por primera
vez como *untracked*, hasta que se le señale a Git que se deben
rastrear.

> Notas: El comando `git add` tiene dos funciones: Cambia el estatus de
> un archivo de *untracked* a *tracked*, y además añade archivos
> *modified* al *staging area* para prepararlos para un *commit*.
>
> `add` recibe como argumento nombres de archivos, o patrones *glob*.

Tradicionalmente una vez que se han rastreado los archivos de interés se
hace un “primer commit”.

    $ git commit -m "Primer commit"

El modificador `-m` es corto para `message`, y quiere decir que le
mensaje de confirmación viene en seguida rodeado de comillas, como en el
ejemplo de arriba. Si no se usa el modificador (flag) `-m`, Git abrirá
el editor de texto default de la terminal, por ejemplo Vim, y estarás
atrapado y confundido.

Si deseas copiar un repositorio existente, por ejemplo, para contribuir
a algún proyecto o con tu equipo, entonces se crea un nuevo repositorio
con `git clone`. El comando `clone` recibe de argumento un URL a algún
repositorio remoto. Por ejemplo, el comando a continuación clona el
repositorio donde está alojado el libro Pro Git, de Scott Chacon, con
base en el cual se hicieron estas notas.

    $ git clone https://github.com/progit/progit2

El comando clone crea una nueva carpeta en el directorio actual donde
residirá el repositorio `.git` junto con los archivos en el que
corresponde a la versión que clonaste. En automático el nombre de la
carpeta que se va a crear es el nombre del repositorio, en este caso
“progit2”, pero también es posible especificar un nombre distinto. Por
ejemplo, si queremos que la nueva carpeta se llame “libro-git”, pasamos
ese nombre como argumento adicional, es decir:

    $ git clone https://github.com/progit/progit2 libro-git
