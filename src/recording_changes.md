# Recording changes

Una vez que se tiene un repositorio de Git y archivos rastreados, se
puede empezar a usar todo el potencial de Git.

![Ciclo de vida de un archivo en un Git
Repo.<span label="fig:lifecycle"></span>](figs/lifecycle.png)

Como habíamos dicho, un archivo puede estar en uno de cuatro estados en
cualquier momento dado: *untracked*, *unmodified*, *modified*, *staged*,
como lo muestra la figura [2](#fig:lifecycle).

Para checar en qué punto del ciclo se encuentran los archivos existe el
comando `git status`. Por ejemplo, al correrlo cuando se ha iniciado un
nuevo repo o no se han hecho cambios desde el último *commit*, se ve
asi:

    $ git status
    On branch master
    Your branch is up-to-date with 'origin/master'.
    nothing to commit, working directory clean

Con la frase “working directory clean” quiere decir que no hay cambios
para el siguiente *commit*, ya sea porque no se han rastreado los
archivos o porque los archivos rastreados no han sido modificados desde
el último *commit*. Si se añaden archivos nuevos desde el último commit
al correr `git status` saldrá un mensaje similar:

    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            ejemplo.txt

con lo cual vemos que el archivo es reconocido por Git, pero que los
cambios que se le hagan o su estado actual no serán rastreados por git.

Una vez que se empieza a rastrear un archivo y se hace un primer
*commit* con el y se empiece a modificar, la siguiente vez que se corra
`git status`, mostrará algo como lo siguiente:

    On branch master
      Changes not staged for commit:
        (use "git add <file>..." to update what will be committed)
        (use "git checkout -- <file>..." to discard changes in working directory)
    
              modified:   ejemplo.txt

Eso no quiere decir que el archivo (en este caso `ejemplo.txt`) dejó de
ser rastreado por Git y que se perdió el historial de cambios, sino que
Git reconoce los cambios hechos al archivo y ahora está esperando a que
se añada al *staging area* mediante `git add`, ya que Git deja al
usuario decidir qué cambios se toman en cuenta para un commit dado, en
vez de asumir que todos los cambios entre un *commit* y el siguiente son
todos relacionados con lo mismo.

Cubiertos los básicos, hay un flag (opción) que se puede pasar al
comando `git status` para hacerlo más corto y facil de entender: el flag
`-s` que es corto para `–short`.

    $ git status -s
      M  ejemplo.txt
      A  anadido.txt
      ?? otro.txt

Ahora en vez de listar archivos como *staged*, *modified*, etc…Git
muestra una lista corta de los archivos de interés con una letra
mayúscula a su izquierda. Esa letra a la izquierda se llama .

<table>
<caption>Guía de códigos de estatus para <code>git status -s</code></caption>
<thead>
<tr class="header">
<th style="text-align: center;">Código de Estatus</th>
<th style="text-align: left;">Significado</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"></td>
<td style="text-align: left;">Sin modificar</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>M</strong></td>
<td style="text-align: left;">Modificado</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>A</strong></td>
<td style="text-align: left;">Añadido</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>D</strong></td>
<td style="text-align: left;">Eliminado (deleted)</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>R</strong></td>
<td style="text-align: left;">Renombrado</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>C</strong></td>
<td style="text-align: left;">Copiado</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><strong>U</strong></td>
<td style="text-align: left;">Actualizado (updated)</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>??</strong></td>
<td style="text-align: left;">Untracked (sin rastrear)</td>
</tr>
</tbody>
</table>
