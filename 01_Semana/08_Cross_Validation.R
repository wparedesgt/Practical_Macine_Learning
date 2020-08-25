#Croos Validation

#Esta conferencia trata sobre la validación cruzada. Cuál es una de las herramientas más utilizadas, para detectar características relevantes y para construir modelos. 

#Y estimando sus parámetros al hacer aprendizaje automático. Por lo tanto, recuerde el diseño del estudio que las personas utilizan con frecuencia al crear algoritmos de aprendizaje automático y evaluarlos. Toman un conjunto de datos. 

#En este caso, es el diseño del estudio de Netflix. Entonces este es el. 1,000,000, 100,000,000 pares de elementos de usuario, donde sus películas fueron calificadas por usuarios específicos. 

#Y lo dividen en un conjunto de datos de entrenamiento y luego en un conjunto de datos de prueba. Y recuerde que todo el modelo de construcción y evaluación por eso. Las personas que construyen el modelo se basarán en los datos de entrenamiento y, una vez, al final de la competencia, lo aplicarán al conjunto de datos de prueba. 

#Por lo tanto, un problema que surge tan rápidamente es que la precisión en el conjunto de entrenamiento es lo que se llama precisión de resustitución que a menudo es optimista. 

#En otras palabras, siempre estamos eligiendo, probamos un montón de modelos diferentes y elegimos el mejor del conjunto de entrenamiento, y eso siempre estará un poco sintonizado con las peculiaridades de ese conjunto de datos. y puede que no sea la exacta representación de lo que eso. 

#La precisión de la predicción sería una nueva muestra. Entonces, una mejor estimación proviene de un conjunto de datos independientes. Entonces, en este caso, diga la precisión del conjunto de prueba. Pero hay un problema si seguimos usando el conjunto de prueba para evaluar la precisión de la muestra. Entonces, en cierto sentido, el conjunto de prueba se ha convertido en parte del conjunto de entrenamiento, y todavía no tenemos una medida externa, evaluación independiente del error del conjunto de prueba. 

#Entonces, para estimar la precisión del conjunto de prueba, lo que nos gustaría usar es usar algo sobre el conjunto de entrenamiento, para obtener una buena estimación de cuál será la precisión del conjunto de prueba, de modo que podamos construir nuestros modelos en su totalidad utilizando el conjunto de entrenamiento, y solo evaluarlos una vez en el conjunto de prueba, tal como lo requiere el diseño del estudio. 

#Entonces, la forma en que la gente lo hace es con validación cruzada. 

#Entonces, la idea es que tome su conjunto de entrenamiento, solo las muestras de entrenamiento. Y dividimos ese tren, subdividimos ese conjunto de entrenamiento en un entrenamiento y un conjunto de prueba. 

#Luego, construimos un modelo en el conjunto de entrenamiento que es un subconjunto de nuestro conjunto de entrenamiento original. Y evalúe en el conjunto de prueba, que es un subconjunto, nuevamente, de nuestro conjunto de entrenamiento original. Repetimos esto una y otra vez y promediamos los errores estimados. Y eso es algo así como. Estimando lo que sucederá cuando obtengamos un nuevo conjunto de pruebas. 

#De nuevo, la idea es que tomemos el conjunto de entrenamiento y dividimos el conjunto de entrenamiento en sí mismo en conjuntos de entrenamiento y prueba una y otra vez. Siga reconstruyendo nuestros modelos y eligiendo el que funcione mejor en el conjunto de prueba. 

#Esto es útil para seleccionar variables para incluir en el modelo. Entonces, nuevamente, podemos. Ahora, ajuste un montón de modelos diferentes, con varias variables diferentes incluidas, y use el que mejor se adapte a estos conjuntos de pruebas con validación cruzada. Y luego también podemos elegir el tipo de función de predicción que usar, para que podamos probar un montón de algoritmos diferentes. Nuevamente, elija el que mejor funcione en los conjuntos de validación cruzada. O podemos elegir los parámetros en la función de predicción y estimarlos. 

#Nuevamente, podemos hacer todo esto porque, eventualmente, aunque estamos, estamos tr, subdividiendo el conjunto de entrenamiento en un conjunto de entrenamiento y un conjunto de prueba, en realidad dejamos el conjunto de prueba original completamente solo. Donde nunca se usa en este proceso. 

#Entonces, cuando apliquemos nuestro algoritmo de predicción final al conjunto de prueba, seguirá siendo una medición imparcial. De cuál será la precisión de la muestra automática. 

#Entonces, las diferentes formas en que las personas pueden usar los conjuntos de entrenamiento y prueba. Un ejemplo es que hacen un submuestreo aleatorio. Entonces, imagina que cada observación que estamos tratando de predecir está dispuesta a lo largo de este eje aquí. 

#Y el color representa si lo incluimos en el conjunto de entrenamiento o en el conjunto de pruebas, así que nuevamente, estas son solo las muestras de entrenamiento, y lo que podríamos hacer es tomar una submuestra de ellas y llamarlas muestra de prueba. Entonces, en este caso, son las barras de color gris claro aquí, son todas las muestras en esta iteración particular que llamamos muestras de prueba. 

#Luego, construiríamos nuestro predictor en todas las muestras de color gris oscuro. Y así, nuevamente, esto es solo dentro del conjunto de entrenamiento. Tomamos las muestras de color gris oscuro y construimos un modelo, y luego lo aplicamos para predecir las muestras de color gris claro y evaluar su precisión. Podemos hacer esto para varias submuestras aleatorias diferentes. 

#Así que este es un ra, un muestreo aleatorio. Y luego esta segunda fila es el segundo muestreo aleatorio. Y esta tercera fila es el tercer muestreo aleatorio. Haga eso una y otra vez, y luego promedie cuáles serán los errores. Otro enfoque que se usa comúnmente es lo que se llama validación cruzada de K-fold. Entonces, la idea aquí es dividir nuestra configuración de datos en k conjuntos de datos de igual tamaño.

