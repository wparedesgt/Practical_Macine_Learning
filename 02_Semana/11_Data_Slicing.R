#Data_Slicing

#Entonces, esta lección trata sobre la división de datos, y puede usar la división de datos para crear sus conjuntos de entrenamiento y prueba justo al comienzo de la creación de su función de predicción, o puede usarla para realizar validación cruzada o correas de arranque dentro de su conjunto de entrenamiento, en para evaluar sus modelos. 

#Entonces, nuevamente, vamos a usar el paquete caret, así que cargué el paquete caret aquí, y también atraeré, cargué el conjunto de datos kernlab nuevamente, solo para poder cargar los datos de spam. 

library(caret)
library(kernlab)
data(spam)

inTrain <- createDataPartition(y=spam$type,
                               p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
dim(training)


#Nuevamente, este es un conjunto de datos en el que intentamos predecir si los correos electrónicos son spam o ham y tenemos un montón de variables que miden cuántas veces aparece una palabra en particular o con qué frecuencia aparecen letras mayúsculas. 

#Entonces, una cosa que podemos hacer de inmediato es usar createDataPartition, para separar el conjunto de datos en conjuntos de entrenamiento y de prueba. Si hago esto, lo que sucederá es que le diga en qué resultado quiero dividir, por lo que en este caso quiero una división basada en el tipo. Y digo, quiero crear un conjunto de datos que sea del 75%, esté asignado al conjunto de entrenamiento y el 25% sea asignado al conjunto de prueba. 

#Entonces, lo que sucede es que a la variable inTrain se le asigna una función de indicador que puedo usar para subconjuntos del conjunto de entrenamiento y el conjunto de prueba. 

#Entonces, el conjunto de entrenamiento que creamos submuestreando este conjunto de datos de spam, el marco de datos de spam, en solo aquellas muestras que aparecen en el conjunto de entrenamiento. 

#Y luego, el conjunto de prueba son todas las muestras restantes, lo que puede hacer en r utilizando este signo menos para indicar que son todas las muestras que no aparecen en este conjunto de índices en la variable inTrain. 

#Así que ahora, esa es una forma de dividir sus datos en un conjunto de entrenamiento y prueba desde el principio. 

#También es posible que desee hacer algo como una validación cruzada en la que divide su conjunto de entrenamiento en un grupo de conjuntos de datos más pequeños. Los pliegues K que luego usará para hacer la validación cruzada. Entonces, una forma de hacerlo es con esta función createFolds en el paquete kay caret. 

set.seed(32323)
folds <- createFolds(y=spam$type,k=10,
                     list=TRUE,returnTrain=TRUE)
sapply(folds,length)
folds[[1]][1:10]


#Entonces, lo que hace es, nuevamente, pasarle el resultado que desea dividir. De nuevo, esta es la variable de tipo de spam. Y luego le decimos el número de pliegues que nos gustaría crear. En este caso, digo que me gustaría crear 10 pliegues. Y en este caso, también digo list = TRUE, lo que significa que devolverá cada conjunto de imbecies correspondiente a un pliegue en particular como un conjunto de como una lista. 

#Y puede indicarle que devuelva el conjunto de entrenamiento o que no lo devuelva. Entonces, por ejemplo, si hago esto, entonces tengo un montón de pliegues diferentes que he creado. 

#Y para cada uno, quiero crear, verifique la longitud de ese pliegue. Y así, por ejemplo, en Fold01 hay 4141 muestras. Y en Fold02, hay 4140. Y así sucesivamente. 

#Así que dividió la configuración de datos en diez pliegues, donde cada pliegue tiene aproximadamente el mismo número de muestras. Entonces, lo que puedo hacer es si quiero ver qué muestras aparecen en el primer pliegue, tomo el primer elemento de la lista del pliegue y, por lo tanto, cuando miro esa lista, los primeros 10 elementos corresponden a, en realidad los primeros 10 elementos de la muestra. 

#En otras palabras, esto se divide en orden de la primera a 4100 muestras en el primer pliegue. Las segundas 4140 muestras en el segundo pliegue y así sucesivamente, de modo que pueda ver cuál de los índices corresponde al conjunto de entrenamiento y al conjunto de prueba dentro de esos pliegues K. 

#También puede hacer que devuelva el conjunto de prueba o puede hacer que devuelva el conjunto de entrenamiento. 

#Así que recuerde, aquí estoy dividiendo el conjunto de datos alrededor de 75, 25 en conjuntos de entrenamiento y prueba, por lo que lo que puedo hacer es decir returnTrain = FALSE. 

set.seed(32323)
folds <- createFolds(y=spam$type,k=10,
                     list=TRUE,returnTrain=FALSE)
sapply(folds,length)
folds[[1]][1:10]



#Y luego, lo que hará es devolver solo las muestras del conjunto de prueba. Entonces, aquí puede ver que hay una cantidad mucho menor de muestras en cada pliegue, y eso se debe a que la mayoría de las muestras van al conjunto de entrenamiento. 

#Y nuevamente, puede mirar, para el pliegue 1, ¿cuáles son las muestras que realmente corresponden al conjunto de pruebas en ese pliegue? También puede hacer un remuestreo, por lo que si en lugar de hacer una validación cruzada completa, desea hacer algo como remuestrear o arrancar, puede usar la función createResample, función resample. 

set.seed(32323)
folds <- createResample(y=spam$type,times=10,
                        list=TRUE)
sapply(folds,length)
folds[[1]][1:10]


#De nuevo, dígale cuántas veces le gustaría volver a muestrear los datos y si le gustaría sacar una lista, un vector o una matriz.

#Entonces, lo que esto le dirá es, nuevamente, qué muestras corresponden a un pliegue en particular, y dado que estamos haciendo un remuestreo ahora, es posible que obtenga algunos de los mismos valores. 

#Entonces, por ejemplo, en el primer pliegue, en realidad obtiene la muestra tres repetida tres veces diferentes en ese pliegue porque está volviendo a muestrear con reemplazo de los valores. 

#También puede usarlo para crear intervalos de tiempo. Entonces, si está analizando datos que podría estar usando para pronosticar, puede usarlos para verificar cuáles son los intervalos de tiempo en los que toma valores continuos en el tiempo. 

#Así que aquí, he creado un vector de tiempo que es de 1 a 1000. El número entero es de 1 a 1000 y quiero crear cortes que tengan una ventana de aproximadamente 20 muestras. Y quiero decir que voy a predecir las próximas 10 muestras después de tomar la ventana inicial de 20. 

set.seed(32323)
tme <- 1:1000
folds <- createTimeSlices(y=tme,initialWindow=20,
                          horizon=10)
names(folds)
folds$train[[1]]
folds$test[[1]]


#Entonces, en el primer conjunto de entrenamiento, puedo ver que hay 20 valores. Entonces, en realidad, hay 20 muestras que se han creado en la primera ventana que usaremos para predecir. 

#Y si miro este conjunto de prueba, se corta aquí, pero habría 10 muestras y habría 10 muestras siguientes, 21 a 30. Y la siguiente submuestra sería cambiar eso y obtener una próxima porción, pero obtiene conjuntos continuos de números todos en una fila para que pueda usar el componente de variación en el tiempo de la muestra para predecir. 

#Hay mucha información en los tutoriales de signos de intercalación sobre cómo dividir el tiempo, y mostraremos varios ejemplos cuando creemos funciones de predicción en el resto de esta clase, y su tarea también cubrirá esto. El documento que presenta el paquete de intercalación, nuevamente, también tiene mucha información sobre cómo dividir el tiempo y cómo dividir los datos para crear conjuntos de entrenamiento y prueba, y para la validación cruzada.

