#Forecasting 

#Esta conferencia trata sobre la predicción, que es un tipo de problema de predicción muy específico. Y normalmente se aplica a cosas como datos de series de tiempo. Entonces, por ejemplo, este es el stock de información de Google en el NASDAQ, y también lo es este símbolo GOOG. Y puede ver con el tiempo que hay un precio para esta acción y sube y baja. Así que esto introduce algunos tipos muy específicos de estructura dependiente y algunos desafíos adicionales que deben tenerse en cuenta al realizar la predicción. Entonces, en primer lugar, los datos son dependientes a lo largo del tiempo y, por lo tanto, eso solo hace que la predicción sea un poco más desafiante que cuando tiene ejemplos independientes. También hay algunos tipos de patrones específicos a los que se debe prestar atención. Las tendencias, como aumentos o disminuciones a largo plazo, los patrones estacionales son muy comunes en este tipo de datos. Por ejemplo, patrones estacionales durante semanas, meses, años, etc. Ciclos, patrones que suben y bajan periódicamente durante un período mayor a un año, por ejemplo. Aquí, el submuestreo y el entrenamiento y la prueba pueden ser un poco más complicados porque no puede simplemente asignar muestras al azar al entrenamiento y la prueba. Debe aprovechar el hecho de que en realidad hay momentos específicos que se están muestreando y que los puntos dependen del tiempo. Problemas similares surgen en las predicciones de la guarida espacial, los datos espaciales. Por ejemplo, existe una dependencia entre las observaciones cercanas y puede haber efectos específicos de la ubicación que deben modelarse al realizar la predicción. Por lo general, el objetivo aquí es predecir una o más observaciones en el futuro y se pueden usar todos los algoritmos de predicción estándar, pero debe ser un poco cauteloso acerca de cómo los usa. Por lo tanto, una cosa a tener en cuenta es que debe tener cuidado con las correlaciones falsas. Por lo tanto, las series de tiempo a menudo pueden correlacionarse por razones que no las hacen buenas para predecir una de la otra. Entonces, si observa, puede ir a Google Correlate para correlacionar diferentes palabras a lo largo del tiempo, la frecuencia de diferentes palabras a lo largo del tiempo. Y así, por ejemplo, aquí puede ver una correlación entre el precio de las acciones de Google, que se muestra en azul, y la red de solitario, que está en rojo. Entonces, esos no necesariamente tienen nada que ver entre sí, pero tienen una correlación muy alta, y podría pensar que podría predecir uno del otro, aunque en el futuro, podrían divergir. sustancialmente porque no están necesariamente relacionados entre sí en absoluto. También es muy común en el análisis geográfico. En realidad, esta es una caricatura de xkcd que muestra que los mapas de calor, en particular los mapas de calor basados en la población, tenían formas muy similares debido al lugar donde viven muchas personas. Entonces, por ejemplo, los usuarios de un sitio en particular o los suscriptores de una revista en particular o el consumidor, los consumidores de un tipo particular de sitio web pueden aparecer en lugares muy similares porque la mayor densidad de población en los Estados Unidos se encuentra aquí en la costa este. Y entonces, ves mapas de calor muy similares de una gran cantidad de personas en todos esos lugares diferentes. También debe tener cuidado con la extrapolación. Así que este es un ejemplo divertido que muestra lo que sucede si extrapolas series de tiempo sin tener cuidado con lo que podría suceder. Así que esto muestra a gran escala el tiempo ganador de una gran cantidad de carreras que ocurrieron en los Juegos Olímpicos. Los tiempos azules son hombres y los tiempos rojos son mujeres, y estos autores de este artículo extrapolaron al futuro y dijeron que en 2156 sería cuando las mujeres correrían más rápido que los hombres en el sprint. Y aunque no sabemos cuándo eso, cuándo o cuándo puede ocurrir o no, una cosa que se señaló es que este tipo de extrapolación es muy peligrosa. Eventualmente, en algún momento en el futuro, se pronosticará que tanto hombres como mujeres correrán tiempos negativos para los 100 metros. Por lo tanto, debe tener mucho cuidado con qué tan lejos extrapola de sus datos. Entonces, voy a mostrar un ejemplo rápido de algunos pronósticos usando el paquete quantmod y algunos datos de Google. Entonces, si cargo este paquete quantmod y puedo, puedo cargar un montón de datos del símbolo bursátil de Google. Y puedo obtenerlo del conjunto de datos financieros de Google. Entonces, si miro esta variable de Google, obtengo la información de apertura, máximo, mínimo, cierre y volumen de una acción de Google en particular desde el 1 de enero de 2008 hasta el 31 de diciembre de 2013. Así que puedo resumir esto mensualmente y almacenar como una serie de tiempo. 


library(quantmod)
from.dat <- as.Date("01/01/08", format="%m/%d/%y")
to.dat <- as.Date("12/31/13", format="%m/%d/%y")
getSymbols("GOOG", src="yahoo", from = from.dat, to = to.dat)
head(GOOG)


#Entonces puedo usar la variable o función de dos meses para convertir eso en una serie de tiempo mensual. Y puedo simplemente tomar la información de apertura, y luego puedo crear un objeto de serie de tiempo usando la función ts en R.

mGoog <- to.monthly(GOOG)
googOpen <- Op(mGoog)
ts1 <- ts(googOpen,frequency=12)
plot(ts1,xlab="Years+1", ylab="GOOG")


#Y si trazo eso, puedo ver aquí los precios de apertura mensuales de Google durante un período de siete años. Entonces, un ejemplo de descomposición de series de tiempo descompondría esta serie de tiempo en una tendencia, cualquier tipo de patrón consistente, un patrón estacional a lo largo del tiempo y patrones cíclicos donde los datos aumentan y disminuyen durante períodos no fijos. Entonces, una forma en que podemos hacer esto es con la función de descomposición en R. 

plot(decompose(ts1),xlab="Years+1")

#Entonces, si descompongo esto de manera aditiva, entonces puedo ver que hay una variable de tendencia que parece ser una tendencia ascendente del precio de las acciones de Google. También parece haber un patrón estacional, así como un patrón cíclico más aleatorio en el conjunto de datos. 

#Entonces, esto está descomponiendo esta serie aquí en una serie de diferentes tipos de patrones en los datos. Entonces, aquí para los conjuntos de entrenamiento y prueba, tengo que construir conjuntos de entrenamiento y prueba que tengan puntos de tiempo consecutivos. Así que aquí estoy construyendo un conjunto de entrenamiento que comienza en el punto de tiempo 1 y termina en el punto de tiempo 5. Y luego un conjunto de prueba que es el siguiente conjunto de puntos consecutivos después de eso. De esa manera, siempre puedo crear un conjunto de entrenamiento y aplicarlo a un conjunto de prueba que tiene puntos de tiempo consecutivos que muestran el mismo tipo de tendencias que he observado en mis datos.


ts1Train <- window(ts1,start=1,end=5)
ts1Test <- window(ts1,start=5,end=(7-0.01))
ts1Train




#Entonces, hay un par de formas diferentes de realizar pronósticos. 

library(forecast)

plot(ts1Train)
lines(ma(ts1Train,order=3),col="red")


#Una es hacer un promedio móvil simple, que en otras palabras, básicamente promedia todos los valores de, para un punto de tiempo particular. Y la predicción será el promedio del tiempo anterior apunta a un tiempo en particular. También puede hacer un suavizado exponencial. En otras palabras, básicamente ponderamos los puntos de tiempo cercanos como valores más altos o con más peso que los puntos de tiempo que están más lejos. 

ets1 <- ets(ts1Train,model="MMM")
fcast <- forecast(ets1)
plot(fcast)
lines(ts1Test,col="red")


#Entonces, hay una gran cantidad de clases diferentes de modelos de suavizado que puede elegir. Y para el suavizado exponencial, puede obtener un modelo, puede ajustarlo, en el que tiene diferentes opciones para los diferentes tipos de tendencias que quizás desee ajustar. Y luego, cuando pronostica, puede obtener una predicción que surge de su modelo de pronóstico. Y también puede obtener una especie de límites de predicción para cuáles son los valores posibles que podría obtener de esa predicción. 

accuracy(fcast,ts1Test)


#Y puede obtener la precisión utilizando esta función de precisión, por lo que básicamente puede obtener la precisión de su pronóstico usando su conjunto de prueba, y le dará la raíz cuadrada media al error y otras métricas que son más apropiadas para el pronóstico. Obviamente, pasé por esto muy rápido y, por lo tanto, si desea más información, en realidad hay un campo completo dedicado a la predicción y la predicción de series de tiempo. Y recomiendo encarecidamente el pronóstico de Rob Hyndman: principios y práctica. Este es un libro gratuito que está en línea y es realmente bueno, y tiene mucha información sobre cómo comenzar a realizar pronósticos. Por lo tanto, las precauciones deben tener cuidado con las correlaciones falsas. Tenga mucho cuidado con lo lejos que predice, prediga el futuro con expreso, extrapolación y desconfíe de las dependencias como los efectos estacionales a lo largo del tiempo. Si desea información sobre usted, para la predicción financiera y el pronóstico financiero, los paquetes quantmod y quandl también son muy útiles en esa área.
