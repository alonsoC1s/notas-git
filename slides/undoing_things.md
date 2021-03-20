# Undoing things

De las cosas más útiles de usar git es que se pueden revertir cambios.
Algunos ejemplos prácticos

## Committeando antes de tiempo

. . .

	$ git commit --ammend -m "Mensaje"

Permite por ejemplo cambiar mensaje de confirmación

## Staging antes de tiempo

Para "bajar" un archivo del staging area

	$ git reset HEAD <archivo>

## Revertir un archivo al commit previo

. . .

	$ git checkout - <archivo>

. . .

> Precaución: No hay manera de revertir este cambio. Se reemplaza por
> completo al archivo con otra versión distinta.
