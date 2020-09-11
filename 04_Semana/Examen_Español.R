#Examen en Español

#Pregunta 1
# Para este cuestionario utilizaremos varios paquetes R. Las versiones de los paquetes R cambian con el tiempo, las respuestas correctas se han verificado usando las siguientes versiones de los paquetes.

#AppliedPredictiveModeling: v1.1.6
#caret: v6.0.47
#ElemStatLearn: v2012.04-0
#pgmm: v1.1
#rpart: v4.1.8
#gbm: v2.1
#lubridate: v1.3.3
#forecast: v5.6
#e1071: v1.6.4

library(tidyverse)
library(caret)
library(forecast)
library(lubridate)
library(e1071)

#Si no está usando estas versiones de los paquetes, es posible que sus respuestas no coincidan exactamente con la respuesta correcta, pero con suerte deberían estar cerca.

#Cargue los conjuntos de datos de vocal.train y vocal.test:

#library(ElemStatLearn) ya no existe la libreria para R 4 se carga desde un repositorio

#data(vowel.train)
#data(vowel.test)

head(vowel.test)
head(vowel.train)

str(vowel.test)
str(vowel.train)


#Configure la variable y para que sea un factor variable tanto en el conjunto de entrenamiento como de prueba. 

vowel.test$y <- as.factor(vowel.test$y)
vowel.train$y <- as.factor(vowel.train$y)

#Luego, establezca la semilla en 33833. 

set.seed(33833, sample.kind = "Rounding")

#Ajuste (1) un predictor de bosque aleatorio que relacione la variable de factor y con las variables restantes y (2) un predictor reforzado usando el método "gbm". Ajústelos a ambos con el comando train () en el paquete caret.

fit_rf <- train(y~., data = vowel.train, method = "rf")
fit_gbm <- train(y~., data = vowel.train, method = "gbm")

# ¿Cuáles son las precisiones de los dos enfoques en el conjunto de datos de prueba? ¿Cuál es la precisión entre las muestras del conjunto de prueba cuando los dos métodos coinciden?

predict_rf <- predict(fit_rf, vowel.test)
predict_gbm <- predict(fit_gbm, vowel.test)

rf_accuracy <- confusionMatrix(predict_rf, vowel.test$y)$overall["Accuracy"]
gbm_accuracy <- confusionMatrix(predict_gbm, vowel.test$y)$overall["Accuracy"]

coincidencia <- predict_rf == predict_gbm

Agreement_accuracy <- confusionMatrix(vowel.test$y[coincidencia], predict_rf[coincidencia])$overall["Accuracy"]

rf_accuracy # 0.5887446
gbm_accuracy # 0.512987
Agreement_accuracy #0.621118

#Esta respuesta es la mas cercana 

#RF Accuracy = 0.6082
#GBM Accuracy = 0.5152
#Agreement Accuracy = 0.6361


#RF Accuracy = 0.6082
#GBM Accuracy = 0.5152
#Agreement Accuracy = 0.5325

#RF Accuracy = 0.9987
#GBM Accuracy = 0.5152
#Agreement Accuracy = 0.9985

#RF Accuracy = 0.3233
#GBM Accuracy = 0.8371
#Agreement Accuracy = 0.9983


#Pregunta 2
#Cargue los datos de Alzheimer usando los siguientes comandos

library(caret)
library(gbm)
set.seed(3433)  #Le agrego el sample kind por ser version 4.0 de R
library(AppliedPredictiveModeling)

data(AlzheimerDisease)

adData = data.frame(diagnosis,predictors)

inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]

training = adData[ inTrain,]
testing = adData[-inTrain,]

# Establezca la semilla en 62433 y prediga el diagnóstico con todas las demás variables utilizando un modelo de bosque aleatorio ("rf"), árboles potenciados ("gbm") y análisis discriminante lineal ("lda"). Apile las predicciones usando bosques aleatorios ("rf"). 

head(training)

set.seed(62433)

#Construyendo los modelos 

fit_rf <- train(diagnosis~.,data = training, method = "rf")
fit_gbm <- train(diagnosis~., data = training, method = "gbm")
fit_lda <- train(diagnosis~., data = training, methd = "lda")

#Predicciones

predict_rf <- predict(fit_rf,testing)
predict_gbm <- predict(fit_gbm, testing)
predict_lda <- predict(fit_lda, testing)

#Realizando la combinacion con rf

combinacion <- data.frame(predict_rf, predict_gbm, predict_lda, diagnosis = testing$diagnosis)

fit_combo <- train(diagnosis ~., data = combinacion, method = "rf")

predict_combo <- predict(fit_combo, testing)

#Accurrancy o presición

cm_rf <- confusionMatrix(predict_rf, testing$diagnosis)$overall["Accuracy"]
cm_gbm <- confusionMatrix(predict_gbm, testing$diagnosis)$overall["Accuracy"]
cm_lda <- confusionMatrix(predict_lda, testing$diagnosis)$overall["Accuracy"]
cm_combo <- confusionMatrix(predict_combo, testing$diagnosis)$overall["Accuracy"]

options(digits = 2) #Solo dos digitos

cm_rf    #0.79
cm_gbm   #0.78
cm_lda   #0.78
cm_combo #0.79


#¿Cuál es la precisión resultante en el equipo de prueba? ¿Es mejor o peor que cada una de las predicciones individuales?


#Stacked Accuracy: 0.80 is better than random forests and lda and the same as boosting. #Respuesta

#Stacked Accuracy: 0.69 is better than all three other methods

#Stacked Accuracy: 0.76 is better than lda but not random forests or boosting.

#Stacked Accuracy: 0.80 is better than all three other methods   


#Pregunta 3
# Cargue los datos concretos con los comandos:

set.seed(3523)

library(AppliedPredictiveModeling)

data(concrete)

inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]

training = concrete[ inTrain,]
testing = concrete[-inTrain,]


# Establezca la semilla en 233 y ajuste un modelo de lasso para predecir la resistencia a la compresión "CompressiveStrength". 

set.seed(233)

head(training)

fit_lasso <- train(CompressiveStrength ~., data = training, method = "lasso")

library(elasticnet)


#¿Qué variable es el último coeficiente que se pone a cero a medida que aumenta la penalización? (Sugerencia: puede ser útil buscar? Plot.enet).

#Usando plot.enet para visualizar 

plot.enet(fit_lasso$finalModel, xvar = "penalty", use.color = TRUE)


#Age
#Water   
#CoarseAggregate
#Cement           #A medida que aumenta el ultimo es el cemento


#Pregunta 4

#Cargue los datos sobre la cantidad de visitantes al blog de instructores desde aquí:

#https: //d396qusza40orc.cloudfront.net/predmachlearn/gaData.csv

# Usando los comandos:

library(lubridate) # For year() function below

dat = read.csv("data/gaData.csv")

training = dat[year(dat$date) < 2012,]

testing = dat[(year(dat$date)) > 2011,]

tstrain = ts(training$visitsTumblr)


#Ajuste un modelo usando la función bats () en el paquete forecast a la serie de tiempo de entrenamiento. Luego pronostique este modelo para los puntos de tiempo restantes. ¿Para cuántos de los puntos de prueba es el valor real dentro de los límites del intervalo de predicción del 95%?

library(forecast)

fit_fc <- bats(tstrain)

pronostico <- forecast(fit_fc, nrow(testing), level = c(95))

plot(pronostico)

points(dat$visitsTumblr)

sum(pronostico$lower <= testing$visitsTumblr & testing$visitsTumblr <= pronostico$upper) / dim(testing)[1]


#100%
#92%
#96%   #el 96% de los puntos de prueba estan en los intervalos del 95%

#94%



#Pregunta 5

# Cargue los datos concretos con los comandos:


set.seed(3523)

library(AppliedPredictiveModeling)

data(concrete)

inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]

training = concrete[ inTrain,]

testing = concrete[-inTrain,]


# Establezca la semilla en 325 y coloque una máquina de vector de soporte (support vector machine) usando el paquete e1071 para predecir la resistencia a la compresión usando la configuración predeterminada. 

set.seed(325)

library(e1071)

fit_svm <- svm(CompressiveStrength~., data = training)

predict_svm <- predict(fit_svm, testing)

RMSE(testing$CompressiveStrength, predict_svm)



#Predecir sobre el conjunto de pruebas. ¿Qué es el RMSE?

#6.93
#35.59
#6.72            #Por aproximación este es 6.7
#107.44



