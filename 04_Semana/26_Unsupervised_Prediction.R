#Prediccion no supervisada


#En los ejemplos que hemos hablado hasta ahora en esta clase, ya conoces las etiquetas de antemano. En otras palabras, estás aplicando aprendizaje supervisado, ya que estás intentando predecir un resultado que conoces de antemano. Pero a veces, no conoces las etiquetas para hacer una predicción, por lo que las tienes que descubrir de antemano. Una manera de hacer esto es crear agrupaciones de los datos que has observado, para ponerle un nombre a cada una de esas agrupaciones y entonces crear un predictor para esas agrupaciones. En un nuevo conjunto de datos, vas a predecir los grupos y aplicar el nombre que se te ocurra del anterior conjunto de datos. Esto añade bastante dificultad al problema de predicción. En primer lugar, crear las agrupaciones no es un proceso perfecto libre de ruido. En segundo lugar, encontrar los nombres adecuados, en otras palabras, poder interpretar bien las agrupaciones es un gran reto. Si has estudiado análisis de datos exploratorios en nuestra especialización de ciencia de datos, entenderás el porqué. Crear un predictor para las agrupaciones es básicamente utilizar algoritmos que ya hemos aprendido durante esta clase, así como predecir esas agrupaciones. 

#Te enseñaré tan solo un breve ejemplo de cómo puedes hacerlo. Si cargo el conjunto de datos del iris y la librería ggplot, entonces puedo crear un subconjunto de entrenamiento y otro de test para el conjunto de datos del iris tal y como he hecho en ejemplos anteriores, aun así podría ignorar la especie de los grupos. 

data(iris)
library(ggplot2)
inTrain <- createDataPartition(y=iris$Species,
                               p=0.7, list=FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]
dim(training)
dim(testing)



#Una cosa que puedo hacer es hacer una agrupación k-medias. 


kMeans1 <- kmeans(subset(training,select=-c(Species)),centers=3)
training$clusters <- as.factor(kMeans1$cluster)
qplot(Petal.Width,Petal.Length,colour=clusters,data=training)


#No se si recuerdas la agrupación k-medias de la sección de análisis exploratorio de datos de la especialización de ciencia de datos. Si no te acuerdas, puedes mirarlo en la Wikipedia. La idea principal es básicamente crear tres agrupaciones diferentes. Estaba diciendo esto para crear tres diferentes agrupaciones, ignorando la especie de la información. Lo que puedo hacer es asignar diferentes colores a cada una de esas agrupaciones. Aquí he hecho una gráfica con esas tres diferentes agrupaciones que se han creado a través del algoritmo de agrupación k-medias, entonces hay un grupo aquí, otro aquí y otro más aquí. Esos grupos están muy cerca de los grupos que se obtendrían usando las etiquetas de las especies, pero esto no es un resultado típico, frecuentemente es muy difícil poner una etiqueta a los grupos que se obtienen. 

table(kMeans1$cluster,training$Species)

#En este caso, puedo hacer una tabla del grupo frente a la especie, y puedo ver que el grupo 2 corresponde a esta especie. El grupo 3 corresponde a esta especie y el grupo 1 a esta otra especie. 

#En general, no hubiera sabido los nombres de esas especies, y se me hubieran tenido que ocurrir nombres para cada grupo. Entonces puedo ajustar un modelo que relaciona la variable del grupo que acabo de crear con todas las variables predictoras y podría hacerlo en el conjunto de entrenamiento. 

modFit <- train(clusters ~.,data=subset(training,select=-c(Species)),method="rpart")
table(predict(modFit,training),training$Species)

#En este caso, estoy haciéndolo con un árbol clasificador. puedo hacer una predicción en el conjunto de entrenamiento y puedo ver que hago un buen trabajo prediciendo este grupo y este grupo, pero a veces el grupo 1 y el grupo 3 se entremezclan, mezclándose en mi modelo de predicción. Esto se debe a que tengo el error de variación en mi predicción y también el error en mi grupo, por lo que termina siendo un problema bastante desafiante, predecir de esta manera de forma no supervisada. Entonces puedo aplicarlo en el conjunto de datos Si predigo en el conjunto de datos, en general no sabría cuales son las etiquetas, pero aquí estoy mostrando cuales son. Aquí estoy prediciendo en un nuevo conjunto de datos y haciendo una tabla frente a las especies que actualmente conocemos. 

testClusterPred <- predict(modFit,testing) 
table(testClusterPred ,testing$Species)


#Así puedo ver que hace un bastante buen trabajo aquí prediciendo las diferentes especies en los diferentes grupos etiquetados. En general, esto es un problema difícil, por lo que hay que tener cuidado a la hora de etiquetar los grupos, y haciendo el análisis no supervisado y entendiendo cómo funciona. La función cl_predict en el paquete clue nos aporta una funcionalidad similar que la descrita aquí, pero en general tiene más sentido crear tu propio enfoque si estás haciendo predicción no supervisada porque necesitas pensar con cuidado cómo vas a definir los grupos. Se muy cauteloso con la interpretación de estos tipos de agrupaciones. Esto es una técnica de exploración. Las agrupaciones pueden cambiar dependiendo de tu muestra de datos. Esto es tan solo un enfoque básico para poder crear cosas como motores de recomendación, donde identificas agrupaciones de gente que tienen gustos similares y de esta manera se asignan sus gustos a nuevas personas. Puedes leer más acerca de aprendizaje no supervisado en elementos de aprendizaje estadístico e introducción al aprendizaje estadístico.