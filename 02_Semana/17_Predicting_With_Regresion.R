#Predicting With Regresion

#Esta conferencia trata sobre una de las formas más directas y sencillas de realizar el aprendizaje automático mediante el modelado de regresión. Si ha tomado la clase de modelado de regresión en la especialización de ciencia de datos, gran parte de este material le resultará familiar. 

#Solo lo estamos usando al servicio de realizar predicciones. Entonces, la idea clave aquí es que vamos a ajustar un modelo de regresión simple. Si no sabes qué es eso, no te preocupes, lo explicaré brevemente en el resto de la conferencia. Pero la idea es que básicamente vamos a ajustar una línea a un conjunto de datos. Entonces esa línea consistirá básicamente en multiplicar un conjunto de coeficientes por cada uno de los diferentes predictores. 

#Y entonces obtenemos nuevos predictores o nueva covarianza y los multiplicamos por los coeficientes que estimamos con nuestro modelo de predicción y luego obtenemos una nueva predicción para un nuevo valor.

#Esto es útil cuando ese modelo lineal es casi correcto, en otras palabras. Cuando la relación entre las variables se puede modelar de forma lineal, es decir, en función de líneas, esta es una forma útil de predecir. Es muy fácil de implementar y también es bastante fácil de interpretar en comparación con muchos algoritmos de aprendizaje automático en el sentido de que está ajustando un conjunto de líneas a un conjunto de datos y las líneas son relativamente fáciles de interpretar. 

#Puede tener un rendimiento deficiente en entornos no lineales. Por lo tanto, generalmente se usa en combinación con otros algoritmos de aprendizaje automático en ejemplos complicados. Entonces, usaremos datos sobre erupciones de géiseres. Y entonces, los géiseres tienen un tiempo de espera entre sus diferentes erupciones y hay una cantidad de tiempo durante la cual realmente hacen erupción, por lo que hay un conjunto de datos que podemos cargar muy fácilmente que contiene información sobre erupciones durante un período de tiempo. géiser particular, Old Faithful en los Estados Unidos. Famoso géiser. Entonces podemos cargar el paquete de intercalación y cargar los datos para estas erupciones. Y voy a sembrar la semilla para que se puedan reproducir todos los análisis que voy a realizar después de esto. Luego creo un conjunto de Entrenamiento y un conjunto de prueba como de costumbre. Creo un conjunto de Entrenamiento porque vamos a construir modelos. Solo en el conjunto de Entrenamiento y luego aplicándolos en el conjunto de prueba. Entonces, si miras el conjunto de datos, si miras el conjunto de Entrenamiento, puedes ver que solo tenemos dos variables, así que es un ejemplo muy fácil. 


library(caret)
data(faithful)
set.seed(333)

inTrain <- createDataPartition(y=faithful$waiting,
                               p=0.5, list=FALSE)

trainFaith <- faithful[inTrain,]
testFaith <- faithful[-inTrain,]
head(trainFaith)

#Tenemos un tiempo de erupción y un tiempo de espera. Entonces, el tiempo de espera es el tiempo entre erupciones y las erupciones es el tiempo que el géiser estuvo en erupción. Si hago un gráfico de estas dos variables, veo el tiempo de espera aquí en el eje x. Y la duración aquí en el eje y. 

plot(trainFaith$waiting,trainFaith$eruptions,pch=19,col="blue",xlab="Waiting",ylab="Duration")


#Puede ver que hay una relación más o menos lineal. O puede imaginarse trazando una línea a través de esto que predice relativamente bien el tiempo de duración del tiempo de espera. Entonces, podemos hacer eso básicamente ajustando una fórmula que sea solo una, una línea, así que recuerde que la fórmula para una línea será la duración de la erupción aquí es igual a una constante o inter, lo que la gente llama un término de intercepción, más otra constante multiplicada por el tiempo de espera más el término de error. 


#Entonces. Como vio en la diapositiva anterior, incluso si una línea que pasa por el medio de los datos parece una aproximación razonable a la relación, obviamente no la hay, los puntos no están exactamente en una línea. Y es por eso que permitimos algún error en nuestro modelo. Los modelos de error, todo lo que no teníamos, no lo medimos, no entendíamos de la relación. 

#Y entonces podemos usar el comando lm en r para llenar el modelo lineal. Entonces, relata las erupciones, esa será la variable de resultado que estás tratando de predecir, la tilde dice que la vamos a predecir como una función de todo en este lado del. El código de aquí, vamos a utilizar los datos en espera. Vamos a construir ese modelo usando los datos del conjunto de Entrenamiento, así que si hacemos eso, si lo hacemos, obtenemos un resumen de la salida y el punto, la parte a mirar, asume la predicción aquí. 


lm1 <- lm(eruptions ~ waiting,data=trainFaith)
summary(lm1)


#¿Son estas estimaciones entonces la estimación aquí es solo la intersección que es la constante? Entonces eso es B0, en esta fórmula, y el tiempo de espera estimado aquí es B1 en esta fórmula, y si obtenemos una nueva predicción, simplemente agregamos menos 1.79. Más 0.073 veces cualquiera que sea nuestro nuevo tiempo de espera y eso produce nuestra nueva predicción para la duración esperada. Así que así es como se ve el ajuste del modelo y, básicamente, estoy de nuevo, estoy trazando el Entrenamiento, los tiempos de espera versus las erupciones y luego trazo los valores ajustados y la forma en que lo hago es, puedo extraer eso del objeto de modelo lineal nar con un LM1$fitted. Ajustado me dará los valores ajustados y luego lo graficará contra la variable predictora que utilicé para predecir los valores. Así que aquí está el tiempo de espera representado frente a la duración.

plot(trainFaith$waiting,trainFaith$eruptions,pch=19,col="blue",xlab="Waiting",ylab="Duration")
lines(trainFaith$waiting,lm1$fitted,lwd=3)

#Los puntos provienen de este primer comando de trazado y luego de la línea que se ajusta aquí, la línea negra. Altavoz 1: proviene de este comando de líneas que agrega una línea de valores difuminados. Entonces, como vimos anteriormente, puede ver que hay una línea que es una representación razonablemente buena de la relación entre estas dos variables. 

#Obviamente no es perfecto, los puntos no se encuentran exactamente en la línea, pero es una captura razonablemente buena del conjunto de datos principal. 

#Entonces, para predecir una nueva variable, simplemente tomamos nuevamente, como dije, el valor estimado para b0 y el valor estimado para b1. Por lo general, denotamos a aquellos con sombreritos por encima de los valores. Y luego simplemente los multiplicamos usando la fórmula de la página anterior. Recuerde que no tenemos, en esta fórmula, no tenemos un término de error. Debido a que no sabemos cuál es el término de error para este valor en particular, solo usamos las partes que podemos estimar. Entonces, para obtener esos valores, extraiga esos valores del objeto del modelo lineal, puede usar el coef. Comando que le da los coeficientes que es el nombre que usamos para esas dos variables, las estimaciones para esas dos variables, entonces coeflm11 le dará la intersección, un valor beta hat cero, y put lm2 le dará beta hat 1 a valor. Adecuado para el tiempo de espera. Y luego, supongamos que tenemos un nuevo tiempo de espera de 80. 

coef(lm1)[1] + coef(lm1)[2]*80
newdata <- data.frame(waiting=80)
predict(lm1,newdata)


#Entonces, la predicción de que saldremos es 4,119 como el tiempo de duración de la erupción. Entonces, otra cosa que podemos hacer es predecir usando ese objeto LM. En realidad, no es necesario, cada vez, extraer los coeficientes y multiplicarlos. Entonces, si creamos un nuevo conjunto de datos. Que es un marco de datos que tiene un nuevo valor que queremos predecir, entonces decimos que tenemos un tiempo de espera igual a 80, entonces si escribo predecir y le paso el modelo ajustado del conjunto de Entrenamiento y el nuevo conjunto de datos , nuevo marco de datos que creamos. Me dará la predicción del nuevo valor. Y coincide, por lo que está usando la misma fórmula en este comando de predicción, que usaría si realmente calculara la predicción a mano. Así que otra cosa a tener en cuenta es. Entonces, recuerde, construimos este modelo en el conjunto de Entrenamiento, como siempre lo hacemos. Y queremos ver cómo funciona en el equipo de prueba. Así que aquí, he separado los datos en dos conjuntos separados, los conjuntos de Entrenamiento y prueba e hice dos gráficos. 

par(mfrow=c(1,2))
plot(trainFaith$waiting,trainFaith$eruptions,pch=19,col="blue",xlab="Waiting",ylab="Duration")
lines(trainFaith$waiting,predict(lm1),lwd=3)
plot(testFaith$waiting,testFaith$eruptions,pch=19,col="blue",xlab="Waiting",ylab="Duration")
lines(testFaith$waiting,predict(lm1,newdata=testFaith),lwd=3)


#A la izquierda hay un gráfico de los datos de Entrenamiento y a la derecha hay un gráfico de los datos de la prueba, por lo que los datos de Entrenamiento grafican el tiempo de espera frente a la duración y luego coloco el modelo que se ajusta y es un modelo razonablemente bueno. Eso es de esperar porque sí. Son los datos exactos que usamos para construir el modelo. Luego también trazo el conjunto de datos de prueba y aquí, esta es la línea que obtienes, las predicciones que obtienes del modelo construido en el conjunto de Entrenamiento. 

#Por lo tanto, puede ver que ya no se ajusta perfectamente a los datos como lo hizo en el conjunto de Entrenamiento. Está un poco inclinado por debajo de la audición, pero eso es de esperar porque el conjunto de prueba es un conjunto de datos ligeramente diferente, pero como puede ver, todavía captura la tendencia general o la parte general de la variación que se puede explicar por el tiempo de espera. 

#Lo siguiente que debe hacer es obtener los errores del conjunto de Entrenamiento y prueba. Entonces, para obtener el error del conjunto de Entrenamiento, obtenemos los valores ajustados, lm1$fitted, recuerde que lm1 fue el objeto que realmente ajustamos para ajustar el modelo. 

# Calculate RMSE on training
sqrt(sum((lm1$fitted-trainFaith$eruptions)^2))

# Calculate RMSE on test
sqrt(sum((predict(lm1,newdata=testFaith)-testFaith$eruptions)^2))


#Y los valores ajustados fueron las predicciones que obtenemos en el conjunto de Entrenamiento. Luego, podemos restar los valores reales de la duración de la erupción en el conjunto de Entrenamiento. Cuadrálos, súmalos y saca la raíz cuadrada y eso nos da la raíz del error cuadrático medio. Si recuerdas eso de nuestra conferencia sobre los tipos de errores que podríamos tener. Básicamente, mide qué tan cerca están los valores ajustados. A los valores reales. Y obtenemos un valor de 5.752. También podemos calcular la raíz del error cuadrático medio en el conjunto de prueba. Y entonces, la forma en que lo hacemos es, calculamos, predecimos nuevamente ahora, usando este LM fo, LM objeto que podemos encajar en el conjunto de Entrenamiento. Pero ahora le pasamos el nuevo conjunto de datos, el conjunto de datos de prueba. Así que ahora esto es predecir valores en el conjunto de datos de prueba y restamos nuestros valores reales ya que sabemos cuáles son en el conjunto de datos de prueba. Cuadrarlos y resumirlos. Y dado que no usamos el conjunto de prueba en absoluto cuando construimos nuestro algoritmo. Esta es una estimación más realista del error cuadrático medio que obtendría con un nuevo conjunto de datos en comparación con el valor que obtuvimos en el conjunto de Entrenamiento. Y como siempre, el error del conjunto de datos de prueba es casi siempre mayor que el error del conjunto de Entrenamiento, porque. Nuevamente, nos estamos moviendo a un nuevo conjunto de valores que no se usaron para calcular el modelo, por lo que representa el error agregado, o el error y la variabilidad que obtiene cuando se mueve a un nuevo conjunto de datos fuera del error de muestra.


#La otra cosa que puede hacer que es un buen componente del uso de modelos lineales para la predicción es que puede calcular los intervalos de predicción. Entonces, nuevamente, aquí estoy simplemente calculando, calculando un nuevo conjunto de predicciones. 



pred1 <- predict(lm1,newdata=testFaith,interval="prediction")
ord <- order(testFaith$waiting)
plot(testFaith$waiting,testFaith$eruptions,pch=19,col="blue")

matlines(testFaith$waiting[ord],pred1[ord,],type="l",,col=c(1,2,2),lty = c(1,1,1), lwd=3)

#Para el conjunto de datos de prueba utilizando nuestro modelo lineal que hemos construido sobre el conjunto de datos de Entrenamiento. Y digo que también quiero un intervalo de predicción y, por lo tanto, ese es solo un argumento que he pasado a la función de predicción y luego si ordeno los valores para el conjunto de datos de prueba y trazo la prueba. Tiempos de espera versus tiempos de erupción. También puedo agregar líneas que muestran no solo mis predicciones, eso es lo que tengo aquí en esta línea negra que muestra los valores predictivos. Pero también puedo mostrar un intervalo que es el intervalo que captura. 

#Porcentaje de donde estamos en la región donde esperamos que caigan los valores predichos, por lo que esperamos que la mayoría de los valores predichos caigan entre estas dos líneas rojas si nuestro modelo lineal es correcto. Y entonces esto. Le muestra un poco sobre el rango de valores posibles que podríamos predecir. No solo una predicción única, que puede ser útil para darte una idea de qué tan bien funcionará tu modelo en predicciones nuevas. Le dirá cuál es el rango de posibles predicciones que podría obtener. Puede hacer lo mismo en el paquete de intercalación. 


modFit <- train(eruptions ~ waiting,data=trainFaith,method="lm")
summary(modFit$finalModel)
plot(modFit$finalModel)

#Nuevamente, el paquete de intercalaciones, le he mostrado cómo hacerlo ahora a mano, pero también puede hacerlo muy fácilmente con un paquete de intercalaciones. Utilizo la función de Entrenamiento en el paquete de intercalación para construir el modelo. Y de nuevo yo, las erupciones son la salida, el resultado, el tiempo de espera es el predictor y están separados por esta tilde. Y luego digo en qué conjunto de datos quiero construir el modelo y para el método, lo digo, Modelado lineal. Entonces, si hace un resumen de ese ajuste final del modelo, el modelo final es la parte de los objetos modFit que fue creado por Train que le indica el modelo final exacto que se está utilizando para la predicción. 

#Y nuevamente, se ve muy similar al modelo que ajustamos a mano, es menos 1.79 para la intersección y 0.07 para el tiempo de espera. Entonces, el modelado de regresión también se puede hacer con múltiples covariantes, y tendremos una conferencia sobre eso. Pero también puede combinarlo con todas las demás metodologías de predicción y aprendizaje automático. Una vez más, es una especie de buen método de uso rápido y sucio. Falla. Obtener un error de clasificación errónea más alto cuando la relación no es necesariamente lineal. Se tratan muchas predicciones, el modelo de regresión se cubre en estos libros y sería un buen lugar para ir si desea obtener más información.