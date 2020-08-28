#Pre Processing PCA (Principal Component Analisys)


#Esta es una conferencia sobre preprossings, preprocesamiento de covariantes con análisis de componentes principales. 


#La idea es que a menudo tienes múltiples variables cuantitativas y, a veces, estarán altamente correlacionadas entre sí. En otras palabras, serán muy similares a ser casi la misma variable exacta. En este caso, no es necesariamente útil incluir todas las variables en el modelo. Es posible que desee incluir algún resumen que capture la mayor parte de la información en esas variables cuantitativas. 

#Entonces, como ejemplo, voy a usar el conjunto de datos de spam nuevamente. Así que cargué el paquete caret aquí, cargué el paquete de la aplicación del kernel y cargué el conjunto de datos de spam. Nuevamente, creo un conjunto de entrenamiento y prueba y voy a realizar solo las operaciones en el conjunto de entrenamiento que estoy haciendo aquí. 

library(caret)
library(kernlab)

data(spam)

inTrain <- createDataPartition(y=spam$type,
                               p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]


#Para que toda la exploración, la creación de modelos y la creación de características tengan que realizarse en el conjunto de entrenamiento. Lo primero que hago es que dejo fuera solo la columna 58 de este conjunto de entrenamiento. 

#Que en este caso es el resultado. Así que estoy mirando todas las demás variables predictoras. Y calculo la correlación entre todas esas columnas. La correlación entre todas las variables predictoras. Y tomo su valor absoluto. 

#Así que estoy buscando todas las variables predictoras que tienen una correlación muy alta o son muy similares entre sí. Cada variable tiene una correlación de 1 consigo misma. Entonces no estoy interesado en esas variables. Ya sabes, eliminando variables que tienen altas correlaciones consigo mismas, como todas las tienen. Así que establezco la diagonal de esas matrices, que resulta ser igual a 0. Eso es básicamente establecer la correlación entre las variables consigo misma, igual a 0. 

M <- abs(cor(training[,-58]))
diag(M) <- 0
which(M > 0.8,arr.ind=T)

#Y luego miro, ¿cuál de estas variables tiene una alta correlación entre sí? En otras palabras, ¿cuál de las variables tiene una correlación superior a 0,8? Entonces resulta que dos variables tienen una correlación muy alta entre sí. Son el num415 y el num857. 

#Así es como, si el número 415 y 857 aparecen en el correo electrónico y con frecuencia aparecen juntos. Es probable que esto se deba a que hay un número de teléfono que tiene variables similares allí. Entonces, si miro el conjunto de datos de spam, en las columnas 34 y 32, que obtuve al obtener eso de la variable de correlación anterior. Veo que son estas dos variables, estas dos columnas las que están altamente correlacionadas entre sí. Y si coloco esas dos columnas una contra la otra, veo exactamente lo que esperaría. 


names(spam)[c(34,32)]
plot(spam[,34],spam[,32])


#Entonces, la frecuencia de cuatro 415 y 857 está increíblemente altamente correlacionada, esto básicamente se encuentra perfectamente en una línea entre sí. 


#Entonces, como el número 415 aparece con más frecuencia, también lo hace el número 857. Entonces, la idea es que incluir ambos predictores en el modelo podría no ser necesariamente muy útil. Entonces, la idea básica es, ¿cómo podemos tomar esas variables y convertirlas, digamos, en una sola variable que podría ser mejor? Y una idea es pensar en ello como una combinación ponderada de esos predictores que explica la mayor parte de lo que está sucediendo. 

#Entonces, la idea es elegir la combinación que capture la mayor cantidad de información posible. Y los beneficios aquí son que está reduciendo la cantidad de predictores que necesita incluir en su modelo. Entonces eso es bueno. Y también está reduciendo el ruido. En otras palabras, está promediando o combinando variables juntas, por lo que puede reducirlas juntas. 

#Entonces, si hace esto de una manera inteligente, en realidad gana bastante al hacer análisis de componentes principales. Así que una idea en la que pensar es justa. Básicamente, lo que está tratando de hacer es encontrar una combinación de estas variables que expliquen de cerca la variabilidad. Entonces, solo como ejemplo, aquí hay una combinación que podría hacer. Podría decir que podría tomar 0,71 veces la variable 415 más 0,71 veces la variable 857. 

X <- 0.71*training$num415 + 0.71*training$num857
Y <- 0.71*training$num415 - 0.71*training$num857


#Y crea una nueva variable llamada x. Que es básicamente la suma de esas dos variables. Entonces podría tomar la diferencia de esas dos variables. Básicamente haciendo 0,71 por 415 menos 0,71 por 857. Así que esto básicamente es sumar, x es sumar las dos variables, y es restar las dos variables. Entonces, si grafica esas variables entre sí, cuando las sumo, ese es el eje x, y cuando tomo la diferencia, ese es el eje y. 


plot(X,Y)

#Y entonces puede ver que la mayor parte de la variabilidad ocurre en el eje x. En otras palabras, hay muchos puntos distribuidos a lo largo del eje x, pero la mayoría de los puntos están agrupados aquí en 0 en el eje y. De modo que casi todos estos puntos tienen un valor y de 0. Por lo tanto, la suma de las dos variables captura la mayor parte de la información en esas dos variables y la resta de las variables requiere menos información. Entonces, la idea aquí es que podríamos querer usar la suma de las dos variables como predictor. Eso reducirá el número previsto que tendremos que utilizar y renovar parte del ruido. Entonces, hay dos problemas relacionados con cómo hacer esto en un sentido más general.

#Y entonces las ideas son encontrar un nuevo conjunto de variables basadas en las variables que tienes que no están correlacionadas y explican la mayor variabilidad posible. 

#En otras palabras del gráfico anterior, estamos buscando la variable x que tiene mucha variación. Y no la variable y, que casi siempre es 0. Entonces, si juntas las variables en una matriz, crea la mejor matriz con menos variables. En otras palabras, este es un rango más bajo si está hablando matemáticamente que explica los datos originales. Estos dos problemas están estrechamente relacionados entre sí. Y ambos son la idea de que podemos usar menos variables para explicar casi todo lo que está sucediendo. 

#El primer objetivo es un objetivo estadístico y el segundo objetivo es un objetivo de compresión de datos. Pero también lo son, ambos son muy útiles para el aprendizaje automático. Entonces, hay dos soluciones relacionadas y son muy similares entre sí. Entonces, si x es una matriz con una variable en cada columna y una observación en cada fila, como un dato en el marco que normalmente tiene en R. Entonces la descomposición de valor singular es una descomposición de matriz. Entonces, toma ese marco de datos X y lo divide en tres matrices, una matriz U, una matriz D y una matriz B. Y la V, las columnas de U se llaman vectores singulares izquierdos. Y las columnas de B se denominan vectores singulares correctos. Y D es una matriz diagonal. Esos se llaman valores singulares. 

#Aprenderá sobre esto al obtener datos o al análisis de datos exploratorios si ha tomado esas clases. Los componentes principales son iguales a los vectores singulares correctos si escalas los datos de la misma manera. En otras palabras, la solución a ambos problemas de los que hablé en la diapositiva anterior es la misma si realiza la escala correcta. 

#Entonces, la idea aquí es que estas variables en V se construyen para explicar la cantidad máxima de variación en los datos. Entonces, solo para mostrarle cómo funciona esto en un ejemplo real, suponga que tomamos ese conjunto de datos de spam. Y solo tomamos esas dos variables que estaban altamente correlacionadas entre sí. Variables 34 y 32. Entonces hacemos componentes principales. Igual que la descomposición del valor singular en, en ese pequeño conjunto de datos que solo consta de esas dos variables. 

smallSpam <- spam[,c(34,32)]
prComp <- prcomp(smallSpam)
plot(prComp$x[,1],prComp$x[,2])



#Si graficamos el primer componente principal frente al segundo componente principal. Vemos una trama que es muy similar a la que les mostré anteriormente. Donde el primer componente principal parece sumar las dos variables. Y el segundo componente principal se parece mucho a restar las dos variables entre sí. Entonces, ¿por qué haríamos componentes principales, en lugar de simplemente sumar y restar? Bueno, los componentes principales le permiten realizar esta operación, incluso si tiene más de dos variables. Es posible que pueda reducir todas las variables a una cantidad muy pequeña de combinaciones de sumas y diferencias y sumas ponderadas y diferencias de las variables que ha observado. Por lo tanto, el uso de componentes principales puede permitirle observar una gran cantidad de variables cuantitativas y reducirlo bastante. 

#Lo único que también puede ver en este objeto de componente principal es la matriz de rotación.

prComp$rotation

#Que es básicamente cómo se resumen las dos variables para obtener cada uno de los componentes principales. Y aquí puede ver por qué puse 0,71 en la suma y la diferencia en la primera diapositiva. Entonces, el componente principal uno es solo 0.7081 por num14, 415 y 0.7061 por num857. 

#El componente principal dos es solo la diferencia nuevamente, multiplicado por 0.7061 y menos 0.7081. Entonces, básicamente, en este caso particular, el primer componente principal, el que explica la mayor variabilidad, es simplemente sumar las dos variables. Y la variable que explica la segunda mayor variabilidad en estas dos variables es tomar la diferencia entre las dos variables. Entonces, en estos datos de spam, podemos hacer esto para más variables que solo las dos variables. Es por eso que los componentes principales pueden ser útiles. 

#Entonces, aquí, estoy creando una variable que será el color con el que vamos a colorear nuestros puntos. Entonces, es de color igual al negro si no eres un spam y de color igual al rojo si eres un spam. 

typeColor <- ((spam$type=="spam")*1 + 1)
prComp <- prcomp(log10(spam[,-58]+1))
plot(prComp$x[,1],prComp$x[,2],col=typeColor,xlab="PC1",ylab="PC2")

#Y esta variable aquí, o esta declaración aquí calcula los componentes principales de todo el conjunto de datos. Notarás que he aplicado una función del conjunto de datos, la transformación log 10. Y agregué uno. He hecho esto para que los datos parezcan un poco más gaussianos. Porque algunas de las variables tienen un aspecto normal, porque algunas de las variables están sesgadas. Y a menudo tiene que hacer eso para que el análisis de componentes principales parezca sensato. Entonces calculé los componentes principales de todo el conjunto de datos. Entonces, en este caso, ahora puedo trazar nuevamente el componente principal uno, versus el componente principal dos. El componente principal uno ya no es una suma fácil de dos variables. Puede ser una combinación bastante complicada de todas las variables del conjunto de datos.

#Pero es la combinación la que explica la mayor variación en los datos. El componente principal dos es la combinación que explica la segunda mayor variación. Y el componente principal tres explica el tercero más y así sucesivamente. Entonces, si trazo el componente principal uno. Esa es solo una variable que he calculado. Versus variable principal componente dos que es otra variable que he calculado. Luego los coloreo con el indicador de spam. Entonces, si cada punto, entonces cada uno de estos puntos corresponde a una sola observación. Los rojos corresponden a observaciones de spam y los negros solo a observaciones de radioaficionados. Se puede ver en el espacio del componente principal uno, oa lo largo del componente principal uno. Hay un poco de separación entre los mensajes de radioaficionado y los mensajes de spam. 


#En otras palabras, los mensajes de spam tienden a tener valores un poco más altos que el componente principal uno. Por lo tanto, esta es una forma de reducir el tamaño de su conjunto de datos y al mismo tiempo capturar una gran cantidad de variación, que es una, una, la idea detrás de la creación de características. También puede hacer esto en caret. 

preProc <- preProcess(log10(spam[,-58]+1),method="pca",pcaComp=2)
spamPC <- predict(preProc,log10(spam[,-58]+1))
plot(spamPC[,1],spamPC[,2],col=typeColor)


#Entonces puedes hacerlo usando la función de preproceso. Así que esto es solo usar, básicamente hacer una operación de tipo similar con un paquete de caret. Pasas la función de preproceso. El mismo conjunto de datos que tenía antes. Dígale qué métodos usa. En este caso, le indica que utilice el análisis de componentes principales o PCA. Le dice el número de componentes principales a calcular. Y luego, lo que podemos hacer es calcular los valores de cada nuevo componente principal, por lo que el componente principal son dos variables. 

#Hay un componente principal, un componente principal dos. Y son básicamente un modelo que se ajusta a los datos. Entonces, la idea es que si obtiene una nueva observación, debe predecir cómo se verá el componente principal para esa nueva variable. Entonces pasamos este objeto preprocesado y el conjunto de datos a la función de predicción y eso nos da el componente principal. Si los graficamos entre sí, verá spam pc 1, entonces ese es el componente principal 1 versus el componente principal 2 aquí. 


#Y de nuevo ves un poco de separación. Entre el radioaficionado y los mensajes de spam, tanto en el componente principal como en el componente principal dos. Puede hacer esto, como le mostré antes, haciendo un preprocesamiento con el método PCA, usando la función preProcess. Y luego puede crear predicciones de entrenamiento utilizando la función de predicción. 

preProc <- preProcess(log10(training[,-58]+1),method="pca",pcaComp=2)
trainPC <- predict(preProc,log10(training[,-58]+1))

modelFit <- train(training$type ~ .,method="glm",data=trainPC)

#Y luego, ajustar un modelo que relacione la variable de entrenamiento con el componente principal. Así que aquí no he usado el conjunto de entrenamiento completo como datos para ajustar mi modelo. Tengo solo los componentes principales para el ajuste del modelo. En el conjunto de datos de prueba, debe usar el mismo componente principal que calculó en el conjunto de videos entrenados para las variables de prueba. Entonces, la idea aquí es que pasamos nuevamente al objeto de preproceso que calculamos en el conjunto de entrenamiento. 

#Pero ahora pasamos a los nuevos datos de prueba. Entonces, esta función de predicción tomará los componentes principales que calculamos a partir del entrenamiento. Y obtenga los nuevos valores para el conjunto de datos de prueba en esos mismos componentes principales. Entonces, lo que puede hacer es predecir. 

#El, usando el modelFit en los datos originales usando los componentes principales de la prueba. Y puede usar el argumento confusionMatrix en intercalación para obtener la precisión. 

testPC <- predict(preProc,log10(testing[,-58]+1))
confusionMatrix(testing$type,predict(modelFit,testPC))


#Y así, aquí calculamos un número relativamente pequeño de componentes principales, pero aún tenemos una precisión relativamente alta en la predicción. Por tanto, el análisis de componentes principales puede reducir el número de variables manteniendo la precisión. Entonces, la otra cosa que puede hacer es decidir que este análisis no use la función de predicción por separado. Puede incorporarlo directamente en su ejercicio de entrenamiento. Entonces, si toma la función de tren del paquete de intercalación y la pasa en un conjunto de entrenamiento. Pero le dice que procese previamente con el análisis de componentes principales. Hará ese procesamiento previo como parte del proceso de capacitación. Y luego, cuando hace la predicción en el nuevo conjunto de datos, simplemente le pasa un conjunto de datos de prueba y, en realidad, calculará las PC por usted. La razón por la que les mostré la forma más elaborada de calcular los PC primero y pasarlos al modelo. Es para que puedas ver lo que está pasando debajo del capó. Cuando pasa un comando como este, a la función de tren en el paquete de intercalación. Entonces esto es más útil para modelos de tipo lineal. Esto incluye análisis discriminante lineal, regresión lineal lineal y generalizada, cosas así.


modelFit <- train(training$type ~ .,method="glm",preProcess="pca",data=training)
confusionMatrix(testing$type,predict(modelFit,testing))

#Puede hacer que sea un poco más difícil interpretar los predictores. En el caso en el que solo tenía dos variables, era solo la suma y la diferencia de esas variables, era muy fácil predecir lo que eso significaba. Sin embargo, en general, si realiza componentes principales en una gran cantidad de variables cuantitativas. En cada componente principal puede haber una suma ponderada bastante compleja de las variables que ha observado, por lo que puede ser muy difícil de interpretar. Tienes que tener cuidado con los valores atípicos. Los valores atípicos realmente pueden causar estragos en el cálculo de los componentes principales. Entonces, haz eso mirando primero un análisis exploratorio e identificando valores atípicos. Al hacer transformaciones, como hice con la transformación de registro diez de los datos, también podría hacer transformaciones de Box Cox. Y nuevamente, trazar predictores para identificar problemas es el lugar clave para descubrir dónde está funcionando esto. Para obtener más información, puede ver la clase de análisis de datos exploratorios donde hablamos sobre el análisis de componentes principales y la SVD con más detalle. Y este libro, Elementos del aprendizaje estadístico, tiene una descripción general bastante agradable, aunque un poco técnica. De cómo funcionan los componentes principales para el aprendizaje automático.



