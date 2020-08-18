#04_In_Out_Sample_Errors

#Esta conferencia trata sobre errores de muestra y fuera de muestra. Este es uno de los conceptos más fundamentales con los que nos ocupamos en el aprendizaje automático y la predicción, por lo que vale la pena comprender el concepto con un ejemplo muy simple. 

#Entonces, en los errores de muestra, el error que se obtiene en los mismos datos que usó para entrenar su predictor. En ocasiones, esto se denomina error de resustitución en la literatura sobre aprendizaje automático. Y en la muestra el error siempre va a ser un poco optimista, por lo que es el error que obtendría de una nueva muestra. 

#Y la razón es que, en su muestra específica, a veces su algoritmo de predicción se sintonizará un poco con el ruido que recopiló en ese conjunto de datos en particular. Entonces, cuando obtenga un nuevo conjunto de datos, habrá un ruido diferente, por lo que la precisión disminuirá un poco. 

#Entonces, lo que hacemos es observar esto fuera de la tasa de error de muestra, esto a veces se denomina error de generalización en el aprendizaje automático. Entonces, la idea es que una vez construyamos un modelo a partir de una muestra de datos que hemos recopilado. 

#Es posible que deseemos probarlo en una nueva muestra, en una muestra recopilada por una persona diferente o en un momento diferente, para poder ver cuál es el tipo de expectativa realista de qué tan bien funcionará el algoritmo de ejecución de la máquina en nuevos datos . Por eso, casi siempre, lo que le importa es los errores de muestra. 

#Entonces, si ve una tasa de error informada para la fecha. La tasa de error informada solo sobre los datos donde se construyó el algoritmo de aprendizaje automático, es muy optimista y probablemente no reflejará cómo funcionará el modelo en la práctica real. 

#El error de muestra siempre es menor que el error de muestra, por lo que es algo a tener en cuenta. Y la razón es el sobreajuste. Básicamente, nuevamente, está haciendo coincidir su algoritmo con los datos que tiene a mano, y lo está haciendo coincidir demasiado bien. 

#Por lo tanto, a veces desea poder renunciar a un poco de precisión en la muestra que tiene para poder obtener precisión en nuevos conjuntos de datos. En otras palabras, cuando el ruido es un poco diferente, su algoritmo será robusto. 

#Así que solo para mostrarte un ejemplo realmente simple, pensé en mostrarte errores de muestra versus errores de muestra con una especie de ejemplo trivial. Así que esto es lo que hice, tomé esto nuevamente. Fui al paquete kernlab y miré el conjunto de datos de spam. Recuerde que fue el conjunto de datos donde recopilamos información sobre mensajes de spam, o mensajes de robots y cosas así, y mensajes HAM, mensajes que realmente nos interesan. 

#Y lo que hago es tomar una muestra muy pequeña de ese conjunto de datos de spam. Solo tomo diez mensajes y lo que hago es básicamente mirar si ves muchas letras mayúsculas. Básicamente, estoy mirando el número promedio de letras mayúsculas que observas en un correo electrónico en particular. 

#Y entonces he trazado los primeros diez ejemplos aquí frente a su índice. Y así en rojo están todos los mensajes de spam, en negro están todos los mensajes de HAM. Y entonces puede ver, por ejemplo, que algunos de los mensajes de spam como este, tienen muchas más letras mayúsculas que los que son mensajes de radioaficionado. Eso tiene sentido intuitivamente. Por lo tanto, es posible que deseemos construir un predictor, basado en el número promedio de letras mayúsculas, para saber si es un mensaje de spam o un mensaje de radioaficionado. 

#Entonces, una cosa que podríamos hacer es construir un predictor que diga si tiene muchas mayúsculas, entonces es un mensaje de spam, y si no lo tiene, entonces no es un mensaje de spam. 

#Y así es como se vería esta regla, podría decir que si está por encima de 2,7 por capital promedio, lo llamaremos spam, si está por debajo de 2,40, está clasificado como no spam. Y luego, una cosa más, una cosa que podemos hacer es realmente intentar entrenar este algoritmo muy, muy bien para predecir perfectamente en este conjunto de datos. 

#Entonces, si volvemos a estos, este gráfico de los diferentes valores, puede ver que hay un mensaje de spam aquí abajo en la esquina inferior derecha, que es un poco más bajo que el valor más alto de no spam en términos de este capital. promedio. Así que podríamos construir un algoritmo de predicción que capturaría también ese valor de spam. 

#Entonces, lo que haríamos es crear una regla aquí que solo seleccione ese valor en el conjunto de entrenamiento. Dice que si tiene entre 2,4 y 2,45, también se le llama spam. Y eso está diseñado básicamente para hacer que la precisión del conjunto de entrenamiento sea perfecta. Y puede ver si aplicamos esta regla al conjunto de entrenamiento, de hecho obtenemos una precisión perfecta. 

#Entonces, si no eres spam, te clasificamos perfectamente como no spam, y si eres spam, te clasificamos perfectamente como spam. Una regla alternativa no entrenaría tan estrechamente con el conjunto de entrenamiento, pero aún usaría el principio básico de si tiene una gran cantidad de letras mayúsculas, entonces su mensaje de spam, por lo que esta regla podría verse así.

#Si está por encima de 2,40, su límite, su mensaje de spam, si es menor o igual a 2,40, entonces no es un mensaje de spam. Entonces, esta regla en el conjunto de entrenamiento perdería ese valor. 

#En otras palabras, podría tener una predicción de no spam para ese único mensaje de spam que fue un poco más bajo en nuestro conjunto de entrenamiento. Entonces, en general, esto parece en ese conjunto de entrenamiento que la precisión es un poco menor para esta regla y es un poco más simplista. Entonces podemos aplicarlo a todos los datos de spam. 

#En otras palabras, aplíquelo a todos los valores, no solo a los valores que teníamos en el pequeño conjunto de entrenamiento, y estos son los resultados que obtendría. Así que esta es una tabla de nuestras predicciones en las filas aquí, y en las columnas son los valores reales. Y para que pueda ver la cantidad de errores que cometemos, son los errores aquí que están en los elementos fuera de la diagonal de esta pequeña matriz que creamos. 

#Así que esa es la cantidad de errores que cometimos, cometimos. Entonces, lo que podemos ver es que en realidad podemos ver el número promedio de veces que acertaron usando nuestras reglas más complicadas. Entonces, esta es solo la suma de las veces que nuestra predicción es igual al valor real en el conjunto de datos de spam. 

#Y eso sucede 3.366 veces en este conjunto de datos. Y luego también podríamos mirar la regla más simplificada, la regla en la que solo usamos un umbral, y también mirar el número de veces que es igual al tipo de spam real. 

#Y puede ver unas 30 veces más, de hecho obtenemos la respuesta correcta cuando usamos esta regla más simplificada. Entonces, ¿cuál es la razón por la que la regla simplificada funciona mejor que la regla más complicada? Y la razón por la que es demasiado adecuada. Entonces, en cada conjunto de datos tenemos dos partes, tenemos el componente de señal, esa es la parte que estamos tratando de usar para predecir. 

#Y luego tenemos ruido, por lo que es solo una variación aleatoria en el conjunto de datos que obtenemos, porque los datos se miden de manera ruidosa. Entonces, el objetivo de un predictor es encontrar una señal e ignorar el ruido. 

#Y en cualquier conjunto de datos pequeño, siempre puede crear un predictor perfecto en la muestra, tal como lo hicimos con ese conjunto de datos de spam. Siempre puede dividir el espacio de predicción en este, en este pequeño conjunto de datos, para capturar cada peculiaridad de ese conjunto de datos. 

#Pero cuando haces eso, capturas tanto la señal como el ruido. Entonces, por ejemplo, en ese conjunto de entrenamiento había un valor de raíz que tiene un promedio de capital ligeramente más bajo que algunos de los valores que no son de rango. Pero eso fue solo porque elegimos al azar un conjunto de datos donde eso era cierto, donde ese valor era bajo. De modo que ese predictor no funcionará necesariamente como bien en muestras nuevas, porque lo hemos ajustado demasiado al conjunto de entrenamiento observado. 

#Entonces, esta lectura tiene dos propósitos. Uno es presentarle la idea de errores dentro y fuera de muestra. Los errores en la muestra son errores en los entrenamientos con los que realmente construimos, y los errores fuera de la muestra son los errores en el conjunto de datos que no se usaron para construir el predictor de entrenamiento. Y también les presentamos esta idea de sobreajuste. 

#En eso queremos construir modelos que sean lo suficientemente simples y robustos como para que en realidad no capturen el ruido, mientras que capturan toda la señal.
