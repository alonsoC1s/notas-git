# Rebasing


Como el nombre sugiere, consiste en cambiar de base una versión
particular. Es decir, es como hacer los cambios que se efectuaron a
través de una rama, como si se hubieran hecho empezando desde otro
punto de la rama o de otra rama por completo.

    $ git rebase master

La operación funciona encontrando al ancestro común de las dos ramas que
se están uniendo, y aplicando lo cambios gradualmente. Una vez que se
hace un *rebase*, se puede hacer un *merge* simple del tipo
*fast-forward* hasta la punta de la rama. Todo eso gracias a que ahora
la punta de la rama y el *commit* al que se hizo el *rebase* tienen una
ancestría en común, una ancestría lineal. Ya no hay ningún conflicto de
versiones.

Vale la pena hacer notar que el producto final no tiene nada de
diferente a hacer un *merge*. La única ventaja notable es que hace que
la historia de *commits*, los logs, esté más limpio y claro.

Hay *rebases* más complejos, pero francamente no entendí del todo, y
valdrá la pena revisarlo con más calma.

### No incluí los cambios que quería en un commit anterior. ¿Ahora qué hago?

Ua buena aplicación del rebasing es justo en la situación del título.
¿Qué tal si yo tenía planeado incluir los cambios a el archivo
`ìndex.txt` en un commit que hice con el mensaje “Cambios a index.txt”,
pero me equivoqué y no añadí `index.txt` al *staging area* antes de ese
commit?

En concreto: Consideremos el log de cambios de un repo:

    a0b0c0E3 (HEAD -> master) Cambios que no eran de index.txt
    .
    .
    .
    a0b0c0E1 Cambios a index.txt

Digamos que yo quería incluir los cambios a `index.txt` en el commit con
hash `a0b0c0E1`, pero al correr `git status` me señala que los cambios
no están “staged for commit” para el siguiente commit y por lo tanto no
se añadieron antes. Para volver a antes de `a0b0c0E1` y ahora si añadir
los cambios en ese commit, podemos usar rebase como en la siguiente
receta:

1.  `git rebase –interactive ’a0b0c0E1^’`. Nótese que el hash del commit
    al que nos estamos refiriendo está postfijo por un “caret” (^). Eso
    indica rebase no a `a0b0c0E1`, sino *antes* de el.

2.  En el editor predeterminado se abrirá un archivo que se ve más o
    menos asi:
    
        pick a0b0c0E3 HEAD Cambios que no eran de index.txt
        pick a0b0c0E1 Cambios a index.txt
    
    Cambia `pick` a `edit` en la línea que tiene el chash del commit el
    cual deseas modificar o añadirle archivos. Guarda el archivo y
    ciérralo.

3.  Después de los pasos anteriores, Git marca al commit `a0b0c0E1` como
    el actual (donde se encuentra `HEAD`), y por lo tanto se le pueden
    añadir cambios con ammend. Por ejemplo:
    
        git add index.txt
        git commit --amend -m "Ahora si, cambios a index.txt"

4.  Para acabar y volver a la punta de la rama actual, es decir donde
    estábamos antes, seguimos el consejo de Git y corremos `git rebase
    –continue`.