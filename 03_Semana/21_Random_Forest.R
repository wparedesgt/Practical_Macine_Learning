#Bosques aleatorios

#Esta conferencia trata sobre los bosques aleatorios, que puede considerar como una extensión del agrupamiento para árboles de clasificación y regresión. La idea básica es muy similar al ensacado en el sentido de que arrancamos muestras, por lo que tomamos una nueva muestra de nuestros datos observados y nuestro conjunto de datos de entrenamiento. Y luego reconstruimos los árboles de clasificación o regresión en cada una de esas muestras de arranque. La única diferencia es que en cada división, cuando dividimos los datos cada vez en un árbol de clasificación, también iniciamos las variables. En otras palabras, solo se considera un subconjunto de las variables en cada división potencial. Esto genera un conjunto diverso de árboles potenciales que se pueden construir. Entonces, la idea es que cultivemos una gran cantidad de árboles. Y luego votamos o promediamos esos árboles para obtener la predicción de un nuevo resultado. Las ventajas de este enfoque son que es bastante preciso. Y junto con el impulso, es uno de los métodos de predicción más utilizados y más precisos en competencias como Kaggle. Las desventajas son que puede ser bastante lento. Tiene que construir una gran cantidad de árboles. Y puede ser difícil de interpretar, en el sentido de que puede tener una gran cantidad de árboles que se promedian juntos. Y esos árboles representan muestras de bootstrap con nodos de bootstrap que pueden ser un poco complicados de entender. También puede conducir a un poco de sobreajuste, lo que puede complicarse por el hecho de que es muy difícil entender qué árboles conducen a ese sobreajuste, por lo que es muy importante utilizar la validación cruzada al construir bosques aleatorios. Aquí hay un ejemplo de cómo funciona esto en la práctica. Entonces, la idea es que construya una gran cantidad de árboles donde cada árbol se base en una muestra de arranque. Entonces, por ejemplo, este árbol se basa en una submuestra aleatoria de sus datos y esta es una submuestra aleatoria separada de los datos y esta es una submuestra aleatoria separada de los datos. Y luego en cada nodo permitimos que un subconjunto diferente de las variables contribuya potencialmente a las divisiones. Luego, si obtenemos una nueva observación, digamos esta V observación aquí, la ejecutamos a través del árbol uno y termina en esta hoja aquí abajo en la parte inferior de ese árbol. Y aquí se obtiene una predicción particular. Luego, en la siguiente, tomamos la misma observación, la pasamos por el siguiente árbol y baja por una hoja ligeramente diferente, y obtiene un conjunto de predicciones ligeramente diferente aquí. Y finalmente bajamos por el tercer árbol y obtenemos un conjunto de predicciones aún diferente. Luego, lo que hacemos es básicamente promediar esas predicciones juntas para obtener las probabilidades predictivas de cada clase en todos los árboles diferentes. Así que les voy a mostrar un ejemplo de cómo funciona esto. Voy a cargar los datos del iris y usaré el paquete ggplot2 para mostrar algunos gráficos. 

data(iris)
library(ggplot2)
inTrain <- createDataPartition(y=iris$Species,
                               p=0.7, list=FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]




#Voy a crear un conjunto de entrenamiento y un conjunto de prueba de nuevo construyendo el conjunto de datos solo en el conjunto de entrenamiento. En el paquete de cater, uso la función train tal como la he usado para el otro modelo de construcción. Le envío el conjunto de datos de entrenamiento y le digo que el método es igual a rf, que es el método de bosque aleatorio. También le digo que se ajuste al resultado para que sea Especie y que utilice cualquiera de las otras variables predictivas como predictores potenciales. 

library(caret)

modFit <- train(Species~ .,data=training,method="rf",prox=TRUE)

modFit


#Estoy estableciendo prox es igual a verdadero. Verá por qué lo hago en un minuto porque produce un poco de información adicional. Y luego podría usar cuando esté construyendo estos ajustes de modelo. Entonces, aquí me dice que construí el modelo y realicé un remuestreo de bootstrap y luego probé un montón de parámetros de ajuste diferentes. Entonces, el parámetro de ajuste en particular es el número de intentos básicos, o el número de árboles repetidos que se va a construir. Puedo ver un árbol específico en nuestro ajuste de modelo final usando la función get tree. 

library(randomForest)

getTree(modFit$finalModel,k=2)

#Así que apliqué get tree aquí a nuestro modelo final y digo que quiero sacar el segundo árbol. Y así es como se ve el árbol. Entonces, cada una de estas columnas, o cada una de estas filas, corresponde a una división particular. Y así, puede ver cuál es la hija izquierda del árbol, la hija derecha del árbol, en qué variable estamos dividiendo, cuál es el valor donde se divide esa variable y luego cuál será la predicción de esa división particular. También puede utilizar la información de estos centros para ver cuáles serían las predicciones o el centro de las predicciones de la clase. Entonces, lo que he hecho aquí es, estoy mirando dos variables particulares. La longitud del pétalo y el ancho del pétalo. Así que tracé el ancho del pétalo en el eje X y la longitud del pétalo en el eje Y. Luego llego a los centros de clases. Entonces estos serán los centros de los valores predichos. Así que voy a enviar el ajuste del modelo y le voy a dar esta variable de proximidad que pedimos en el ajuste anterior.

#Y cuando lo voy a decir, estamos mirando el conjunto de datos de entrenamiento. Y eso nos da los centros de clase. Entonces, esos centros de clase lo harán, luego podemos trazarlos para ver dónde se encuentran en los datos. Así que ahora, he creado el conjunto de datos de los centros, así como el conjunto de datos de especies. 


irisP <- classCenter(training[,c(3,4)], training$Species, modFit$finalModel$prox)
irisP <- as.data.frame(irisP); irisP$Species <- rownames(irisP)
p <- qplot(Petal.Width, Petal.Length, col=Species,data=training)
p + geom_point(aes(x=Petal.Width,y=Petal.Length,col=Species),size=5,shape=4,data=irisP)


#Y lo que voy a hacer es trazar el ancho del pétalo frente a la longitud del pétalo. Y lo voy a colorear por especie en los datos de entrenamiento. Eso es lo que hice con este comando qplot. Luego voy a agregar puntos además de eso. Ese es el ancho del pétalo y la longitud del pétalo, correspondiente al color de la especie, y ahora lo estoy usando del irsP, que son los centros del conjunto de datos. Entonces, lo que puede ver es que cada punto aquí representa una observación. Y las x muestran el centro de color o los centros de observación para cada una de las diferentes predicciones. 

#Entonces puede ver que predecimos el, cada especie tiene una predicción para estas dos variables que está justo en el centro de la nube de puntos correspondientes a esa especie en particular. A continuación, puede predecir nuevos valores utilizando las funciones de predicción. 

pred <- predict(modFit,testing)
testing$predRight <- pred==testing$Species
table(pred,testing$Species)

#De modo que debe predecir el ajuste de nuestro modelo y el conjunto de datos de prueba. Y aquí, también estoy estableciendo una variable, probando predecir correctamente, que es que obtuvimos la predicción correcta en el conjunto de datos. En otras palabras, nuestra predicción es igual a las especies del conjunto de datos de prueba. Luego puedo hacer una tabla de nuestras predicciones frente a las especies para ver cómo se vería esa variable. Entonces puedo ver, por ejemplo, que me perdí dos valores aquí con mi modelo de bosque aleatorio. 

qplot(Petal.Width,Petal.Length,colour=predRight,data=testing,main="newdata Predictions")


#Pero en general, fue muy precisa en la predicción. Entonces puedo mirar y ver cuál de los dos me perdí. Y quizás, como era de esperar, puede ver los dos que me perdí, marcados en rojo aquí, son los dos que, en el medio, dos clases separadas. Así que recuerden que había una clase arriba en esta esquina derecha, y una clase aquí en el medio, y esta nube, y los dos puntos que están justo en la frontera, fuimos clasificados erróneamente. Por lo tanto, puede usar esto para explorar y ver dónde está funcionando bien su predicción y dónde está funcionando mal. Los bosques aleatorios suelen ser uno de los algoritmos de mejor rendimiento junto con el impulso en cualquier concurso de predicción. A menudo son difíciles de interpretar debido a estos múltiples árboles que estamos ajustando, pero pueden ser muy precisos para una amplia gama de problemas. Puede consultar la función rfcv para asegurarse de que se esté realizando la validación cruzada, pero la función de tren en el cursor también se encarga de eso. Para obtener más información, puede leer sobre bosques aleatorios directamente del inventor aquí. La página de Wikipedia para bosques aleatorios también es bastante buena, y los elementos del aprendizaje estadístico también la cubren.
