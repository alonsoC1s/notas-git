# Working with remotes

Introducimos el concepto de un *Remote*. Un *remote* es una versión de
tu Git Repo alojada en algún otro lugar, como el internet. Gracias a los
*remotes* es que podemos colaborar en proyectos. Para recuperar cambios
o para subir los propios usamos los comandos `pull`, `fetch` y `push`
que dicutimos más adelante.

Para listar los *remotes* que tiene un repo podemos usar el comando `git
remote` sin argumentos. Si creaste un nuevo repo desde cero, `remote` no
dará ningún resultado, porque aún no has configurado ningún *remote*
para el repo actual. Si lo clonaste de algún lugar en internet el
comando debería listar por lo menos un remote: `origin`, que es el
nombre por defecto que recibe el *remote* original de donde fue clonado
el repositorio local. El comando sin argumentos solo da los nombres con
los cuales tiene guardados los *remotes*, lo cual no siempre es lo más
útil. Corriendo `git remote -v` obtenemos una lista no solo de los
*remotes* disponibles sino también el <span class="smallcaps">url</span>
al que nos estamos comunicando para subir y bajar cambios\[3\].

Como decíamos, clonar un repo automáticamente añade el origen como un
*remote*, y lo nombra `origin` apropiadamente. Para añadir *remote*s
nuevos se usa el comando `git remote add <shortname> <url>`. Por
ejemplo, el <span class="smallcaps">url</span> que va entre corchetes es
el <span class="smallcaps">url</span> de la página de GitHub en donde
estará alojado el repo. Una vez que se tiene configurado un *remote* es
fácil jalar o empujar cambios. El `shortname` que le asignaste al crear
un *remote* es el nombre con el que será conocido desde ese momento, y
con el cual te referirás para jalar o empujar cambios. Es decir, actúa
como un alias para todo el <span class="smallcaps">url</span>.

### Pulling

Para jalar los cambios que están en el *remote*, existe el comando `git
fetch <remote>`, que se traduce como “ir a buscar”, o “traer”. El
`remote` entre corchetes es el nombre corto que se le asignó a el
*remote* del cual se quiere hacer *fetch* al momento de configurarlo.
Este comando baja la versión más reciente del repo disponible en el
*remote*, pero `fetch` solo obtiene la versión más reciente y la
almacena en una nueva rama\[4\], pero no incorpora los cambios a tu
versión de los archivos. El estado de los archivos en tu *Working
Directory* no se ve afectado por `fetch`, y para incorporar los cambios
se tendría que hacer una unión (*merge*) entre la rama actual y la que
se creó, lo cual discutiremos a detalle en la sección sobre ramas.
Afortunadamente, el comando `git pull <remote> <branch>` ahorra el
proceso de unir ramas, y además de bajar los cambios más recientes del
*remote*, los combina automáticamente con el estado actual de los
archivos en el *Working Directory*. Lo realmente interesante de Git está
en lo que está escrito arriba: Git puede combinar cambios
automáticamente y en la mayoría de los casos, sin ninguna clase de
ayuda. Hablaremos más tarde de qué se hace cuando Git encuentra cambios
conflictivos entre el estado de un archivo en el *Working Directory* y
la versión en el *remote*.

### Pushing

Cuando deseas publicar tu versión del repo y el estado actual de los
archivos rastreados, puedes usar el comando `git push <remote> <branch>`
para *empujar* los cambios a el `remote` que se da como argumento, a la
rama que se especifica también entre corchetes.

Un detalle importante es que para hacer *push* a un *remote*, tu versión
local debe estar al día con la versión más reciente en el *remote*. Si
el *remote* tiene cambios más recientes a los que están en tu *Working
Directory*, Git te pedirá que bajes los cambios del remoto y actualices
tu versión a la que bajaste. Hasta entonces se puede hacer *push*.

Cabe mencionar que no siempre se tiene permiso de hacer *push* a
cualquier repositorio, se necesita que el dueño te de permiso.

Cuando se tienen diferentes *origin*s a los que se empuja y jala
regularmente, a veces es util pedir ayuda para recordar qué nombre corto
está asociado a qué <span class="smallcaps">url</span>, entre otras
cosas. El comando `git remote show <remote>` da más información acerca
del *remote* asociado al nombre corto que se da como argumento.
Dependiendo del caso de uso el comando puede dar mucha información. Por
ahora no damos más detalles al respecto.

También es posible cambiar el nombre corto de un *remote* después de
haberlo configurado. Esto se hace con `git remote rename <oldname>
<newname>`.

Análogamente, es fácil remover remotos, como cuando ya no se utilizan
más. Esto se hace mediante `git remote remove <remote>`.

### Tagging

Otra habilidad de Git es etiquetar (*tag*) *commit*s específicos; lo
cual es muy util cuando hubo cambios importantes o ese commit particular
está asociado a una versión importante o algo del estilo.

Listar los *tags* existentes es fácil, se hace con `git tag`. Si no se
ha etiquetado ningún *commit*, el comando no regresará nada. Cabe
mencionar que el orden en el que se listan los resultados es alfabético,
no cronológico.

Un uso interesante es revisar una serie específica de versiones, por
ejemplo, si se corre `git tag -l "v1.8.5*"` en el repositorio donde está
alojado el código fuente de Git, podemos ver la serie de versiones
1.8.5.\(x\).

    $ git tag -l "v1.8.5*"
      v1.8.5
      v1.8.5-rc0
      v1.8.5-rc1
      v1.8.5-rc2
      v1.8.5-rc3
      v1.8.5.1
      v1.8.5.2
      v1.8.5.3
      v1.8.5.4
      v1.8.5.5

En este ejemplo, el `*` que se usa en el string después del switch `-l`
(corto para `–list`) es un ejemplo de una expresión regular, y quiere
decir “cualquier caracter”.

Git permite dos tipos de *tags*: *lightweight* y *annotated*. El tipo
*lightweight* es solo una referencia a un punto particular del historial
de *commits*. Un *tag* del tipo *annotated* se guarda como su propio
*commit*, y tiene toda la información que contendría uno, como la fecha,
autor, etc… Por ejemplo, se puede crear una etiqueta anotada como

    $ git tag -a v1.0 -m "Version 1!"

El swith `-a` es corto para `–annotated`.

Para crear una etiqueta ligera, se usa el comando `tag` sin las opciones
`-a` ni `-m`. Por ejemplo

    $ git tag v1.0

Ahora puedes revisar la información del *commit* que fue etiquetado. Eso
se hace con `git show <tag>`.

También es posible etiquetar *commit*s que se hicieron en el pasado. Eso
se hace con `git tag <tag> <hash>` en donde `hash` es el código de
identificación corto que está asociado al checksum de un *commit*
particular. Este `hash` sale por ejemplo al correr `git log` con sus
posibles opciones.

Por default Git no comparte los *tags* hechos localmente, se tiene que
empujar mediante `push` como si fueran ramas independientes. Aún más
facil que eso, se puede correr `git push <remote> –tags` para subir
todos los *tags* al *remote* sin necesidad de hacerlo uno a uno. Cabe
mencionar que el comando anterior empuja ambos tipos de *tags*: anotadas
y ligeras.

Para eliminar *tags* existe el flag `-d`, corto para `–delete`. Por
ejemplo, si queremos eliminar el *tag* de ejemplo que hicimos arriba,
corremos

    $ git tag -d v1.0

Sin embargo, esto no va a eliminar las etiquetas del *remote* al que
fueron subidas. Si se quiere eliminar también del remote, se usa

    $ git push <remote> --delete <tagname>

Nota: Se pueden crear aliases para evitar escribir comandos largos con
argumentos complejos.
