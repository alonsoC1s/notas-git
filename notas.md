---
title : Notas de "Pro Git"
author : Alonso
...

What is Git?
============

Snapshots, Not differences
--------------------------

Los sistemas VCS usuales tienen un control de versiones _delta-based_.
Guardan listas de cambios por archivo.

Git guarda snapshots de todos los archivos modificados y guarda apuntadores a cada estado.
Cada repositorio de git es una copia completa y funcional del proyecto, no requiere dependencias externas y es todo local.

Git hace checksums en cada commit, lo cual hace difícil o imposible modificar sin que Git se de cuenta o perder información porque todo se verifica y valida. 

The Three States
----------------

Git tiene tres estados en los que puede estar un archivo en cualquier momento dado: 
- **Modified**: El archivo tiene modificaciones pero aún no se le ordena a Git incluir los cambios en el siguiente "commit" o confirmación.

- **Staged / Preparado**: El archivo fue modificado y marcado para que Git lo observe y guarde su versión actual en el siguiente commit. 

- **Commited / Confirmado**: Los cambios al archivo ya fueron observados y confirmados. Se guarda el estado actual del archivo en la base de datos de Git.

Adicionalmente hay archivos que pueden estar dentro del directorio, en disco, y no existir dentro de la base de datos Git.
Los tres estados anteriores solo aplican para archivos _rastreados_ o _tracked_.
Los archivos _no-rastreados_ o _untracked_ siguen dentro del alcance de búsqueda de Git, y éste aún los puede ver, pero tiene instrucciones de no rastrear modificiaciones.

Similarmente, hay tres secciones o "espacios" en cada proyecto de Git: 

1. Working Directory.
2. Staging Area.
3. Git Repository.

_Working Directory_ es el directorio "fisico", local en tu máquina en donde estás trabajando.
Es como cualquier otra carpeta, pero tiene la particularidad de que hay una instancia de Git observándola.
El _Working Directory_ es el ~checkout~ de una versión particular del proyecto.
Los archivos fueron descomprimidos de la base de datos de Git, y puestos en el disco para poder ser modificados como cualquier otro archivo.

_Staging Area_ se puede pensar como el lugar físico a donde se mandan los archivos que están marcados como listos para ser confirmados (commited).
En realidad es un archivo, pero la abstracción de lugar es más útil.

_Git repository_ es donde vive la base de datos de Git, y todos los metadatos asociados.
Aqui se guardan las diferentes versiones comprimidas de cada commit hecho, asi como apuntadores y metadatos de documentación.
El archivo .git es el que contiene toda esta información, y es el que obtiene uno al clonar un repositorio.

Un archivo particular se considera _commited_ (confirmado) si fue modificado, añadido al _staging area_, y se hizo un _commit_ (confirmación).
Los cambios que se le hicieron a ese archivo ahora están grabados en git.
Un archivo se considera _staged_ (preparado) si se modifició y se añadió  al _staging area_.
Un archivo se considera _modified_ (modificado) si sufrió cambios desde la última versión que conoce Git, pero aún no se añade al _staging area_.
Los archivos _modified_ que no sean añadidos al _staging area_ antes de efectuar un _commit_ no serán rastreados en ese _commit_, y sus cambios no se guardarán. 

Todo lo anterior se puede resumir con la siguiente figura: 

![lifecycle](figs/lifecycle.png)

La dirección y mecánica de las flechas y sus movimientos se explica con mayor detalle más abajo en @[Git Basics]

Basic Git Workflow
------------------

1. Modifica archivos locales en disco.

2. Se elige qué archivos se desea rastrear (_track_) añadiéndolos al _staging area_. Son estos y solo estos los archivos que serán parte de la siguente confirmación.

3. Se lleva a cabo una _confirmación_, en la que se toman un snapshot del estado actual del _staging area_ y se guarda permanentemente en el repositorio Git, junto con datos de identificación y mensajes de confirmación.

Command Line Interface
----------------------

Para obtener ayuda sobre el comando 

````
$ git add -h
usage: git add [<options>] [--] <pathspec>...

    -n, --dry-run         dry run
    -v, --verbose         be verbose

    -i, --interactive     interactive picking
    -p, --patch           select hunks interactively
    -e, --edit            edit current diff and apply
    -f, --force           allow adding otherwise ignored files
    -u, --update          update tracked files
    --renormalize         renormalize EOL of tracked files (implies -u)
    -N, --intent-to-add   record only the fact that the path will be added later
    -A, --all             add changes from all tracked and untracked files
    --ignore-removal      ignore paths removed in the working tree (same as --no-all)
    --refresh             don't add, only refresh the index
    --ignore-errors       just skip files which cannot be added because of errors
    --ignore-missing      check if - even missing - files are ignored in dry run
    --chmod (+|-)x        override the executable bit of the listed files”
````

Git Basics
==========

Getting a Git Repository
------------------------

Usualmente uno obtiene un repositorio de Git en dos maneras: 

1. Tomas cualquier carpeta local en tu disco, y la conviertes en un repositorio con `git init`, o bien

2. _Clonas_ un repositorio de Git existente de algún otro lugar.

Para crear un repositorio nuevo desde una carpeta local, basta con navegar hasta la carpeta deseada a través de la terminal de comandos, y ejecutar el comando `git init` que creará un repositorio nuevo con todo lo necesario para usar Git, y rastrear cambios en los archivos de ese directorio.
El comando `init` crea un "esqueleto de git".
En este punto, ningun archivo está siendo rastreado, todos aparecen como _untracked_.
Si deseas empezar a rastrear cambios, debes cambiar el estatus de los archivos de _untracked_ a _tracked_ a través del commando `git add`.
Cabe mencionar que los archivos nuevos, es decir los originales en un directorio antes de correr `git init`, o aquellos creados o añadidos después de haber creado el repositorio, siempre aparecerán por primera vez como _untracked_, hasta que se le señale a Git que se deben rastrear.

> Notas: 
> El comando `git add` tiene dos funciones:
> Cambia el estatus de un archivo de _untracked_ a _tracked_, y además añade archivos _modified_ al _staging area_ para prepararlos para un _commit_.
> 
> `add` recibe como argumento nombres de archivos, o patrones _glob_.

Tradicionalmente una vez que se han rastreado los archivos de interés se hace un ~primer commit~.

````
$ git commit -m "Primer commit"
````

El modificador `-m` es corto para `message`, y quiere decir que le mensaje de confirmación viene en seguida rodeado de comillas, como en el ejemplo de arriba.
Si no se usa el modificador (flag) `-m`, Git abrirá el editor de texto default de la terminal, por ejemplo Vim, y estarás atrapado y confundido.


Si deseas copiar un repositorio existente, por ejemplo, para contribuir a algún proyecto o con tu equipo, entonces se crea un nuevo repositorio con `git clone`.
El comando `clone` recibe de argumento un URL a algún repositorio remoto.
Por ejemplo, el comando a continuación clona el repositorio donde está alojado el libro Pro Git, de Scott Chacon, con base en el cual se hicieron estas notas. 

````
$ git clone https://github.com/progit/progit2
````

El comando clone crea una nueva carpeta en el directorio actual donde residirá el repositorio `.git` junto con los archivos en el que corresponde a la versión que clonaste.
En automático el nombre de la carpeta que se va a crear es el nombre del repositorio, en este caso "progit2", pero también es posible especificar un nombre distinto.
Por ejemplo, si queremos que la nueva carpeta se llame "libro-git", pasamos ese nombre como argumento adicional, es decir:

````
https://github.com/progit/progit2 libro-git
```` 

Recording Changes
-----------------

Una vez que se tiene un repositorio de Git y archivos rastreados, se puede empezar a usar todo el potencial de Git. 

