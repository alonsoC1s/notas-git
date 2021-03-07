# Branching Workflows


En esta subsección revisamos algunos de los *workflows* más comunes que
se usan para trabajar con Git y ramas. Esto es en realidad más
descriptivo que normativo, pero es útil para estructurar proyectos
grandes. En especial porque estos *workflows* están diseñados para
evitar conflictos a la hora de las uniones, y tener tantas uniones
simples como sea posible.

### Long-Running Branches

La estructura de desarrollo de ramas *long-running* se basa en tener un
número pequeño de ramas principales que siempre están abiertas,
dedicadas a las diferentes etapas del desarrollo, las cuales se unen
entre si de manera regular.

Una estrategia común es tener dos ramas principales: *master* y
*development* (los nombres no son importantes). En `master` se tiene el
código en su estado más pulido, mientras que en `development` se hacen
los cambios importantes que solo se unen a `master` una vez que están
terminados, probados, etc… Es usual agregar una rama o serie de ramas
más dedicadas a resolver problemas particulares. Estas ramas se unen a
`development` una vez que se resolvió aquello para lo cual fueron
creadas, y se eliminan poco después. Este tipo de ramas se conocen como
*topic branches*, o ramas de tema.

Es útil pensar en las ramas estructuradas de esta manera como almacenes
en los que se guarda código en función de su madurez.
