# The Three States
Git tiene tres estados en los que puede estar un archivo en cualquier
momento dado:

  - **Modified**: El archivo tiene modificaciones pero aún no se le
    ordena a Git incluir los cambios en el siguiente “commit” o
    confirmación.

  - **Staged / Preparado**: El archivo fue modificado y marcado para que
    Git lo observe y guarde su versión actual en el siguiente commit.

  - **Commited / Confirmado**: Los cambios al archivo ya fueron
    observados y confirmados. Se guarda el estado actual del archivo en
    la base de datos de Git.

Adicionalmente hay archivos que pueden estar dentro del directorio, en
disco, y no existir dentro de la base de datos Git. Los tres estados
anteriores solo aplican para archivos *rastreados* o *tracked*. Los
archivos *no-rastreados* o *untracked* siguen dentro del alcance de
búsqueda de Git, y éste aún los puede ver, pero tiene instrucciones de
no rastrear modificiaciones.

Similarmente, hay tres secciones o “espacios” en cada proyecto de Git:

1.  Working Directory.

2.  Staging Area.

3.  Git Repository.

*Working Directory* es el directorio “fisico”, local en tu máquina en
donde estás trabajando. Es como cualquier otra carpeta, pero tiene la
particularidad de que hay una instancia de Git observándola. El *Working
Directory* es el de una versión particular del proyecto. Los archivos
fueron descomprimidos de la base de datos de Git, y puestos en el disco
para poder ser modificados como cualquier otro archivo.

*Staging Area* se puede pensar como el lugar físico a donde se mandan
los archivos que están marcados como listos para ser confirmados
(commited). En realidad es un archivo, pero la abstracción de lugar es
más útil.

*Git repository* es donde vive la base de datos de Git, y todos los
metadatos asociados. Aqui se guardan las diferentes versiones
comprimidas de cada commit hecho, asi como apuntadores y metadatos de
documentación. El archivo .git es el que contiene toda esta información,
y es el que obtiene uno al clonar un repositorio.

Un archivo particular se considera *commited* (confirmado) si fue
modificado, añadido al *staging area*, y se hizo un *commit*
(confirmación). Los cambios que se le hicieron a ese archivo ahora
están grabados en git. Un archivo se considera *staged* (preparado) si
se modifició y se añadió al *staging area*. Un archivo se considera
*modified* (modificado) si sufrió cambios desde la última versión que
conoce Git, pero aún no se añade al *staging area*. Los archivos
*modified* que no sean añadidos al *staging area* antes de efectuar un
*commit* no serán rastreados en ese *commit*, y sus cambios no se
guardarán.