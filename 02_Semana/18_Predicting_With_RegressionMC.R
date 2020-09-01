#Predicting With Regression MC

#Esta conferencia trata sobre dos cosas. Primero, se trata de predecir con regresión y usar múltiples covariables, pero lo más importante es explorar un conjunto de datos e intentar identificar qué predictores son los más importantes para incluir en nuestro modelo de predicción. Entonces, nuevamente usaremos los datos de salarios para intentar predecir los salarios de un grupo de hombres que vienen del Atlántico medio. 

#Este conjunto de datos está disponible en el paquete ISLR que puede encontrar aquí. Y proviene del libro Introducción al aprendizaje estadístico. Entonces, lo primero que hacemos es cargar el conjunto de datos, y aquí está el conjunto de datos ISLR. También estamos cargando el paquete ggplot2 para un análisis exploratorio, y estamos cargando el paquete caret. Estamos haciendo predicciones, y vamos a subconjuntos del conjunto de datos con fines de exploración a solo la parte del conjunto de datos que no es la variable que estamos tratando de predecir. 


library(ISLR)
library(ggplot2)
library(caret);
data(Wage)
Wage <- subset(Wage,select=-c(logwage))


#Entonces seleccionamos la variable logarítmica de salario, que es la variable que vamos a predecir en este análisis. Luego podemos ver un resumen del conjunto de datos y, por lo tanto, ya podemos ver algunas características, por ejemplo, vimos antes, que este conjunto de datos tiene solo hombres incluidos en el conjunto de datos y que, por ejemplo, la región está completamente poblada por el Medio Atlántico. 


summary(Wage)

#Entonces, para hacer un poco más de exploración, primero necesitamos enEntrenamientoar subconjuntos en los conjuntos de enEntrenamientoamiento y prueba. Entonces lo usamos con la función Crear partición de datos. Y hacemos un subconjunto en un conjunto de enEntrenamientoamiento y prueba. Y entonces vamos a hacer toda nuestra exploración nuevamente en el set de enEntrenamientoamiento. 


inTrain <- createDataPartition(y=Wage$wage,
                               p=0.7, list=FALSE)

training <- Wage[inTrain,]
testing <- Wage[-inTrain,]

dim(training)
dim(testing)


#Porque cuando estamos construyendo modelos, no usaremos ninguno de los conjuntos de prueba. Solo lo aplicaremos una vez. 

#Entonces, lo primero que puede hacer es un diagrama de características. 

featurePlot(x=training[,c("age","education","jobclass")],
            y = training$wage,
            plot="pairs")

#Entonces, esta gráfica de características dice, muestra un poco sobre cómo las variables están relacionadas entre sí. 

#A veces, esta trama es útil y otras no. En esta trama en particular, es un poco difícil de ver porque todo está tan aplastado, pero si lo hace por su cuenta, al usar esta función, verá que es un poco más fácil de ver. Entonces, por ejemplo, puede ver que parece que para la clase de trabajo parece haber este grupo, parece ser un poco más alto que ese grupo para la clase de trabajo en términos del resultado. Y puede ver que existe, al menos para esta variable de edad, la relación con el resultado. Nuevamente, parece haber algún grupo atípico, dos grupos separados aquí que nos dan alguna indicación de que podríamos usar esa variable para predecir. Entonces, lo primero que podemos hacer es graficar las variables versus la edad del peso. 

qplot(age,wage,data=training)

#Entonces esto es graficar la variable de salario versus la variable edad y puede ver que parece haber algún tipo de tendencia que vimos en las conferencias anteriores, pero también existe este conjunto de puntos que se describen aquí, por lo que la idea es que ese conjunto de puntos que se describe puede haber algo que podamos predecir, pero tendríamos que averiguar qué variable es la que representa ese fragmento. Entonces, una forma en que puede hacerlo es graficar una variable, un predictor, la edad frente al resultado, el salario. Y luego colorea los puntos con otra variable, en este caso, clase de trabajo. 

qplot(age,wage,colour=jobclass,data=training)

#Y puede ver, por ejemplo, que parece que la mayoría de estos puntos aquí arriba son azules en lugar de rosas, lo que significa que provienen del grupo de información. Entonces, esto nos da alguna indicación de que la variable de información podría predecir al menos una fracción de la variabilidad que está en esa clase superior en la parte superior de la gráfica. También puedes colorearlo por educación. Entonces, aquí estoy haciendo una trama q nuevamente.

qplot(age,wage,colour=education,data=training)


#Así que estoy trazando la edad contra el salario. Y le digo que coloree la trama por educación. Y, de nuevo, solo estoy usando el conjunto de enEntrenamientoamiento porque estamos intentando, solo mirar el conjunto de enEntrenamientoamiento para nuestro desarrollo de nuestro modelo. 

#Y pueden ver que el grado avanzado también explica mucha de la variación aquí en el grupo superior. Entonces, alguna combinación de grado y clase de trabajo podría explicar por qué la relación entre edad y salario no es solo una relación perfecta aquí, en una gran nube. Entonces, lo siguiente que podemos hacer es ajustar un modelo lineal con múltiples variables y la idea aquí es, nuevamente, solo estamos ajustando líneas, pero ahora estamos ajustando más de una línea. 


#Entonces, la idea es que tenemos algunos términos de intercepción, por lo que ese es solo el nivel de referencia del salario que podríamos tener, y luego podríamos tener una relación con la edad de la persona, y luego podríamos tener una relación con lo que clase de trabajo en la que se encuentra. Por lo tanto, una forma en que normalmente lo hacemos es ajustando una variable indicadora. Entonces, una variable indicadora es una variable que se denota así en notación matemática. Simplemente dice, si la clase de trabajo para la i-ésima persona es igual a información, esta variable es igual a uno.

#Si la clase de trabajo para la i-ésima persona no es igual a información, entonces esta información es igual a cero, por lo que esto representa la diferencia en los salarios entre las personas con clase de trabajo igual a información versus clase de trabajo igual a no información, cuando , corrija todas las demás variables en el modelo de regresión.

modFit<- train(wage ~ age + jobclass + education,
               method = "lm",data=training)
finMod <- modFit$finalModel
print(modFit)


#También puede hacer esto para la educación, es un camino un poco más complicado porque hay múltiples niveles de educación. Entonces creamos una variable indicadora para cada uno de los diferentes niveles de educación y, por lo tanto, aquí esta es la suma de cuatro variables indicadoras. Y entonces, la variable es igual a uno, si la educación de la persona I es igual al nivel K, esa variable es igual a uno y cero en caso contrario. 

plot(finMod,1,pch=19,cex=0.5,col="#00000010")

#Entonces podemos ajustar el modelo como lo hicimos antes, así que lo hemos hecho, estamos usando la función de Entrenamiento en el Paquete carret. Y de nuevo usamos salario como resultado y luego tilde representa la fórmula de la derecha, se usará para predecir la variable de la izquierda. Entonces usamos la edad, la clase de trabajo y la educación. Entonces, la clase de trabajo y la educación son variables de factor en r y, por defecto, lo hace, ya sabes, crea estas variables indicadoras como lo he mostrado aquí. 

#Entonces, que cuando se ajusta al modelo lo tiene en cuenta automáticamente. Nuevamente, estamos ajustando el modelo en el conjunto de enEntrenamientoamiento y podemos ver el modelo final y ahora puede ver que el modelo final tiene diez predictores aunque solo pusimos tres nombres de variable en la fórmula y la razón es porque esta, variable aquí mismo, obtuve, en realidad recibió más de un predictor en el conjunto de datos debido a la forma en que tuvimos que crear estas funciones de indicador. Entonces, podemos ver algunos gráficos de diagnóstico. 


pred <- predict(modFit, testing)
qplot(wage,pred,colour=year,data=testing)

#Así que esto es muy típico cuando se crean estos modelos de regresión. La idea aquí es que puede trazar los valores ajustados, por lo que estas son las predicciones de nuestro modelo en el conjunto de enEntrenamientoamiento frente a los residuales, esa es la cantidad de variación que queda después de ajustar su modelo. Entonces, lo que te gustaría ver es eso. Esta línea estaría centrada en cero en este eje porque los residuos son la diferencia entre la predicción de nuestro modelo y nuestros valores reales reales que estamos tratando de predecir. Y aquí, puede ver que todavía hay un par de valores atípicos aquí arriba que han sido etiquetados para usted en esta trama. Y entonces, esas variables podrían ser variables que queremos intentar explorar un poco más y ver si podemos identificar otros predictores en nuestro conjunto de datos que puedan explicarlos. La otra cosa que podemos hacer es colorear por variables que no solo se usan en el modelo. Entonces, por ejemplo, aquí estoy trazando nuevamente los valores ajustados de nuestro modelo versus los residuos. Y nuevamente, nos gusta ver esto en la línea cero porque es la diferencia entre nuestros valores ajustados y nuestros valores reales. Entonces, lo que podemos hacer es graficar en esta gráfica, podemos graficarla nuevamente por diferentes variables, en este caso, podemos graficarla por ejemplo, raza. Y entonces puede ver que parece que algunos de estos valores atípicos aquí arriba pueden explicarse por la variable de carrera en el conjunto de datos y, por lo tanto, son otra técnica exploratoria que grafica el modelo ajustado frente a los residuos y luego lo colorea por diferentes variables para identificar tendencias potenciales. Otra cosa que puede ser realmente útil es graficar los residuales ajustados frente al índice. ¿Y qué quiero decir con índice? Entonces, el conjunto de datos viene en un conjunto de filas que obtuvo en un orden particular. Entonces, el índice es solo la fila del conjunto de datos que está viendo. Y el eje y aquí son los residuos. Y para que pueda ver que todos los residuos parecen estar sucediendo, los residuos altos parecen estar sucediendo aquí en el extremo derecho de los números de fila más altos. Y también puede ver una tendencia con respecto a los números de fila y, por lo tanto, siempre que pueda ver una tendencia o un valor atípico como ese con respecto a los números de fila, sugiere que falta una variable en su modelo porque está trazando los residuos aquí. , esa es la diferencia entre los valores reales y los ajustados. Y eso no debería tener ninguna relación con el orden en el que aparecen las variables en su conjunto de datos. A menos, y esto es lo que normalmente descubre cuando ve una tendencia como esta, o valores atípicos como este en un extremo de esta gráfica, que haya una relación con el tiempo, la edad o alguna otra variable continua en la que las filas estén ordenadas. por. Entonces, la otra cosa que puede hacer es graficar la variable de salario. Entonces, esta es la variable de salario en el conjunto de prueba versus los valores predichos en el conjunto de prueba. Entonces, idealmente, estas dos cosas estarían muy cerca una de la otra. Idealmente, tendría esencialmente una línea recta en la línea de 45 grados donde el salario fuera exactamente igual a nuestras predicciones.

#Por supuesto que no es así como siempre funciona. Y luego, en el conjunto de prueba, puede explorar e intentar identificar las tendencias que podría haber pasado por alto. Entonces, por ejemplo, aquí estamos viendo el año en que se recopilaron los datos en el conjunto de prueba. Como una forma de explorar cómo nuestro modelo podría haberse descompuesto. Ahora, algo a tener en cuenta es que si realiza este tipo de exploración en el conjunto de prueba, no podrá volver atrás y actualizar su modelo en el conjunto de enEntrenamientoamiento porque eso sería usar el conjunto de prueba para reconstruir sus predictores. Esto es más como una autopsia de su análisis o una forma de intentar determinar si su análisis funcionó o no. Si desea todas las covariantes en la construcción de su modelo, una cosa que puede hacer es usar esto nuevamente en la función de enEntrenamientoamiento. Puede pasarle un resultado y luego tilde y luego si pone un punto aquí en lugar de poner un conjunto de variables separadas por signos más. Dice predecir con todas las variables del conjunto de datos. Entonces, este es el ajuste del modelo con todas las variables y, por lo tanto, esta es la variable de salario y las predicciones aquí y, de hecho, puede ver que funciona un poco mejor cuando incluye todas las variables en el conjunto de datos. Esto es De forma predeterminada si no desea intentar hacer algún tipo de selección de modelo por adelantado. Por tanto, la regresión lineal suele ser útil en combinación con otros modelos. Es un modelo bastante simple en el sentido de que siempre encaja líneas a través de los datos. Y así puede ser, captura mucha variabilidad si la relación entre los predictores y el resultado es lineal. Si no es lineal, a menudo se pueden perder cosas y se puede combinar mejor con otros modelos. Hablaremos sobre la combinación de modelos más adelante en la clase. El análisis exploratorio de datos puede ser muy útil con los modelos de regresión porque, al igual que las gráficas que hicimos con residuos y demás coloreadas por diferentes características, puede intentar identificar los patrones en el conjunto de datos. Hay más información en estos tres libros, si desea buscar mucho más sobre el modelado de regresión para la predicción.
