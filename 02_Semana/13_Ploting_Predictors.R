#Plotting_Predictors

#Uno de los componentes más importantes de la construcción de un algoritmo de aprendizaje automático o un modelo de predicción es comprender cómo se ven realmente los datos y cómo interactúan entre sí. Entonces, la mejor manera de hacerlo es trazando los datos, en particular trazando los predictores. 

#Entonces, para este ejemplo, usaremos estos datos de salarios. Entonces, los datos de salarios son en realidad datos del paquete ISLR. Que puedes encontrar en este enlace. Y es del libro Introducción al aprendizaje estadístico. Por tanto, analizaremos estos datos y veremos cómo podemos utilizarlos para la predicción. Entonces, si cargo el paquete ISLR. 

#Una vez más, tendré que instalarlo primero y luego puedo cargarlo. Y también cargo el paquete ggplot2 porque lo usaremos para algunos gráficos. Y el paquete de intercalación, porque lo usaremos para la construcción de modelos. 

library(ISLR)
library(ggplot2)
library(caret)
library(gridExtra)
library(Hmisc)

data(Wage)

summary(Wage)

#Los datos de salarios están en realidad en el paquete ISLR, y puedo cargarlos con datos y un salario de capital. Y luego puedo ver un resumen de esos datos salariales para ver todas las diferentes variables que están allí. 

#Entonces tenemos el año de los datos que se recopilan. La edad de la persona sobre la que se recopilan los datos. En este caso, son solo personas masculinas en este conjunto de datos, el estado civil de esas personas, su raza, educación, la región donde estaban, los datos que se recopilaron son solo la región del Atlántico Medio y luego los diferentes tipos de clases de trabajo y su salud. Entonces, esto le brinda un poco de información sobre el tipo de datos que vamos a ver. 

#Y ya puede ver que hemos detectado algunas características interesantes de estos datos con solo mirar un resumen aquí. Sabemos que todos son hombres. Sabemos que todos están en la región del Atlántico Medio, por ejemplo. Entonces, lo que hacemos de nuevo, como siempre, es crear un conjunto de entrenamiento y un conjunto de prueba. Incluso antes de hacer la exploración, dejaremos de lado el conjunto de pruebas y no lo usaremos para nada hasta que miremos los datos al final de la experiencia de creación de modelos y los apliquemos solo una vez. 

inTrain <- createDataPartition(y=Wage$wage,
                               p=0.7, list=FALSE)
training <- Wage[inTrain,]
testing <- Wage[-inTrain,]
dim(training)
dim(testing)


#Así que vamos a hacer todo nuestro trazado en el conjunto de entrenamiento. Entonces, un ejemplo es usar este diagrama de características, diagrama que proviene del paquete de intercalación. 

#Entonces, esta trama trazará básicamente todas las características entre sí, por lo que esta trama parece un poco confusa para estos datos, así que pensé en revisarla. 

featurePlot(x=training[,c("age","education","jobclass")],
            y = training$wage,
            plot="pairs")


#Así que aquí estoy, usando como resultado, estoy diciendo que el resultado es el salario. Y luego voy a mirar todas estas diferentes variables, edad, educación y clase laboral. 

#Entonces, en primer lugar, tengo esta variable y, así que ese es el resultado que nos importa, y aquí las diferentes variables. Tengo edad, educación, no se puede leer con mucha claridad en esta trama, pero si lo haces tú mismo puedes, y clase de trabajo aquí. 

#Entonces, cuál es esta trama, esta es la trama aquí del resultado y versus la clase de trabajo aquí. Como puede ver, puede hacer eso para cada cuadro, así que si quiere ver la trama de la clase de trabajo versus la educación, esa es la trama aquí. 

#Y es el mismo gráfico aquí, solo que con el eje invertido y así sucesivamente. Entonces le muestra todas las variables que tiene aquí, representadas entre sí. Y en particular, lo que está buscando, aquí están todas las gráficas correspondientes a cada una de las variables trazadas frente a la variable y. 

#Y está buscando cualquier variable que parezca mostrar una relación con la variable y. Entonces, por ejemplo, puede ver que parece haber una tendencia aquí entre educación y salario, por ejemplo. 

#Así que esta es una forma de ver todos los datos. Otra cosa que vas a usar es Qplot, función en el paquete ggplot2 o simplemente la función plot base R.Así que aquí estoy graficando edad versus salario, y para que puedas ver de nuevo, parece que hay algo tipo de tendencia con la edad y los salarios. 

qplot(age,wage,data=training)

#Pero también ve, una cosa que nota con frecuencia al hacer tramas como esta. Aquí hay algunos patrones muy extraños.

#Como puede ver, hay una gran cantidad de observaciones que parecen ser muy diferentes a la relación que existe aquí para estas partes. Entonces, una cosa que podríamos querer hacer es tratar de averiguar por qué existe esa extraña relación entre edades y salarios antes de construir nuestro modelo. Entonces, una cosa que podríamos hacer es, por ejemplo, usar el paquete ggplot2, colorear ese gráfico con diferentes variables.

qplot(age,wage,colour=jobclass,data=training)

#Entonces, nuevamente, tracé la edad versus el salario, por lo que en el eje x está la edad, en el eje y está el salario. Pero ahora lo he coloreado por la clase de trabajo. Y entonces puede hacerlo pasando el color del parámetro a la función two plot. Y lo que ves ahora es que la mayoría de las personas que están en esta otra parte, provienen de trabajos basados en información en contraposición a trabajos industriales. Entonces eso podría explicar gran parte de la diferencia aquí entre estas dos grandes clases de observaciones.

#Entonces, esto le brinda una forma de detectar variables que podrían ser importantes en su modelo. Porque muestran variación en los datos. Por lo que también puede agregar suavizadores de regresión. Así que, por ejemplo, ahora, lo que he hecho es que he vuelto a hacer un diagrama de edad versus salario, pero ahora lo he coloreado por la educación. Entonces, lo que puedo hacer es usar la función geom_smooth para aplicar un suavizador lineal a los datos. Habría aprendido sobre esto en Análisis de datos exploratorios, pero si no, puede ver la función aquí. 


qq <- qplot(age,wage,colour=education,data=training)
qq +  geom_smooth(method='lm',formula=y~x)


#Y lo que hace es para cada clase de educación diferente, se ajusta a un modelo lineal, por lo que puede ver que hay una línea púrpura aquí. Y eso corresponde a personas con títulos avanzados y luego puede ver, por ejemplo, una línea verde aquí, que corresponde a personas con alguna universidad y así sucesivamente. Y para que puedas ver si hay una relación para diferentes grupos de edad. 

#La otra cosa que puede ser que a menudo es muy útil es dividir cosas como la variable de salario en diferentes categorías porque a veces está claro que categorías específicas parecen tener relaciones diferentes. La forma en que tiendo a hacer eso es con la función cut2, que está en el paquete Hmisc. 

cutWage <- cut2(training$wage,g=3)
table(cutWage)


#Entonces, si carga el paquete Hmisc y luego usa cut2, puede decirle con el parámetro g en cuántos grupos dividir el conjunto de datos. Y dividirá la configuración de datos en factores basados en grupos de cuantiles. Entonces, todas las observaciones que caigan entre 20.1 y 91.7 en la variable de salario se asignarán a este nivel de factor y luego todos los valores entre 91.7 y 118.9 se asignarán a este grupo y así sucesivamente. 

#Entonces, lo que puede hacer ahora es usar eso para hacer diferentes tipos de gráficos. Entonces, supongamos que quisiera graficar salario versus, oh, lo siento, grupos de salarios versus edad, ahora puedo, usar qplot nuevamente, pero ahora puedo pasarle la geometría del diagrama de caja. 

p1 <- qplot(cutWage,age, data=training,fill=cutWage,
            geom=c("boxplot"))
p1

#Y luego puedo decir que está bien, quiero ver la trama de estos diferentes grupos salariales frente a la edad y, a veces, eso puede hacer que sea más fácil ver las diferentes tendencias que están surgiendo. Por ejemplo, aquí puede ver un poco más claramente la relación entre edad y salario. La otra cosa que puede querer hacer es agregar encima de los diagramas de caja, en realidad los puntos mismos. La razón por la que puede querer hacer esto es porque a veces los diagramas de caja pueden ocultar cuántos puntos se muestran aquí y, por lo tanto, una cosa que puede hacer es decir, pasar tanto el diagrama de caja como el jitter y puede tenerlo, organizar la gráfica para que pueda ver tanto la gráfica de caja como la gráfica de caja con puntos superpuestos.

p2 <- qplot(cutWage,age, data=training,fill=cutWage,
            geom=c("boxplot","jitter"))
grid.arrange(p1,p2,ncol=2)


#Así que eso es lo que está haciendo el arreglo de cuadrícula, en realidad está generando los dos gráficos. Así que p1 fue el diagrama que hicimos en la diapositiva anterior. Y p2 es el gráfico que hicimos aquí con puntos superpuestos. Y la disposición de la cuadrícula hace dos plots una al lado de la otra. Entonces, puede ver aquí, a partir de los puntos, que hay una gran cantidad de puntos en cada uno de los diferentes cuadros y eso sugiere que esta tendencia, cualquier tendencia de un usuario, puede ser real. Si observa solo uno de los pocos puntos en los cuadros, significa que tal vez ese cuadro en particular no sea muy representativo de cómo se veían realmente los datos. Otra cosa que es muy útil es que puedes usar la variable de corte, la versión factorizada de la variable continua para mirar tablas de datos. 

t1 <- table(cutWage,training$jobclass)
t1
prop.table(t1,1)

#Así que aquí estoy haciendo una tabla comparando esta versión factorial de salarios con la clase de trabajo y así puedo ver, por ejemplo, que hay más trabajos industriales en la variable de salario más bajo que trabajos de información. 

#Y esa tendencia se invierte para los trabajos en las carreteras. Hay menos gente industrial y más gente de información. También puede usar la tabla de accesorios para obtener las proporciones en cada grupo. Entonces aquí está la proporción, al pasar uno, digo que quiero obtener la proporción en cada fila. Entonces, si lo aprobara a las dos aquí, me daría la proporción en cada columna. Entonces aquí veo que el 62% de los trabajos de bajo salario van, corresponden a industriales, y el 37%, 38% corresponden a información. Y entonces puede usar eso para tener una idea de cómo cambian esas proporciones en los diferentes niveles salariales. Por último, puede utilizar gráficos de densidad para trazar los valores de predictores continuos. 


qplot(wage,colour=education,data=training,geom="density")


#Así que aquí de nuevo estoy usando la función qplot. Estoy trazando la variable de salario, y estoy trazando una gráfica de densidad, versus educación. Esto básicamente muestra dónde está la mayor parte de los datos. Entonces, en el eje x está el salario. Y en el eje y hay una especie de proporción de la variable que cae en ese contenedor del eje x.

#Y entonces puede ver, por ejemplo, que los graduados de la escuela secundaria tienden a tener más valores que están aquí abajo en la parte inferior del rango, y la gente de grados avanzados tiende a ser un poco más alta, y también hay un grupo, un grupo externo aquí, que tiende a ser muy alto tanto para el título avanzado como para los graduados universitarios, que se muestra en azul. 

#Entonces, a veces, los diagramas de densidad pueden mostrar cosas que los diagramas de caja no necesariamente pueden hacer. También es más fácil superponer varias distribuciones cuando se realizan gráficos de densidad. En otras palabras, si divide las cosas en varios grupos diferentes y desea ver cómo cambian todas las distribuciones por grupo, las gráficas de densidad pueden ser muy útiles. Por lo tanto, una cosa a tener en cuenta es hacer sus gráficos solo en los datos de entrenamiento. 

#El equipo de prueba, nuevamente, no se puede usar para exploración. Eso sería similar a entrenar su modelo en el conjunto de prueba, que, como deberíamos, comentamos anteriormente, conducirá a un sobreajuste. Lo que debería buscar en estos gráficos es el desequilibrio en los resultados de los predictores. Si ve, todos los predictores tienden a ser un valor en un grupo de resultados y no en otro grupo de resultados. Entonces verá que es un buen predictor. Pero si ve eso, solo tiene tres de un resultado y 150 del otro resultado, eso significa que será muy difícil construir un clasificador preciso entre esas dos clases. 

#Está buscando valores atípicos o grupos extraños que se alejen de los datos y que puedan sugerir que faltan algunas variables. Y grupos de puntos que no son explicados por ninguno de los predictores. Variables sesgadas que querrá transformar y hacer que se vean mejor, más bien distribuidas normalmente si está usando cosas como modelos de regresión, pero eso puede no importar tanto como si estuviera usando más métodos de aprendizaje automático. Para obtener más información sobre el trazado en general, puede consultar el tutorial de ggplot2. También puede tomar la clase de análisis de datos exploratorios en esta especialización en ciencia de datos o puede ver el tutorial de visualización de signos de intercalación, porque eso le dará un poco más de información sobre gráficos específicos de predicción que podrían ser útiles.