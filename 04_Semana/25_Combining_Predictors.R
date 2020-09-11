#Combinando Predictores

#Esta conferencia trata sobre la combinación de predictores, a veces se denomina métodos de conjunto en el aprendizaje. Entonces, la idea clave aquí es que puede combinar clasificadores promediando o votando y estos pueden ser clasificadores que son muy diferentes. Entonces, por ejemplo, puede combinar un clasificador de impulso con un bosque aleatorio con un modelo de regresión lineal. En general, la combinación de clasificadores mejora la precisión y también puede reducir las habilidades interpretativas. 

#Debe tener mucho cuidado, la ganancia que obtiene vale la pena la pérdida de interperatibilidad. Impulso, ensacado y piso aleatorio, todos son básicamente variaciones en este tema que pueden promediar diferentes clasificadores juntos. Pero esos son todos ejemplos en los que se promedia el mismo tipo de clasificadores en todos los casos. Entonces, como ejemplo de cuán exitoso puede ser esto, el premio de Netflix fue un premio de un millón de dólares que fue básicamente una competencia de predicción importante que se llevó a cabo. Entonces, el equipo que terminó ganando fue en realidad una combinación de 107 diferentes. Los algoritmos de aprendizaje automático se combinaron para obtener la mejor puntuación en este ejemplo. El premio Heritage Health también se ganó mediante métodos que se combinaron para múltiples modelos de regresión y métodos de aprendizaje automático diferentes. Y así, estos son los dos enlaces a los primeros premios de progreso para los dos equipos que estaban a la cabeza. El premio Heritage Health fue un premio de $ 3 millones. Fue diseñado para tratar de predecir si las personas regresarían al hospital según su historial de hospitalización. Entonces, la intuición básica aquí, se puede considerar como un voto mayoritario. Supongamos que tenemos cinco clasificadores completamente independientes. Si la precisión es del 70% para cada clasificador, entonces podemos pensar que la precisión para el voto mayoritario sería. Diez veces el voto de la mayoría es correcto para tres de los cinco clasificadores, para cuatro de los cinco clasificadores o para los cinco clasificadores. Y así resulta que sería un 83,7% de precisión del voto mayoritario. Con 101 clasificadores independientes, obtienes una precisión de voto mayoritaria del 99,9%. Entonces, algunos enfoques para combinar clasificadores básicamente usan, un enfoque es usar clasificadores similares y combinarlos usando algo como ensacado, refuerzo o bosques aleatorios. Otro enfoque es combinar diferentes clasificadores utilizando el apilamiento de modelos o el conjunto de modelos, y hablaremos un poco sobre el apilamiento de modelos en esta lección. Entonces, aquí hay un ejemplo con los datos de salarios. Entonces, ¿hacia dónde vamos? Cree el conjunto de datos de salarios y lo dejaremos fuera la variable logarítmica de salario. Dado que estamos tratando de predecir el salario, el logaritmo del salario sería un muy buen predictor. Y construimos el conjunto de validación aquí. 


library(ISLR)
data(Wage)
library(ggplot2)
library(caret);

Wage <- subset(Wage,select=-c(logwage))

# Create a building data set and validation set
inBuild <- createDataPartition(y=Wage$wage,
                               p=0.7, list=FALSE)
validation <- Wage[-inBuild,]
buildData <- Wage[inBuild,]

inTrain <- createDataPartition(y=buildData$wage,
                               p=0.7, list=FALSE)

training <- buildData[inTrain,]
testing <- buildData[-inTrain,]


#Y también construimos un conjunto de entrenamiento y un conjunto de prueba. Entonces, lo he separado en tres conjuntos de datos diferentes aquí.

dim(training)
dim(testing)
dim(validation)



#Y eso, verá la importancia de eso en solo un minuto. Entonces, el conjunto de entrenamiento es el más grande de los conjuntos de datos. Tiene 100, 1474 ejemplos. El conjunto de prueba tiene 628 y el conjunto de validación tiene 898 muestras. 


mod1 <- train(wage ~.,method="glm",data=training)
mod2 <- train(wage ~.,method="rf",
              data=training, 
              trControl = trainControl(method="cv"),number=3)


#Entonces, en el conjunto de entrenamiento, construimos. En este caso, estoy usando un GLM. Entonces este es un modelo lineal. Y lo estoy construyendo en los datos de entrenamiento. Y básicamente estoy prediciendo el salario usando todas las demás variables. También voy a construir un modelo separado, también en los datos de entrenamiento. Y voy a, aquí, usar método es igual a bosque aleatorio. Y entonces estoy ajustando dos modelos de predicción diferentes al mismo conjunto de datos. Luego puedo graficar esas predicciones entre sí, así que estas son las predicciones aquí. 


pred1 <- predict(mod1,testing)
pred2 <- predict(mod2,testing)
qplot(pred1,pred2,colour=wage,data=testing)


#Pred1 son las predicciones del modelo lineal y pred2 son las predicciones del bosque aleatorio. Y puedes ver que están cerca el uno del otro, pero en realidad no están de acuerdo entre sí. Y ninguno de ellos se correlaciona perfectamente con la variable de salario, que es el color de los puntos en esta imagen en particular. Entonces, lo que podemos hacer es ajustar un modelo que combine los predictores. Entonces, básicamente construyo un nuevo conjunto de datos que consiste en las predicciones del modelo uno y las predicciones del modelo dos. Y luego lo que puedo hacer es crear una variable de salario, que es, en el conjunto de datos de prueba, la variable de salario. Entonces puedo ajustar un nuevo modelo, que relaciona esta variable salarial, con las dos predicciones. Así que ahora, en lugar de simplemente ajustar un modelo que relaciona las covariantes con el resultado, he ajustado dos modelos de predicción separados para el resultado. Y ahora estoy ajustando un modelo de regresión, relacionando el resultado con las predicciones para esos dos modelos. Y luego puedo predecir a partir del conjunto de datos combinados en nuevas muestras. Entonces, puedo ver qué tan bien lo hago en el conjunto de prueba y así puedo ver que, por ejemplo, en el conjunto de prueba el primer predictor.


predDF <- data.frame(pred1,pred2,wage=testing$wage)
combModFit <- train(wage ~.,method="gam",data=predDF)
combPred <- predict(combModFit,predDF)

sqrt(sum(pred1-testing$wage)^2)
sqrt(sum(pred2-testing$wage)^2)

sqrt(sum((combPred-testing$wage)^2))

#Tiene un error de 827.1 y el segundo predictor tiene un error de 866, mientras que el predictor combinado tiene un error que es menor, 813.9. Y también quiero probarlo en el conjunto de validación porque recuerde que utilizo el conjunto de prueba para intentar combinar los dos modelos. Entonces, encajo un modelo en el conjunto de prueba, por lo que esa no es una buena representación del error fuera de muestra. 

pred1V <- predict(mod1,validation)
pred2V <- predict(mod2,validation)

predVDF <- data.frame(pred1=pred1V,pred2=pred2V)
combPredV <- predict(combModFit,predVDF)

#Entonces, ahora básicamente creo una predicción de mi primer modelo en el conjunto de validación y una predicción de mi segundo modelo en el conjunto de validación. Luego creo un marco de datos que contiene esas dos predicciones. Y ahora predigo usando mi modelo, mi modelo combinado, sobre las predicciones en el conjunto de datos de validación. Entonces, la covarianza que se pasa en el modelo son las predicciones de los dos modelos diferentes.

sqrt(sum((pred1V-validation$wage)^2))
sqrt(sum((pred2V-validation$wage)^2))
sqrt(sum((combPredV-validation$wage)^2))

#Así que aquí puedo ver el error del modelo uno si lo usara solo sería 1003. El error para mi segundo modelo sería 1068. Y el modelo combinado tiene un error menor incluso en el conjunto de datos de validación. Por lo tanto, apilar modelos de esta manera puede mejorar la precisión al combinar diferentes modelos, los puntos fuertes de diferentes modelos juntos. Incluso la combinación simple como la que he mencionado aquí puede ser realmente útil y puede mejorar la precisión. La combinación típica de modelos para múltiples datos binarios multiclase implica la construcción de un número impar de modelos, prediciendo el resultado con cada modelo. Y luego, asignar la etiqueta de clase final basada en el voto de la mayoría. Esto puede volverse dramáticamente más complicado, encontré un conjunto de paquetes de intercalación que combina algunos de los modelos de intercalación, pero está un poco en desarrollo, así que diría que lo use bajo su propio riesgo. También puede leer más sobre el aprendizaje en conjunto aquí en la página de Wikipedia a la que he vinculado aquí. Un punto importante a tener en cuenta al realizar el ensamblaje de modelos es que esto puede conducir a aumentos en la complejidad computacional. Entonces resulta que a pesar de que Netflix pagó un millón de dólares al equipo que ganó el premio. La solución, la solución del dólar millonario de Netflix, nunca se implementó realmente. Porque era demasiado computacional para aplicarlo a conjuntos de datos específicos. Por lo tanto, recuerde de las primeras conferencias de esta clase que existen compensaciones entre escalabilidad y precisión a las que debe prestar atención al crear estos modelos de predicción.
