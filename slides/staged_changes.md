# Viewing Staged and Unstaged Changes


Para revisar y comparar cambios con la versión anterior de un archivo el
comando `status` no es muy útil. El comando para esto es `git diff`.
Cuando se corre el comando `diff` sin argumentos Git mostrará una
comparación de los archivos que están en el área de trabajo (*working
directory*) y la versión que está en el *Staging Area*, es decir que
está lista para ser confirmada. Si se quiere comparar los cambios que
ya fueron mandados al *Staging Area*, y que serán efectuados al
siguiente *commit*, se corre con los argumentos `git diff –staged`. Con
el arugmento `staged` se compara el *commit* más reciente con los
cambios hechos a un archivo desde ese *commit*.

Ahora bien, correr `git diff` directamente en la terminal abre el editor
Vim en modo de lectura, lo cual no siempre es lo más cómodo porque Vim
no es precisamente intuitivo. En la práctica es más facil dejar que esto
lo haga una de las interfaces gráficas de Git. En la mayoría de los
casos vienen integradas con tu editor o IDE, y si todo eso falla puedes
utilizar el comando `git difftool –tool` para ver que visualizadores
tienes disponibles, o simplemente `git difftool` para lanzar la
herramienta default\[1\].