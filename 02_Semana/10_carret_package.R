#caret Packages

library(tidyverse)
library(caret)

#Esta conferencia trata sobre el paquete de caret, que es un paquete de interfaz muy útil que incluye muchos de los algoritmos y herramientas de predicción que usará en el lenguaje de programación R. 

#Por lo tanto, el paquete de caret se puede encontrar aquí en este sitio web al que me vinculé aquí en la parte inferior, o simplemente puede buscar el paquete de caret R de Google, y podrá encontrar el paquete. 

#Las funciones integradas en el paquete de asistencia son algunas de las siguientes. 

#Entonces, por ejemplo, podemos usar las herramientas de preprocesamiento en el paquete de caret para limpiar los datos y configurar las funciones, de modo que puedan usarse para la predicción. 

#También podemos hacer una especie de validación cruzada y división de datos dentro del conjunto de entrenamiento, utilizando las funciones de creación de DataPartition y creación de TimeSlices. 

#También podemos crear conjuntos de entrenamiento y prueba con las funciones de train y predict. 

#Y podemos usarlos para entrenar conjuntos de datos en funciones de predicción de entrenamiento y aplicarlos a nuevos conjuntos de datos. 

#También podemos hacer una comparación de modelos utilizando la función de matriz de confusión, que le dará información sobre el rendimiento del modelo en nuevos conjuntos de datos. 



#Existen grandes algoritmos de aprendizaje automático que están integrados en R, por lo que van desde algoritmos estadísticos de aprendizaje automático muy populares como el análisis discriminante lineal y la regresión hasta algoritmos mucho más utilizados en informática, como máquinas de vectores de soporte, árboles de clasificación y regresión, o aleatorios bosques o impulso. 

#Todos estos algoritmos están construidos por una variedad de desarrolladores diferentes, todos provenientes de diferentes orígenes, por lo que las interfaces con cada uno de estos tipos de algoritmos de predicción son ligeramente diferentes. 

#Como ejemplo de esto, considere esta clase de algoritmos de predicción diferentes que podría haber aplicado, desde el análisis de discriminación lineal hasta el impulso. 

#Entonces, para cada uno de estos algoritmos diferentes, puede imaginarse la creación de un objeto llamado objnr. 

#Ese objeto tendrá una clase diferente, digamos un análisis discriminado lineal o glm y así sucesivamente. Y para cada uno de estos objetos, podemos intentar predecir, y si aplicamos la función de predicción, tenemos que hacer que pase parámetros ligeramente diferentes cada vez para obtener la predicción del resultado. 

#Entonces, por ejemplo, del paquete GLM, tenemos que decir que el tipo es igual a la respuesta para obtener la predicción de la respuesta a partir de ese ajuste del modelo. 

#O, por ejemplo, si queremos usar rpart, queremos predecir con tipo igual a probabilidad para predecir la respuesta. En cada caso, son un poco diferentes, y el paquete de caret proporciona un marco unificador que le permite predecir usando solo una función y sin tener que especificar todas las opciones que le podrían interesar para obtener la misma predicción. 

#Así que aquí hay un ejemplo rápido, usando el paquete de caret. Entraremos en los detalles de cómo se hace esto muy específicamente en ejemplos posteriores. 
library(caret)
library(kernlab)
data(spam)

inTrain <- createDataPartition(y=spam$type,
                               p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
dim(training)



#Así que aquí hemos cargado el paquete caret y también hemos cargado el paquete kern lab para obtener el conjunto de datos de spam. 

#Entonces, lo que podemos hacer primero es dividir la configuración de datos en un entrenamiento y un conjunto de prueba. 


#Aquí voy a usar el tipo de correo no deseado y lo dividiré en el conjunto de entrenamiento y el conjunto de prueba. Voy a decir que usaremos aproximadamente el 75% de nuestros datos para entrenar el modelo y el 25% para probar. 

#Entonces, lo que puedo hacer es poder crear un subconjunto de los datos en los datos de entrenamiento usando el objeto en entrenamiento, bit, en entrenamiento, que sale de crear partición de datos, y puedo crear el conjunto de datos de prueba encontrando todas esas muestras que no están en el set de entrenamiento. 

#Entonces esto me dará un subconjunto de esos datos que son solo para entrenamiento y un subconjunto de los datos que se ajustan para las pruebas. 

#Y puede hacer esto con una especie de interfaz simple. A continuación, puede ajustar un modelo, así que aquí voy a usar el comando train() del paquete de caret, y de nuevo estoy tratando de predecir el tipo. 

set.seed(32343)
modelFit <- train(type ~.,data=training, method="glm")
modelFit


#Y utilizo la tilde y el punto para decir que use todas las demás variables en este marco de datos para predecir el tipo. Y digo en qué conjunto de datos quiero construir el modelo de entrenamiento y, en este caso, el conjunto de datos de entrenamiento que creamos en la diapositiva anterior. 

#Y luego solo digo cuál de los métodos me gustaría usar, para que pueda usar GLM o puede usar un montón de otros modelos diferentes. 

#Entonces, lo que hace es crear un ajuste de modelo a partir de la función de entrenamiento, y como usamos las 3451 muestras en un conjunto de entrenamiento y los 57 predictores para predecir a qué clase pertenece en función de un modelo, un modelo GLM.

#Entonces, lo que puede hacer es hacer un montón de formas diferentes de probar si este modelo funcionará bien y usarlo para seleccionar el mejor modelo. Y en este caso usó remuestreo. Y hace bootstrap con 25 réplicas, y corrige el sesgo potencial que podría provenir del muestreo de bootstrap.


#Entonces, una vez que ajustamos ese modelo, podemos realmente mirar el modelo, y entonces la forma en que podemos hacerlo es mirar el componente finalModel del objeto modelFit. 

modelFit <- train(type ~.,data=training, method="glm")
modelFit$finalModel

#Y la forma en que lo hace es tomar el objeto modelFit, y luego escribe el signo de dólar y luego siempre el mismo modelo final. 

#Le dirá cuáles son los valores ajustados reales que obtuvo para ese modelo GLM. Luego, predice sobre nuevas muestras utilizando el comando de predicción. 

#Nuevamente, es un marco unificado, por lo que solo escribimos predecir. Le pasamos el modelFit que obtuvimos del entrenamiento, funcion caret, y le pasamos sobre qué datos nos gustaría que prediga. 

predictions <- predict(modelFit,newdata=testing)
predictions



#Entonces, en este caso, los nuevos datos son los datos de prueba. Cuando haga eso, le dará un conjunto de predicciones que corresponden a las respuestas, y puede usarlas para tratar de evaluar si el ajuste de su modelo funciona muy bien o no. 

#Una forma de hacerlo es calculando la matriz de confusión, por lo que está usando esta función de matriz de confusión, y entonces observe la M mayúscula aquí. 

confusionMatrix(predictions,testing$type)

#No se lo pierda cuando escriba la matriz de confusión. Luego pasa las predicciones que obtuvo del ajuste de su modelo. Y luego el resultado real de las muestras de prueba. 

#Entonces, en este caso, era el tipo o si era spam o mensaje de HAM. Y luego registrará la matriz de confusión. Así que le indicará una tabla para cuál de los casos predijo que no sería spam o en realidad no sería spam, cuáles son los casos en los que fue spam y predijo que sería spam, etc. 

#Y luego le brinda un montón de estadísticas resumidas. Entonces, por ejemplo, la precisión, un intervalo de confianza del 95 por ciento para la precisión y luego un montón de información sobre qué tan bien se corresponden en otras categorías. 

#Entonces, por ejemplo, la sensibilidad y la especificidad de eso. Entonces, la función de matriz de confusión envuelve un montón de medidas de precisión diferentes que es posible que desee obtener cuando evalúe el ajuste del modelo. 

#Para obtener mucha más información sobre el intercalado, cubriremos mucho de él en esta clase en términos de cómo se aplica realmente el paquete de caret. Pero descubrí que estos tutoriales son realmente muy buenos y pueden ser muy útiles para cubrir material que no cubrimos en esta clase. Y también hay un artículo muy agradable en la revista de software estadístico que presenta el paquete de caret si desea más información.

