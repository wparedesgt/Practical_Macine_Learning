#Receiver_Operating_Characteristic

Esta lección trata sobre las curvas ROC, es decir,
las curvas de Característica Operativa del Receptor -Receiver Operating Characteristic- Se trata de una técnica muy frecuentente utilizada
para medir la calidad o la bondad de un algoritmo
de predicción. En una clasificación binaria, se hace la 
predicción con una o dos categorías. De nuevo, sería posible predecir si alguien está vivo o muerto, enfermo o saludable. Se podría predecir si se va hacer clic en un anuncio o si no se va ha hacer clic. Pero las predicciones a menudo son cualitativas En otras palabras, casi todos los algoritmos de modelado
disponibles no sólo asignarán a una clase o a otra,
podrían asignar una probabilidad de estar vivo, o una predicción
en una escala del 1 al 10 sobre si se va a hacer clic o no en 
un anuncio. El punto de corte que se elija 
dará resultados diferentes. En otras palabras, se se predice una probabilidad que va a estar vivo es del 0.7 y a todas las personas por encima del 0.5 les asignamos como vivas, entonces este es
un algoritmo de predicción. De la misma forma, si decimos que sólo 
las personas con una probabilidad de 28 se precedirá que estén vivas. Lo cual nos da una predicción diferente
para la misma persona. Los diferentes puntos de corte tendrán 
propiedades diferentes, será mejor para encontrar personas que estén vivas,
o mejor para encontrar personas que estén muertas. Así, si personas usan lo que se llama una curva ROC. Así, la idea es que en el eje x normalmente se representa uno menos la especificidad,
en otras palabras la probilidad de que sea un falso positivo y 
en el eje y se representa la sensibilidad sobre la
probabilidad de un verdadero positivo. Y así lo que se intenta es hacer una curva donde cada punto a lo largo de la misma
corresponda exactamente con un punto de corte. Para un punto de corte concreto, se obtiene una probabilidad de que sea una falso positivo o especificidad, en este punto, 1 menos
la especificidad que es este punto en el eje x. Igualmente, también se obtiene una sensibilidad, este punto de aquí, en
el eje y. De esta forma, se utilizan las curvas ROC para definir lo bueno o malo que es un algoritmo
representando de los diferentes puntos de corte y dibujar una curva a través de estos puntos. Este es un ejemplo de un par de 
algoritmos utilizados en predicciones. Son ejemplos de la pinta que tienen las 
curvas ROC reales. Por ejemplo, si queremos ver, digamos, el 
algoritmo NetChop. Vemos que 1 menos la especificidad es igual a 0.2 o dicho de otra forma, la especificidad es bastante
alta, es 0.8 Se puede buscar ese número y  
moviéndose por la curva la curva en rojo en este caso y que corresponde con una sensibilidad del sólo
0.4 aproximadamente. Es altamente específico pero no muy sensible. De la misma manera si nos movemos por
aquí a la derecha en el eje x. Se obtiene cada vez menos especificidad y 
cada vez más sensibilidad. Así, esta curva indica un poco sobre
las ventajas e inconvenientes. Aunque la curva indique algo sobre ventajas e inconvenientes, realmente lo que queremos saber es qué
algoritmo de predicción es mejor. Una forma utilizada para cuantificar una curva respecto a aotras es simplemente calcular el
área bajo la curva. Dicho de otra forma, como se ve, la curva de rojo aquí, y calculamos todo el área 
bajo la curva, será este área de aquí, y este área cuantifica cómo es de bueno un
algoritmos de predicción en particular. Cuanto mayor es el área mejor predicción se hará, aunque hay ciertos valores estándar a los que prestar
atención para poner en contexto. Si el área bajo la curva -AUC, en inglés,  por Area Under the Curve- es igual a 0.5,  esto es equivalente a un 
algoritmo de predicción  que se sitúa en una línea de 45 grados y que es
básicamente equivalente a adivinar al azar sean verdaderos positivos o 
falsos positivos. Así, 0.5 es bastante malo, por debajos de de 0.5 es todavía peor que adivinar al azar. Peor que lanzar una moneda. Si AUC es 1 es un clasificador perfecto, dicho
de otra forma, obtiene una sensibilidad y especificidad perfectas para cualquier valor del algoritmo de predicción y, por tanto, es el
clasificador perfecto. En general, aunque depende del campo y depende del problema que se esté tratando, un AUC por
encima de 0.8 se puede considerar que es una buena AUC para un algoritmo de
predicción en particular. En general algo a lo que prestar atención es cómo
vemos una curva ROC y decidimos si es una buena o una mala
curva de ROC. Recuerda que la línea recta a 45 grados corresponde
simplmente a adivinar. Dicho de otra forma, la sensibilidad y la
especificidad se emparejan sobre esta línea de predicción. Así un clasificador perfecto va desde 1 menos
la especificidad. Uno menos la especificidad es cero que significa
especificidad perfecta y salta directamentea a una sensibilidad perfecta
y a continuación sigue recto. Esta curva representa a un clasificador perfecto. cuando va directamente hacia esta esquina. Cuanto más cerca esté la gráfica de la esquina
superior izquierda mejor curva ROC. Y cuanto más cerca de la esquina inferior
derecha peor curva ROC. Y así los puntos de la, la gráfica sobre la línea de cuarenta y cinco grados o por debajo 
se consideran bastante malos. Lo más desable es que la curva parezca
que vaya directamente hacia la esquina superior izquierda  lo
más que sea posible. Esta es la forma de interpretar una curva ROC, que utilizaremos
más adelante tomando valores concretos de predictores tanto para resultados binarios como para
datos cuantitativos.