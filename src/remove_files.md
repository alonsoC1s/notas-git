# Removing Files
Para quitar archivos del repositorio de Git hay que sacarlos de los
archivos rastreados. Para eso existe el comando `git rm`. Mucho cuidado,
`rm` no solo remueve el archivo de la base de datos de Git, también lo
elimina en tu *Working Directory*\! Para quitarlo de los archivos
rastreados sin eliminarlo del directorio local se utiliza la opción
`–cached`. Cabe mencionar que este comando acepta no solo nombres de
archivos, sino patrones Glob como se mencionó antes.
