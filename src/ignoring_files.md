# Ignoring Files


Muchas veces hay archivos temporales que se crean al correr código en
los cuales no estamos interesados. Para evitar que Git esté listándolos
siempre que se corra `status` o añadirlos por error, se puede crear una
lista de archivos que no nos interesa rastrear y preferimos que Git
ignore por completo. Esto se hace a través de un `.gitignore`.

Un `.gitignore` es un archivo que le dice a Git que archivos no estamos
interesados en rastrear. Por ejemplo, puede que no estemos interesados
en archivos `.log`, o en archivos `.aux` que se crean con la compilación
de archivos TeX. En vez de listarlos por nombre, podemos utilizar . Para
esto se utilizan patrones Glob, que son como expresiones regulares
(regex) simplificadas. El ejemplo mas simple es el siguiente:

    # Git ignore para proyecto x
    *.log
    *.aux
    Build/

La primera linea empieza con un \#, y se toma como un comentario.
Usualmente es util para aclarar el propósito del `.gitignore` u otras
cosas. El patrón `*.log` quiere decir “ignora todos los archivos que
terminen con `.log`”. Ese mismo patron se puede usar con la extensión de
archivo que sea, `.log` no tiene nada de especial. Análogamente el
patrón `Build/` indica que no se debe rastrear nada dentro de la
carpeta `Build` ni de sus subdirectorios. Afortunadamente, no hace falta
tener esto en cuenta la mayoría del tiempo. GitHub mantiene una librería
de `.gitignore`s estándar para una gran variedad de lenguajes de
programación y proyectos, la cual está disponible en
<https://github.com/github/gitignore>.