# ¿Qué es Git?

En pocas palabras, Git (Git, no GitHub) es un sistema de control de
versiones. Git es como un supervisor que vive en la carpeta en la que
estás trabajando y se encarga de anotar todos los cambios, y tener una
bitácora con todos ellos por si quieres volver a un punto anterior.
Además permite cosas como trabajar en ramas separadas, y brilla al
momento de trabajar en equipos grandes. Usando Git para trabajar en
equipos se evitan los problemas de quién tiene la versión final, y
permite revisar quién hizo qué cambios en qué momento.

GitHub por su parte es un servicio de almacenamiento. Tiene todas las
funcionalidades de git, pero da una página web para accesarlas de manera
amigable, y da el servicio de guardar un proyecto en la nube para poder
colaborar con más personas.

![Meme
ilustrativo.<span label="fig:lifecycle"></span>](figs/meme_git_v_gh.jpg)

## ¿Cómo instalo y uso git?

Las instrucciones de instalación para Windows y Mac están en la [página
de descargas del sitio de git](https://git-scm.com/downloads). Si usas
MacOS, puedes abrir tu terminal y escribir `git`. Quizás ya lo tengas
instalado. Si no lo está, te sugerirá descargar el “XCode developer
package” que incluye a git y otros comandos útiles.

Hay varias maneras de interactuar con git. En estas notas se asume que
se interactúa a través de la terminal (también llamada linea de
comandos, shell, etc...). Para MacOS una vez instalado git puedes abrir
tu terminal y escribir el comando `git`, con eso basta. Si estás en
Windows, después de haber instalado git abre tu menú de aplicaciones y
busca ”git bash“. Te abrirá una terminal (ventana negra con texto). Ahi
ya puedes interactuar con git.

Si estás usando un editor como Visual Studio Code, al abrir la terminal
integrada debeías poder usar git directamente.

## Snapshots, Not differences

Los sistemas VCS usuales tienen un control de versiones *delta-based*.
Guardan listas de cambios por archivo.

Git guarda snapshots de todos los archivos modificados y guarda
apuntadores a cada estado. Cada repositorio de git es una copia completa
y funcional del proyecto, no requiere dependencias externas y es todo
local.

Git hace checksums en cada commit, lo cual hace difícil o imposible
modificar sin que Git se de cuenta o perder información porque todo se
verifica y valida.
