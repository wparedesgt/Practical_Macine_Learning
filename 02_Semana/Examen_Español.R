#Examen en Español

#Pregunta No. 1

#Cargar los datos de enfermedad de Alzheimer's

library(AppliedPredictiveModeling)
data(AlzheimerDisease)

# ¿Cuál de los siguientes comandos creará conjuntos de prueba y entrenamiento no superpuestos con aproximadamente el 50% de las observaciones asignadas a cada uno?

adData = data.frame(diagnosis,predictors)
testIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
training = adData[-testIndex,]
testing = adData[testIndex,]


#Pregunta No. 2

#Cargue los datos de cemento acorde a lo siguiente:

library(AppliedPredictiveModeling)
library(Hmisc)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

#Haga una gráfica del resultado (Resistencia a la compresión) versus el índice de las muestras. Coloree por cada una de las variables en el conjunto de datos (puede encontrar la función cut2() en el paquete Hmisc útil para convertir covariables continuas en factores). ¿Qué notas en estas tramas?
  
#Existe un patrón no aleatorio en la gráfica del resultado versus el índice que se explica perfectamente mediante la variable FlyAsh.


#Hay un patrón no aleatorio en la gráfica de resultado versus índice.


#Hay un patrón no aleatorio en la gráfica de resultado versus índice que no parece estar perfectamente explicado por ningún predictor que sugiera que puede faltar una variable.


#Hay un patrón no aleatorio en la gráfica de resultado versus índice que se explica perfectamente por la variable Edad.


#Pregunta 3

#Cargue los siguientes datos:


library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]


#Haga un histograma y confirme que la variable SuperPlasticizer está sesgada. Normalmente, puede usar la transformación de registro para intentar hacer que los datos sean más simétricos. ¿Por qué sería una mala elección para esta variable?
  
#La transformación logarítmica no reduce la asimetría de los valores distintos de cero de SuperPlasticizer

#Los datos de SuperPlasticizer incluyen valores negativos, por lo que no se puede realizar la transformación de registro.

#Hay una gran cantidad de valores que son iguales e incluso si tomara el registro (SuperPlasticizer + 1) todos serían idénticos, por lo que la distribución no sería simétrica.

#La transformación de registro no es una transformación monótona de los datos.

#Hay un patrón no aleatorio en la gráfica de resultado versus índice que no parece estar perfectamente explicado por ningún predictor que sugiera que puede faltar una variable.


#Hay un patrón no aleatorio en la gráfica de resultado versus índice que se explica perfectamente por la variable Edad.


#Pregunta NO. 4

#Cargue nuevamente los datos de enfermedad de Ainzhaimer


library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)data(AlzheimerDisease)

adData <- data.frame(diagnosis,predictors)

inTrain <- createDataPartition(adData$diagnosis, p = 3/4)[[1]]

training <- adData[ inTrain,]

testing <- adData[-inTrain,]


#Encuentre todas las variables predictoras en el conjunto de entrenamiento que comienzan con IL. Realice componentes principales en estas variables con la función preProcess () del paquete caret. Calcule el número de componentes principales necesarios para capturar el 80% de la varianza. ¿Cuántos hay?
  
#9
#10
#11
#7


#Pregunta NO. 5

#Cargue la enfermedad de Ainshaimer con los siguientes comandos.


library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)

adData <- data.frame(diagnosis,predictors)
inTrain <- createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training <- adData[ inTrain,]
testing <- adData[-inTrain,]


#Cree un conjunto de datos de entrenamiento que consta solo de los predictores con nombres de variable que comienzan con IL y el diagnóstico. Construya dos modelos predictivos, uno usando los predictores tal como están y otro usando PCA con componentes principales que expliquen el 80% de la varianza en los predictores. Utilice method = "glm" en la función de tren.

#¿Cuál es la precisión de cada método en el conjunto de prueba? ¿Cuál es más preciso?
  
#Precisión sin PCA: 0,75

#Precisión PCA: 0,71

#Precisión sin PCA: 0,65

#Precisión PCA: 0,72

#Precisión sin PCA: 0,72

#Precisión PCA: 0,65

#Precisión sin PCA: 0,72

#Precisión PCA: 0,71



