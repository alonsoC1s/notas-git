# Working with remotes

Un remote es el servidor externo en el modelo distribuido.

. . .

Interactuamos con remotes a través de 3 comandos:

:::incremental.
- `pull`
- `push`
- `fech`
:::

## Listando remotes

	$ git remote -v

. . .

Si se clonó de GitHub verás el URL original. Si se inició con una
carpeta no habrá ningún remote configurado

. . .

Cuando se clona un repo se añade automáticamente un remote: `origin`.

. . .

Se pueden añadir remotes

	$ git remote add <shortname> <url>

## Pulling

Podemos _jalar_ (descargar) la versión de una rama específica de un
remoto específico.

	$ git pull <remote> <branch>

Pull no solo baja los contenidos, sino que los _mezcla_ con la rama
actual

. . .

Se puede descargar sin mezclar con fetch.

	$ git fetch origin main

Que crea una _rama_ nueva sin modificar tus archivos.

## Pushing

Se puede subir a GitHub con el comando `push`.

	$ git push <remote> <branch>

. . .

Para poder hacer push debes estar al día con `<branch>`

. . .

Más información de un remote con

	$ git remote show <remote>

## Tagging

Otra habilidad de Git es etiquetar (*tag*) *commit*s específicos

Permite ir clasificando por "versiones", como 1.0.x

. . .

Se listan los tags existentes con `git tag`.
