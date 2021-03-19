# Getting a Git Repository

Usualmente uno obtiene un repositorio de Git en dos maneras:

::: incremental
1. Se crea un repo con una carpeta existente, o bien.

2. *Clonas* un repositorio de Git existente de algún otro lugar.
:::

# ¿Cómo iniciar repo con carpeta existente?

. . .

## Inicializando un repo vacío.

```bash
$ git init
```

. . .

Señalando qué archivos rastrear. En este caso todos los de python.

```bash
$ git add *.py
```


## Notas

>  El comando `git add` tiene dos funciones: Cambia el estatus de
> un archivo de *untracked* a *tracked*, y además añade archivos
> *modified* al *staging area* para prepararlos para un *commit*.
>
> `add` recibe como argumento nombres de archivos, o patrones *glob*.

# Obteniendo un repo de un lugar remoto

Podemos hacer un _clon_ exacto de un proyecto con todo y su historial
de cambios.

## Clonando de algún lugar en internet

Dado un URL:

. . .

	$ git clone https://github.com/progit/progit2

Esto crea una nueva carpeta en tu current working directory con los
archivos del repo & el historial de cambios.
