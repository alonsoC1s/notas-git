# Undoing things

Quizás una de las más grandes ventajas de usar un VCS es poder revertir
cambios, pero hay que tener en cuenta que no todo se puede, y si no se
tiene cuidado se pueden perder cosas de manera permanente. La mayoría de
los siguientes comandos y cómo se hace lo que se describe a continuación
viene en pequeñas instrucciones o pistas cuando se corre `git status`
sin argumentos.

Por ejemplo, si se hizo un commit antes de tiempo, se puede usar el
comando `commit` una vez más, pero con la opción `–amend`. Esto
incorpora los cambios sin duplicar una confirmación. También es util
para modificar el mensaje de confirmación por si se quiere añadir más
información.

Otro error comun es añadir dos archivos al *Staging Area* cuando alguno
de los dos no estaba listo, o simplemente porque se quiere confirmar los
cambios por separado. El comando `git reset HEAD <archivo>` sacan el
archivo seleccionado del *Staging Area* pero conservan las
modificaciones.

Ahora bien, ¿cómo revierto los cambios no deseados a un archivo? Para
des-modificar un archivo y regresarlo al estado en el que estaba en el
último commit, se usa `git checkout – <archivo>` para des-modificar
`archivo`. Hay que tener mucho cuidado al usar este comando, porque
reemplaza el archivo en el *Working Directory* completamente por otra
vesión de el. No hay forma de deshacer estos cambios (ni con ctrl-z).

Más adelante discutimos mejores prácticas para guardar temporalmente
cambios y otras técnicas.