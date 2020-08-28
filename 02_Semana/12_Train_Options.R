#Training Options

#Esta es una breve charla sobre algunas de las opciones de control de entrenamiento que tiene al enentrenamientoar mientras usa el paquete de intercalación. 

#Para esta conferencia, usaremos el ejemplo de spam nuevamente solo para ilustrar cómo funcionan estas ideas. Así que cargamos el paquete caret, el paquete kernlab y luego adjuntamos el conjunto de datos de spam. 

library(caret)
library(kernlab)
data(spam)

inTrain <- createDataPartition(y=spam$type,
                               p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]

modelFit <- train(type ~.,data=training, method="glm")

#Luego usamos la función createDataPartition para crear un conjunto de endices correspondientes al conjunto de entrenamiento. Y configuramos aproximadamente el 75% de los datos para que estén en el conjunto de entrenamiento. 

#Luego, definimos conjuntos de entrenamiento y prueba usando esas funciones de indicador. Entonces, por lo general, lo que haría cuando se ajusta a un modelo es básicamente usar la función de entrenamiento, como esta, donde básicamente establece todos los valores predeterminados para que sean los valores predeterminados que la función de entrenamiento elija para usted. Aparte del método que va a utilizar para ajustar y qué conjunto de datos va a utilizar. Sin embargo, puedes ir un poco más lejos. 

args(trainControl)

#Por ejemplo, puede utilizar un gran conjunto de opciones para la formación. Entonces, aquí hay un par de ellos. Uno, puede usar este parámetro preProcess para establecer un montón de opciones de preprocesamiento. 

#Hablaremos de eso en una conferencia futura. También puede establecer pesos. En otras palabras, puede subir o bajar el peso de determinadas observaciones. 

#Estos son particularmente útiles si tiene un conjunto de entrenamiento muy desequilibrado en el que tiene muchos más ejemplos de un tipo que de otro. Puede establecer la métrica, por lo que de forma predeterminada para la variable de factor, en otras palabras, para las variables categóricas, la métrica predeterminada es la precisión que está tratando de maximizar. 

#Para las variables continuas es la raíz del error cuadrático medio, como hablamos en una conferencia anterior. Por lo tanto, también puede establecer una gran cantidad de otros parámetros de control usando este parámetro trControl aquí y debe pasarle una llamada a esta función en particular, trainControl, de la que hablaremos en un par de diapositivas.

#Por lo tanto, las opciones métricas están integradas en la función de entrenamiento para obtener resultados continuos.

#Nuestro RMSE, o error cuadrático medio. También puede utilizar RSquared. Este es el RSquared que obtiene de un modelo de regresión si lo recuerda de la clase de inferencia. RSquared es una medida de concordancia lineal entre las variables que predice y las variables con las que predice. 

#La concordancia lineal es muy útil si está utilizando regresión lineal y cosas así. Puede que no sea tan útil si está haciendo cosas más no lineales como bosques aleatorios, etc. La precisión es la fracción correcta. Así que ese es el número correcto. Y esa es la medida predeterminada de precisión para los resultados categóricos. También puede decirle que use Kappa, que es una medida de concordancia. He vinculado aquí a una definición de esa medida. Es una medida más profunda y complicada que se usa con frecuencia en algunas competiciones como y otras competiciones. 

#El argumento trainControl le permite ser mucho más preciso sobre la forma en que enentrenamientoa modelos. Puede decirle qué método utilizar para volver a muestrear los datos, ya sea mediante arranque o validación cruzada, de lo que hablaremos en un minuto. 

#Puede indicarle la cantidad de veces que debe realizar bootstrapping o validación cruzada. También puede decirle cuántas veces debe repetir todo el proceso si desea tener cuidado con la validación cruzada repetida. Puede decirle el tamaño del conjunto de entrenamiento con este parámetro p, y luego puede decirle un montón de otros parámetros que dependen de los problemas específicos en los que está trabajando. 

#Entonces, por ejemplo, para los datos del curso de tiempo, la ventana inicial le dice el tamaño del conjunto de datos de entrenamiento, el tamaño del número de puntos de tiempo que estarán en los datos de entrenamiento. Y el horizonte es la cantidad de puntos de tiempo que estarás prediciendo. También puede hacer que devuelva las predicciones reales de cada una de las iteraciones cuando está construyendo el modelo. 

#También puede hacer que devuelva un resumen diferente, use una función de resumen diferente a la del resumen predeterminado si lo desea. Y luego puede establecer opciones de preprocesamiento, así como cosas como límites de predicción, y puede establecer las semillas para todas las diferentes capas de remuestreo. Esto es particularmente útil si va a paralelizar sus cálculos en varios núcleos. 

#No lo cubriremos demasiado aquí, pero si está enentrenamientoando modelos en una gran cantidad de muestras con una gran cantidad de predictores, el uso del procesamiento en paralelo puede ser muy útil para demostrar la eficiencia computacional de su análisis. 

#Para remuestrear, se ofrecen varios métodos, por lo que esto se pasa nuevamente a la función trainControl. Puede usar bootstrapping estándar, puede usar bootstrapping que se ajusta al hecho de que varias muestras se vuelven a muestrear repetidamente cuando está haciendo ese submuestreo. Esto reducirá parte del sesgo debido al bootstrapping.

#Puede usar la validación cruzada, que es un método del que hemos hablado en conferencias anteriores. También puede utilizar la validación cruzada repetida si desea realizar una validación cruzada secundaria con diferentes sorteos aleatorios. 

#Puede usar la validación cruzada de omitir uno y recordar que hay un sesgo durante su compensación entre el uso de una gran cantidad de pliegues y una menor cantidad de pliegues al realizar la validación cruzada. También puede indicarle la cantidad de muestras de arranque o la cantidad de submuestras que debe tomar y la cantidad de veces que debe repetir ese submuestreo si está haciendo algo como la validación cruzada repetida. Todos estos parámetros se pueden configurar. 

#En general, los valores predeterminados funcionan bastante bien, pero si tiene una gran cantidad de muestras o tiene un modelo que requiere un ajuste fino en una gran cantidad de parámetros, es posible que desee aumentar, por ejemplo, la cantidad de muestras de validación cruzada o bootstrap que necesita. tomar. 

#Finalmente, un componente importante de la formación de estos modelos es sembrar la semilla. Entonces, lo que quiero decir con eso es que la mayoría de estos procedimientos se basan en un remuestreo aleatorio de los datos. Y si vuelve a ejecutar el protocolo nuevamente, o vuelve a ejecutar el código nuevamente, obtendrá una respuesta ligeramente diferente porque se creó un sorteo aleatorio cuando estaba haciendo una validación cruzada. 

#Si establece una semilla, una semilla de número aleatorio, lo que hará es garantizar que se generen los mismos números aleatorios cada vez. Es un concepto un poco difícil de entender, pero la idea es que la computadora está generando números pseudoaleatorios. Y si establece la semilla, volverá a generar la misma secuencia de números pseudoaleatorios. 

set.seed(1235)
modelFit2 <- train(type ~.,data=training, method="glm")
modelFit2



#A menudo es muy útil establecer la semilla general. Esta es una semilla para todo el procedimiento para que obtenga resultados repetibles. Si está haciendo cálculos en paralelo, también puede establecer la semilla para cada remuestreo. 
#Puede hacerlo con un argumento semilla para la función de control del entrenamiento. La siembra de cada remuestreo es particularmente útil para ajustes paralelos, pero a menudo no es necesario cuando está haciendo todo su procesamiento de una manera que no es paralela. 

#Entonces, aquí hay un ejemplo de eso. Si configuro la semilla usando la función set.seed en R, y luego le doy un número, un número entero, establecerá una semilla que es consistente con el análisis de rendimiento. Entonces generará un conjunto de números aleatorios que sea consistente. 

#Entonces, si encajo mi modelo, así, cuando genere muestras de arranque. Generará esas muestras de arranque de acuerdo con los números aleatorios que provienen de esta semilla. Si luego restablezco la semilla nuevamente y ajusto el modelo nuevamente, ahora con un número diferente, modelFit3 en lugar de modelFit2, obtendré exactamente las mismas muestras de arranque y exactamente las mismas medidas de precisión nuevamente. 

set.seed(1235)
modelFit3 <- train(type ~.,data=training, method="glm")
modelFit3


#Esto es importante cuando está enentrenamientoando modelos y luego desea compartir su conjunto de datos de entrenamiento con otra persona y asegurarse de obtener la misma respuesta cuando ejecutan el mismo código. Hay más información sobre esto en el tutorial de intercalación que creo que es muy bueno. Y también en este documento sobre el entrenamiento de modelos y el ajuste con el paquete de intercalación.
