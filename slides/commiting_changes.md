# Commiting your changes

:::incremental
1. Guardar cambios en git con: `git commit`.
	- Es mejor siempre usar el modificador `-m`

2. El output da información interesante:
	- Nombre de rama. Aquí `main`.
	- Código alfanumérico llamado checksum
	- Estadísticas de cambios
:::

## Un pequeño atajo

Es común querer agregar todo lo modificado al staging area
directamente.

. . .

Combinamos modificadores `-m` con `-a` que es corto para `--all`.

	$ git commit -a -m "Fixes"

# Compartiendo con el mundo

El punto entero es trabajar con otras personas.

. . .

Recordamos el modelo distribuido anterior.

##

![](figs/distributed.png){.stretch}

. . .

En este caso GitHub será el remoto. (Server)

##

El comando push se contacta con el remoto.

	$ git push origin main

. . .

Toma 2 cosas:

- El nombre del remoto: `origin`
- El nombre de la "rama": `main`
