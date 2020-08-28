#Basic Pre Processing

#Esta lección trata sobre el preprocesamiento de variables predictoras. Y, como vimos en conferencias anteriores, debe trazar las variables por adelantado para poder ver si hay algún tipo de comportamiento extraño de esas variables. 

#Y a veces, los predictores se verán muy extraños o la distribución será muy extraña, y es posible que deba transformarlos para que sean más útiles para los algoritmos de predicción. Esto es particularmente cierto cuando utiliza algoritmos basados en modelos. 

#Como análisis de discriminación lineal, Bayes ingenuo, regresión lineal y cosas por el estilo. Hablaremos de todos esos métodos más adelante en la clase, pero solo tenga en cuenta que el preprocesamiento puede ser más útil a menudo cuando usa enfoques basados en modelos que cuando usa enfoques más no paramétricos. 

#Entonces, ¿por qué preprocesar? Aquí de nuevo, estoy cargando el último, el paquete de intercalación, y estoy aprendiendo el paquete kernlab y luego adjunto los datos de spam. 

library(caret)
library(kernlab)

data(spam)

inTrain <- createDataPartition(y=spam$type,
                               p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
hist(training$capitalAve,main="",xlab="ave. capital run length")


#Una vez más, como mencioné anteriormente, cuando decide cómo preprocesar los datos o cómo explorar los datos, solo miramos el conjunto de Entrenamiento. Por lo tanto, dividimos los datos de inmediato en datos de Entrenamiento y prueba y dejamos los datos de prueba a un lado para más adelante. 

#Ahora, si miro una de las variables, nuevamente, se trata de datos no deseados, por lo que estamos tratando de predecir si los datos son correo no deseado o si son buenos correos electrónicos, HAM. Entonces, las variables son cosas como ¿cuántas mayúsculas vemos seguidas? ¿Cuál es la duración de la tirada del número de mayúsculas seguidas en un correo electrónico? Si toma, haga un histograma de esos valores, verá, por ejemplo,. Que casi todos los enlaces de ejecución son muy pequeños, pero hay algunos que son mucho, mucho más grandes. 

#Este es un ejemplo de una variable que está muy sesgada y, por lo tanto, es muy difícil de manejar en los predictores basados en modelos, por lo que es posible que desee preprocesar. 

#Entonces, si toma la media de esta variable, es aproximadamente 4.7. Pero la desviación estándar es enorme, es mucho mayor. 

mean(training$capitalAve)
sd(training$capitalAve)

#Entonces, es una variable mucho más variable. 

#Entonces, lo que podría querer hacer es hacer algún tipo de preprocesamiento, para que los algoritmos de aprendizaje automático no se dejen engañar por el hecho de que está sesgado y es altamente variable. Entonces, una forma en que puede hacer esto es básicamente estandarizando las variables, y la forma habitual de estandarizar las variables es tomar los valores de las variables y restar su media. 

trainCapAve <- training$capitalAve
trainCapAveS <- (trainCapAve  - mean(trainCapAve))/sd(trainCapAve) 
mean(trainCapAveS)
sd(trainCapAveS)

#Luego ponga, de modo que tome el valor, reste la media y luego divida toda esa cantidad por la desviación estándar. Cuando haga eso, la media de las variables que tiene será cero. Y la desviación estándar será uno, por lo que reducirá mucha de esa variabilidad que vimos anteriormente. Y estandarizará un poco la variable. Una cosa a tener en cuenta es, nuevamente, cuando aplicamos un algoritmo de predicción al conjunto de prueba. 

#Debemos ser conscientes de que solo podemos utilizar parámetros que estimamos en el conjunto de Entrenamiento. En otras palabras, cuando aplicamos esta misma estandarización al conjunto de prueba, tenemos que usar la media del conjunto de Entrenamiento y la desviación estándar del conjunto de Entrenamiento para estandarizar los valores del conjunto de prueba. ¿Qué significa esto? Significa que cuando realiza la estandarización, la media no será exactamente cero en el conjunto de prueba. Y la desviación estándar no será exactamente una, porque hemos estandarizado los parámetros estimados en el conjunto de Entrenamiento, pero es de esperar que estén cerca de esos valores aunque no estamos usando los valores exactos construidos en el conjunto de prueba. 

#También puede usar la función preProcess para realizar mucha estandarización por usted. 

preObj <- preProcess(training[,-58],method=c("center","scale"))
trainCapAveS <- predict(preObj,training[,-58])$capitalAve
mean(trainCapAveS)
sd(trainCapAveS)


#Entonces, la función de preproceso es una función que está integrada en el paquete de intercalación. Y aquí les paso todas las variables de Entrenamiento excepto una, excepto la 58 en el conjunto de datos, que es el resultado real que nos importa. Y le estoy diciendo que centre cada variable y escale cada variable. Eso hará la misma transformación de la que hablamos anteriormente a los datos, donde resta la media y la divide por la desviación estándar. Y puede verlo observando la media del valor de capitalAve, como hicimos antes. Y puede ver que después de usar la función preProcess, la media es cero y la desviación estándar es uno. Por lo tanto, el preproceso se puede usar para realizar muchas de las herramientas de preprocesamiento, técnicas que solía hacer a mano. 

#La otra cosa que puede hacer es usar el objeto que se creó usando la técnica de preprocesamiento para aplicar ese mismo preprocesamiento al conjunto de prueba. Entonces, aquí este preObj fue el objeto usado en la diapositiva anterior. 

#Ese fue el objeto que creamos al preprocesar el conjunto de Entrenamiento. Entonces, mirando ese valor podemos ver, ahora, si pasamos el conjunto de pruebas a la función de predicción.

#Entonces, lo que hará es tomar los valores calculados en el objeto de preprocesamiento y aplicarlos al objeto del conjunto de prueba, y así, nuevamente, en los datos del conjunto de pruebas previos y posteriores al proceso, la media no será exactamente igual a cero para cualquier variable y la desviación estándar no será exactamente igual a uno, pero estarán cerca, porque usamos los valores del conjunto de Entrenamiento para normalizar. 

testCapAveS <- predict(preObj,testing[,-58])$capitalAve
mean(testCapAveS)
sd(testCapAveS)

#También puede pasar los comandos preprocesados directamente a la función de Entrenamiento en el signo de intercalación, como argumento. 

#Entonces, por ejemplo, aquí podemos enviar al argumento preprocesado de la función de Entrenamiento, el comando, el centro de parámetros y la escala, y eso centrará y escalará todos los predictores, antes de usar esos predictores en el modelo de predicción. La otra cosa que puede hacer es realizar otros tipos de transformación. Por lo tanto, centrar y escalar es un enfoque, y eso solucionará algunos de los problemas que vemos en estos datos. Puede eliminar predictores muy sesgados o predictores que tienen una variabilidad muy alta. 

set.seed(32343)
modelFit <- train(type ~.,data=training,
                  preProcess=c("center","scale"),method="glm")
modelFit



#La otra cosa que puede hacer es usar otros tipos diferentes de transformaciones, un ejemplo son las transformaciones de box cox. Las transformaciones de Box Cox son un conjunto de transformaciones que toman datos continuos e intentan que se vean como datos normales y lo hacen estimando un conjunto específico de parámetros utilizando la máxima probabilidad. 

#Entonces, si uso la función de preproceso y le digo que realice transformaciones de box cox en cada una de las variables, entonces predigo. Cada una de las diferentes variables que utilizan ese objeto de preproceso en el conjunto de Entrenamiento. Puedo mirar los valores promedio de capital y puedo hacer un histograma de esos valores. 


preObj <- preProcess(training[,-58],method=c("BoxCox"))
trainCapAveS <- predict(preObj,training[,-58])$capitalAve
par(mfrow=c(1,2)); hist(trainCapAveS); qqnorm(trainCapAveS)

#Y ahora, recuerde que en el gráfico original del histograma, parecían una gran pila en cero y algunos valores eran grandes. Y ahora ves algo que se parece un poco más a una distribución normal, un poco más a una curva de campana aquí. 

#Notará que no soluciona todos los problemas. Entonces, por ejemplo, todavía hay un conjunto de valores de pila aquí en cero y en el gráfico Q-Q, por lo que esto muestra los cuantiles teóricos de la distribución normal. En comparación con los quintiles de muestra que calculamos para nuestros datos de preproceso, puede ver que no se alinean perfectamente y, en particular, hay este fragmento de nuevo aquí en la parte inferior, estos no se encuentran en una línea perfecta de 45 grados, y eso es porque si tiene un grupo de valores que son exactamente iguales a cero, esta es una transformación continua y no se ocupa de los valores que se repiten. Por lo tanto, no soluciona muchos de los problemas que sucederían, que ocurrirían con el uso de una variable que está muy sesgada. 

#Entonces, lo que podemos hacer es también imputar datos para estos conjuntos de datos. Entonces, es muy común que falten datos. Y cuando utiliza datos faltantes en los conjuntos de datos, los algoritmos de predicción suelen fallar. 

#Los algoritmos de predicción están diseñados para no manejar datos faltantes en la mayoría de los casos. Entonces, si tiene algunos datos faltantes. Puede imputarlos usando algo llamado imputación de k vecino más cercano. Entonces aquí volvemos a establecer la semilla, porque este es un algoritmo aleatorio y queremos obtener resultados reproducibles.

set.seed(13343)
library(RANN)
# Make some values NA
training$capAve <- training$capitalAve
selectNA <- rbinom(dim(training)[1],size=1,prob=0.05)==1
training$capAve[selectNA] <- NA

# Impute and standardize
preObj <- preProcess(training[,-58],method="knnImpute")
capAve <- predict(preObj,training[,-58])$capAve

# Standardize true values
capAveTruth <- training$capitalAve
capAveTruth <- (capAveTruth-mean(capAveTruth))/sd(capAveTruth)


#Y tomo solo estos valores promedio de capital y creo una nueva variable llamada CapAve. Luego genero aleatoriamente un montón de valores usando la función rbinom para establecer igual a NA y configuro esos valores para que falten. Entonces, ahora esta variable capAve es exactamente como la capitalAve valiosa solo que tiene un subconjunto de valores que faltan. Entonces, ahora quiero saber cómo manejaría esos valores faltantes. Hice esto para que pudiéramos ver cómo podíamos manejar los valores faltantes en un conjunto de datos. Entonces, una cosa que va a hacer es obtener noticias como función preProcess y decirle que haga la imputación de k vecinos más cercanos. El cálculo de K-vecinos más cercanos calcule k. Entonces, si k es igual a diez, entonces los 10 vectores de datos más cercanos que se parecen más al vector de datos con el valor faltante, y promediar los valores de la variable que falta y calcularlos en esa posición. Entonces, si hacemos eso, entonces podemos predecir en nuestro conjunto de Entrenamiento, todos los nuevos valores, incluidos los que han sido imputados con el algoritmo de imputación k-más cercano. Luego podemos estandarizar esos valores, usando el mismo procedimiento de estandarización que hicimos antes, restando la media y dividiendo por la desviación estándar. Una cosa que puede hacer es mirar la comparación entre lo real, en este caso, cuando establecemos algunos de los valores para que sean iguales a NA de antemano, podemos ver los valores que se imputaron y los valores que fueron realmente allí antes de que los elimináramos y los convirtiéramos en NA. Y podemos ver qué tan cerca están esos dos valores entre sí. 

#Y así, puedes ver, por ejemplo, eso. Esos valores están relativamente cerca unos de otros. La mayoría de las diferencias son muy cercanas a cero. Aquí puede ver que los valores son en su mayoría muy cercanos a cero.

quantile(capAve - capAveTruth)
quantile((capAve - capAveTruth)[selectNA])
quantile((capAve - capAveTruth)[!selectNA])

#Entonces la imputación funciona relativamente bien. También puede mirar solo los valores que se imputaron. De nuevo, aquí estoy mirando un cuantil capAve de la misma diferencia entre los valores imputados. Y los valores verdaderos, son solo para los que faltaban. 

#Y aquí pueden ver de nuevo, la mayoría de los valores están cerca de cero, pero aquí solo estamos viendo los que nos faltan, así que claramente algunos de ellos son más variables que antes. Y luego puedes mirar los que no fueron los que seleccionamos para ser NA. 

#Y puede ver que están aún más cerca entre sí, por lo que los que fueron imputados están un poco más separados. Pero no están mucho más separados. Por lo tanto, hay mucho más que aprender sobre los conjuntos de Entrenamiento y prueba en términos de transformaciones. 

#Pero Entrenamiento, pero lo que debe tener en cuenta es que el Entrenamiento en conjuntos de prueba debe procesarse de la misma manera. El paquete de intercalación maneja mucho de esto bajo el capó en el sentido de que si Entrenamiento un conjunto de datos usando funciones preProcess. 

#Integrado en la función de Entrenamiento y en forma de intercalación, aplica esa función preprocesada al equipo de prueba. Manejará todo el preprocesamiento de la manera correcta para usted. En general, debe prestar atención al hecho de que cualquier cosa que haga en el conjunto de Entrenamiento. Creará un conjunto de parámetros. Debe utilizar solo esos parámetros cuando los aplique al equipo de prueba. No puede estimar nuevas transformaciones en el conjunto de prueba solo. 

#Y eso significa que es probable que las transformaciones del conjunto de prueba sean imperfectas. Especialmente si los conjuntos de prueba y Entrenamiento son diferentes, recopilados en diferentes momentos o de diferentes maneras. 

#Algunas de las transformaciones no necesariamente funcionarán tan bien. Todas las transformaciones tra, de las que estoy hablando, hasta ahora distintas de la imputación, se basan en variables continuas. Cuando se trata de variables de factores, es un poco más difícil saber cuál es la transformación correcta. La mayoría de los algoritmos de aprendizaje automático están diseñados para lidiar con predictores binarios, en los que los predictores binarios no están preprocesados. O predictores continuos, en cuyo caso a veces se espera que los datos se preprocesen para que parezcan más normales. Puede ir a este enlace que he vinculado aquí para ver más información sobre cómo preprocesar datos para la predicción utilizando el paquete de intercalación.
