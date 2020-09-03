#Examen Español


# Pregunta 01

# Para este cuestionario utilizaremos varios paquetes R. Las versiones de los paquetes R cambian con el tiempo, las respuestas correctas se han verificado usando las siguientes versiones de los paquetes.


#AppliedPredictiveModeling: v1.1.6
#caret: v6.0.47
#ElemStatLearn: v2012.04-0
#pgmm: v1.1
#rpart: v4.1.8

#Si no está usando estas versiones de los paquetes, es posible que sus respuestas no coincidan exactamente con la respuesta correcta, pero con suerte deberían estar cerca.

# Cargue los datos de segmentación celular del paquete AppliedPredictiveModeling usando los comandos:


library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
library(tidyverse)

# 1. Subconjunta los datos en un conjunto de entrenamiento y un conjunto de pruebas según la variable Case del conjunto de datos.

names(segmentationOriginal)
str(segmentationOriginal)


training <- segmentationOriginal[segmentationOriginal$Case == "Train",]
testing <- segmentationOriginal[segmentationOriginal$Case == "Test",]

# 2. Establezca la semilla en 125 y ajuste un modelo CART con el método rpart utilizando todas las variables predictoras y la configuración de intercalación predeterminada.

set.seed(125, sample.kind = "Rounding")

fitCART <- train(Class ~., data = training, method = "rpart")

# 3. En el modelo final, cuál sería la predicción del modelo final para los casos con los siguientes valores de variable:


library(rattle)

fancyRpartPlot(fitCART$finalModel)

plot(fitCART$finalModel, uniform=TRUE, 
     main="Arbol de Clasificacion")
text(fitCART$finalModel, use.n=TRUE, all=TRUE, cex=.8)


#a. TotalIntench2 = 23,000; FiberWidthCh1 = 10; PerimStatusCh1=2
#b. TotalIntench2 = 50,000; FiberWidthCh1 = 10;VarIntenCh4 = 100
#c. TotalIntench2 = 57,000; FiberWidthCh1 = 8;VarIntenCh4 = 100
#d. FiberWidthCh1 = 8;VarIntenCh4 = 100; PerimStatusCh1=2


#a. PS
#b. WS
#c. PS
#d. Not possible to predict     ##Respuesta 

#a. PS
#b. WS
#c. PS
#d. WS

#a. PS
#b. Not possible to predict
#c. PS
#d. WS

#a. Not possible to predict
#b. WS
#c. PS
#d. PS



#Pregunta 2

# Si K es pequeño en una validación cruzada de K veces, ¿el sesgo en la estimación de la precisión fuera de la muestra (conjunto de prueba) es menor o mayor? Si K es pequeño, la varianza en la estimación de la precisión fuera de la muestra (conjunto de prueba) es menor o mayor. ¿K es grande o pequeño en la validación cruzada de dejar uno fuera?

# El sesgo es menor y la varianza es mayor. Debajo de dejar uno fuera, la validación cruzada K es igual a uno.

# El sesgo es menor y la varianza es menor. Debajo de dejar una validación cruzada K es igual al tamaño de la muestra.

# El sesgo es mayor y la varianza es menor. Debajo de dejar una validación cruzada K es igual al tamaño de la muestra. #Respuesta 

# El sesgo es mayor y la varianza es menor. Debajo de dejar uno fuera, la validación cruzada K es igual a uno.



#Pregunta 3

#Cargue los datos del aceite de oliva usando los comandos:


library(pgmm)
data(olive)
olive = olive[,-1]


# Estos datos contienen información sobre 572 aceites de oliva italianos diferentes de varias regiones de Italia. Ajuste un árbol de clasificación donde Área es la variable de resultado. Luego prediga el valor del área para el siguiente marco de datos usando el comando de árbol con todos los valores predeterminados.

head(olive)

newdata = as.data.frame(t(colMeans(olive)))

fit_olive <- train(Area ~., data = olive, method = "rpart")

predict(fit_olive, newdata = newdata)

# ¿Cuál es la predicción resultante? ¿Es extraña la predicción resultante? ¿Por qué o por qué no?

# 4.59965. No hay ninguna razón por la que el resultado sea extraño.

# 0.005291005 0 0.994709 0 0 0 0 0 0. El resultado es extraño porque Área es una variable numérica y deberíamos obtener el promedio dentro de cada hoja.

# 2.783. Es extraño porque el Área debería ser una variable cualitativa, pero el árbol informa el valor promedio del Área como una variable numérica en la hoja prevista para nuevos datos.  #Respuesta 

# 2.783. No hay ninguna razón por la que este resultado sea extraño.


#Pregunta 4

# Cargue los datos de enfermedades cardíacas de Sudáfrica y cree conjuntos de entrenamiento y prueba con el siguiente código:


library(ElemStatLearn)
data(SAheart)
set.seed(8484, sample.kind = "Rounding")

train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)

trainSA = SAheart[train,]
testSA = SAheart[-train,]


#A continuación, establezca la semilla en 13234 y ajuste un modelo de regresión logística (método = "glm", asegúrese de especificar familia = "binomial") con Enfermedad coronaria (chd) como resultado y edad de inicio, consumo actual de alcohol, obesidad niveles, tabaquismo acumulativo, comportamiento tipo A y colesterol unido a lipoproteínas de baja densidad como predictores. Calcula la tasa de clasificación errónea de tu modelo con esta función y una predicción en la escala de "respuesta":

missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}

set.seed(13234, sample.kind = "Rounding")
head(trainSA)


#fit_SAheart <- train(chd~age+alcohol+obesity+tobacco+typea+ldl, data = trainSA, method = "glm", family = "binomial")

#fit_SAheart <- train(chd~age+alcohol+obesity+tobacco+typea+ldl,data=trainSA,method="glm", family="binomial")

fit_SAheart <- train(chd~age+tobacco+ldl+typea+obesity+alcohol, data = trainSA ,method = "glm", family = "binomial") 


predict_SAheart <- predict(fit_SAheart, testSA)

missclass_train <- missClass(trainSA$chd, predict(fit_SAheart, trainSA))
missclass_test <-  missClass(testSA$chd, predict(fit_SAheart, testSA))

missclass_test
missclass_train

# ¿Cuál es la tasa de clasificación errónea en el conjunto de entrenamiento? ¿Cuál es la tasa de clasificación errónea en el equipo de prueba?


#Test Set Misclassification: 0.31
#Training Set: 0.27                       #Respuesta 

#Test Set Misclassification: 0.35
#Training Set: 0.31

#Test Set Misclassification: 0.27
#Training Set: 0.31

#Test Set Misclassification: 0.43
#Training Set: 0.31




#Pregunta 5

#Cargue los conjuntos de datos de vocal.train y vocal.test:


library(ElemStatLearn)
data(vowel.train)
data(vowel.test)


#Configure la variable "y", para que sea un factor variable tanto en el conjunto de entrenamiento como de prueba. Luego, establezca la semilla en 33833. Ajuste un predictor de bosque aleatorio que relacione la variable de factor y con las variables restantes. Lea acerca de la importancia variable en bosques aleatorios aquí: http://www.stat.berkeley.edu/~breiman/RandomForests/cc_home.htm#ooberr


head(vowel.train)
head(vowel.test)

vowel.test$y <- as.factor(vowel.test$y)
vowel.train$y <- as.factor(vowel.train$y)

set.seed(33833, sample.kind = "Rounding")

library(caret)
library(randomForest)

# El paquete carret usa por defecto la importancia de Gini.

#Calcule la importancia de la variable usando la función varImp en el paquete de caret. ¿Cuál es el orden de importancia variable?

# [NOTA: Use randomForest () específicamente, no intercalado, ya que se han reportado algunos problemas con ese enfoque. 6/11/2016]

fit_RF <- randomForest(y~., data = vowel.train)
fit_RF02 <- train(y~., data = vowel.train, method = "rf")

varImp(fit_RF)

arrange(varImp(fit_RF), desc(Overall))

varImp(fit_RF02)

order( varImp(fit_RF),decreasing=TRUE)

varImp(fit_RF02)

#The order of the variables is:
#x.10, x.7, x.5, x.6, x.8, x.4, x.9, x.3, x.1,x.2

#The order of the variables is:
#x.1, x.2, x.3, x.8, x.6, x.4, x.5, x.9, x.7,x.10

#The order of the variables is:
#x.10, x.7, x.9, x.5, x.8, x.4, x.6, x.3, x.1,x.2

#The order of the variables is:
#x.2, x.1, x.5, x.6, x.8, x.4, x.9, x.3, x.7,x.10



