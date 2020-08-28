#Covariate Creation

#Esta conferencia trata sobre la creación de covariables. Las covariables a veces se denominan predictores y, a veces, características. 

#Son las variables que realmente incluirá en su modelo que utilizará para combinarlas y predecir cualquier resultado que le interese. Hay dos niveles de creación de covariables o creación de características. 

#El primer nivel es tomar los datos sin procesar que tiene y convertirlos en un predictor que puede usar. Por lo tanto, los datos sin procesar a menudo toman la forma de una imagen, un archivo de texto o un sitio web. Es muy difícil construir un modelo predictivo con ese tipo de información cuando no se ha resumido la información de alguna manera útil en una variable cuantitativa o cualitativa. 

#Entonces, lo que queremos hacer es tomar esos datos sin procesar y convertirlos en características o covariables que son variables que describen los datos tanto como sea posible mientras brindan algo de compresión y facilitan el ajuste de algoritmos estándar de aprendizaje automático. Entonces, la idea aquí es, así que suponga que tiene un correo electrónico, este es un correo electrónico, un correo electrónico de ejemplo aquí a la izquierda. 

#Por lo tanto, es muy difícil conectar el correo electrónico en una función de predicción, porque la mayoría de las funciones de predicción se basan en la idea de tomar una pequeña cantidad de variables y construir un modelo cuantitativo alrededor de ellas y no funciona para un texto libre, por ejemplo. . Entonces, lo primero que debe hacer es crear algunas características, y esas características son solo variables que describen los datos sin procesar. 

#Entonces, en este caso, en el caso de un correo electrónico, podríamos pensar en diferentes formas en las que podríamos describir este correo electrónico. Por ejemplo, cuando calculo la cantidad promedio de mayúsculas que hay en el correo electrónico, en este caso, el 100% de las letras del correo electrónico son mayúsculas, podría decir cuál es la frecuencia con la que aparece una palabra en particular. 

#Entonces, por ejemplo, podría decir, ¿con qué frecuencia aparece? Y aparece dos veces en este correo electrónico, por lo que decimos que calculamos dos para este correo electrónico. Esa es una característica. También puede calcular el número de signos de dólar. Este podría ser un buen indicador de si un correo electrónico es spam o no. Y aquí puede ver que hay una gran cantidad de signos de dólar, hay ocho de ellos, por lo que calculamos otra característica de ese conjunto de datos. 


#Entonces este paso, los datos brutos de la covariable, generalmente implica pensar mucho en la estructura de los datos que tienes y cuál es la forma correcta de extraer, extraer la información más útil en el menor número de variables que capture todo lo que usted quiere. La siguiente etapa es la transformación de covariables ordenadas. En otras palabras, calculamos este número, digamos promedio de capital, el número promedio de capitales en el conjunto de datos. 

library(kernlab)

data(spam)

spam$capitalAveSq <- spam$capitalAve^2


#Pero puede que no sea el número promedio que está muy bien relacionado con el resultado que nos importa, podría ser el número promedio de mayúsculas al cuadrado o al cubo, o podría ser alguna otra función de eso. Entonces, la siguiente etapa es transformar las variables en una especie de variables más útiles. Entonces, por ejemplo, si cargamos los datos de kernlab y el conjunto de datos de spam, podemos tomar el promedio de capital, entonces, esta es básicamente esta variable aquí, la fracción de letras que son mayúsculas. Y podríamos elevar ese número al cuadrado y asignarlo a una nueva variable, el promedio de capital al cuadrado, que podría ser útil más adelante en nuestro algoritmo de predicción. 

#Entonces esos son los dos pasos para crear covariables. Entonces, el primer paso, los datos sin procesar, la covariable, realmente depende en gran medida de la aplicación. Entonces, como les mostré en la diapositiva anterior, en un caso de correo electrónico, podría estar extrayendo la fracción de veces que aparece una palabra o algo así. En el caso de la voz, podría ser saber algo sobre la frecuencia o el timbre del que suelen caer las voces. En el caso de las imágenes, podría ser características identificativas de las imágenes. 

#Entonces, si son caras, ¿dónde están las narices, las orejas o los ojos? Y dependerá mucho de cuál sea tu aplicación. Y el acto de equilibrio aquí es definitivamente el resumen versus la pérdida de información. En otras palabras, las mejores características son características que capturan solo la información relevante en, digamos, la imagen o el correo electrónico, y eliminan toda la información que no es realmente útil en absoluto. Entonces, la idea es que debe pensar con mucho cuidado sobre cómo elegir las características correctas que expliquen la mayor parte de lo que sucede en sus datos sin procesar. Entonces, algunos ejemplos aquí, para archivos de texto, podría ser la frecuencia de palabras o la frecuencia de frases. 

#Existe este sitio genial, Google ngrams, que le informa sobre la frecuencia de diferentes frases que aparecen en los libros que se remontan al pasado. Para las imágenes, pueden ser bordes y esquinas, manchas y crestas, por ejemplo. Todas estas son ideas sobre cómo identificar diferentes estructuras en una imagen. Para los sitios web, puede ser el número y el tipo de imágenes, dónde están los botones, los colores y los videos.

#Esta es un área de gran importancia en el desarrollo web que se llama pruebas A / B, que se denominan ensayos aleatorios y estadísticas, que básicamente muestra diferentes versiones de un sitio web con diferentes valores de estas diferentes características y predice cuál introducirá un más clics o conseguir que más personas compren productos. Para las personas, puede imaginar que las características de las personas son su altura, peso, color de cabello, etc. Es básicamente cualquier resumen de los datos sin procesar que puede hacer como una característica potencial. Y a menudo esto implica bastante pensamiento científico y perspicacia empresarial para saber cuáles son las covariables adecuadas para un problema en particular. 

#Entonces, cuanto más conocimiento tenga de un sistema, mejor trabajo hará en la extracción de características en general. En general, es una buena idea tener una comprensión muy clara de por qué este conjunto de datos es útil para predecir el resultado que le interesa. 

#Así que existe este equilibrio entre el resumen y la pérdida de información y, en general, es mejor pecar de crear más funciones. Pierde menos información y luego filtra algunas de esas características durante el proceso de creación de modelos. 

#Todo esto se puede automatizar y se ha automatizado de varias maneras diferentes, pero generalmente debe tener mucha precaución al usar ese enfoque porque a veces una función en particular será muy útil en el conjunto de capacitación que creó, pero no será muy útil. útil en un nuevo conjunto de datos y el conjunto de prueba no se generalizará bien. 

#Entonces, el segundo nivel está tomando covariables ordenadas, por lo que estas son características que ya ha creado en el conjunto de datos y luego crea nuevas covariables a partir de ellas. Por lo general, se trata de transformaciones o funciones de las covariables, que pueden ser útiles al construir un modelo de predicción. Esto a veces puede ser más necesario para métodos como, regresión o máquinas de vectores de soporte que pueden depender un poco más de la distribución de los datos, y un poco menos para cosas como árboles de clasificación, donde la idea aquí es que no No necesariamente tiene tanta predicción basada en modelos. 

#En otras palabras, no depende tanto de que los datos se vean de una manera particular. Por otro lado, en general, es una buena idea dedicar un tiempo a asegurarse de tener las covariables correctas en su modelo. Entonces usted, cuando crea estas funciones o decide sobre estas funciones, debe hacerlo solo en el conjunto de entrenamiento. Este es un tema común del aprendizaje automático. La creación de funciones solo puede suceder en el conjunto de entrenamiento, no puede suceder en el conjunto de prueba. 

#Más adelante, cuando aplique su predicción a su función en el conjunto de prueba, hará la misma función de la covariable para que pueda aplicar su predictor. Pero la creación original o el pensamiento sobre qué covariables construir tiene que suceder solo en el conjunto de entrenamiento, de lo contrario conducirá a un sobreajuste. 

#Y el mejor enfoque que he encontrado es a través del análisis exploratorio, básicamente haciendo gráficos y tablas de los datos, y tratando de comprender cuáles son los patrones de variación en su conjunto de datos y cómo pueden relacionarse con el resultado. Cuando usa el paquete de atención o realiza este análisis en r, las nuevas covariables deben agregarse a los marcos de datos para que se puedan usar en la predicción posterior. 

#Y es importante asegurarse de que los nombres de las nuevas variables sean reconocibles para que pueda usar el mismo nombre en su conjunto de datos de prueba. Así que aquí hay un conjunto de datos de ejemplo. Entonces, aquí estamos cargando estos datos del paquete ISLR, y estamos cargando el paquete de atención y estamos obteniendo estos datos sobre salarios. 


library(ISLR)
library(caret)

data(Wage)

inTrain <- createDataPartition(y=Wage$wage,
                               p=0.7, list=FALSE)

training <- Wage[inTrain,]
testing <- Wage[-inTrain,]

#Así que aquí de nuevo voy a construir un conjunto de entrenamiento y prueba para poder hacer toda la creación de covariables en el conjunto de entrenamiento. 

#Entonces utilizo la función de creación de partición de datos para crear el índice, índices para los dos conjuntos de datos. Luego, separo los datos en un conjunto de entrenamiento y en un conjunto de prueba. Entonces, una idea es que es muy común cuando se crean algoritmos de aprendizaje automático y es convertir covariables que son variables cualitativas o factoriales en lo que se llaman variables ficticias. 

#Entonces, probablemente haya aprendido un poco sobre esto en su clase de modelado de regresión si lo ha llevado a través de esta especialización en ciencia de datos. 

#Pero la idea básica es suponer que tenemos una variable, en este caso veamos en el conjunto de entrenamiento la variable llamada clase de trabajo. 

table(training$jobclass)

#Entonces esa clase de trabajo tiene dos niveles diferentes, es industrial o es información. Entonces, una cosa que podríamos intentar hacer es intentar conectar esa variable directamente en un modelo de predicción, pero los valores de esa variable serán en realidad un conjunto de caracteres. Será industrial o será información. Y a veces es difícil para los algoritmos de predicción utilizar esas variables de información cualitativa para poder realizar la predicción. Entonces, una cosa que podríamos querer hacer es convertirla en una variable cuantitativa, y la forma en que puede hacerlo con el paquete de atención es con esta función de variables ficticias.

dummies <- dummyVars(wage ~ jobclass,data=training)
head(predict(dummies,newdata=training))


#Básicamente, dice que vamos a aprobar un modelo para que el resultado sea el salario. La clase de trabajo será la variable de predicción, y tr, el conjunto de entrenamiento es el conjunto en el que vamos a construir esas variables ficticias. Y luego, si predice, si usa la función de predicción, este objeto ficticio y un nuevo conjunto de datos, en este caso, solo lo aplicaremos al conjunto de datos de entrenamiento, obtendrá dos nuevas variables. Entonces, el primero es un indicador de que eres industrial y el segundo es un indicador de que eres información. 

#Si el indicador de que eres industrial es uno, significa que para esa persona, tenía un trabajo industrial. Si es cero, significa que para esa persona no tenía un trabajo industrial. Entonces, lo mismo ocurre con la información. Si es cero, significa que no tenían un trabajo de información, y si es uno, tienen un trabajo de información. Entonces, en este caso, ¿dónde hay solo dos niveles diferentes de esta variable, solo hay industrial e información, entonces siempre que eres uno para industrial, eres cero para información, y siempre que eres cero para industrial, estás uno para información y así sucesivamente. 

#Pero si tuviera tres variables aquí, probablemente tendría, cada columna tendría dos ceros, porque esas son las dos clases a las que no pertenece, y un uno para la clase a la que pertenece. Entonces, esto es tomar estos factores o variables cualitativas y convertirlas en variables cuantitativas. 

#Otra cosa que sucede es que algunas de las variables básicamente no tienen variabilidad en ellas. Por lo tanto, es frecuente que cree una función, por ejemplo, si crea una función que dice para los correos electrónicos, ¿tiene alguna letra? Casi todos los correos electrónicos tendrán lotes, tendrán al menos una letra, por lo que la variable siempre será igual a verdadera. 

#Siempre tiene letras, por lo que no tiene variabilidad y probablemente no será una covariable útil. Entonces, una cosa que puede usar es esta variable o función cercana a cero en caret para identificar aquellas variables que tienen muy poca variabilidad y probablemente no serán buenos predictores. 

nsv <- nearZeroVar(training,saveMetrics=TRUE)
nsv

#Entonces lo aplica a un marco de datos que es el conjunto de datos de entrenamiento. Y aquí le digo que guarde las métricas para que podamos ver cómo está calculando cuáles son las variables. Entonces, por ejemplo, aquí podemos ver que nos dice el porcentaje de valores únicos para una variable en particular, por lo que, en este caso, la variable tiene aproximadamente un 0.33% de valores únicos, y no es, no es una variable cercana a cero, una varianza cercana a cero variable, pero por ejemplo, sexo, la variable sexo, solo es básicamente masculina y por lo tanto tiene una razón de frecuencia muy baja. En otras palabras, es básicamente una categoría, y entonces, esto termina siendo una variable cercana a cero y así será, podría usar esta columna de la matriz para descartar todas esas variables como sexo y, en este caso, como región que son variables que realmente no tienen ninguna variabilidad en ellas y no deben usarse en algoritmos de predicción. 

#Así que esta es una buena manera de descartar ese tipo de predictores menos significativos de inmediato. La otra cosa que podría hacer es, entonces, en lugar de ajustar, si usa regresión lineal o regresión lineal generalizada como su algoritmo de predicción, del cual hablaremos, en una conferencia futura, la idea será ajustar, básicamente líneas rectas a través de los datos. 


#A veces, desea poder ajustar líneas curvas, y una forma de hacerlo es con funciones de base, por lo que puede encontrarlas, por ejemplo, en el paquete de splines, por lo que una cosa que puede hacer es crear esto , la función bs creará una variable polinomial. Entonces, en este caso, pasamos a una sola variable, en este caso, el conjunto de entrenamiento, tomamos la variable de edad y decimos que queremos un polinomio de tercer grado para esta variable. 

library(splines)
bsBasis <- bs(training$age,df=3) 
bsBasis

#Entonces, cuando haces eso, esencialmente obtienes, obtendrás una matriz de tres columnas. Así que ahora son tres nuevas variables. Esta variable corresponde a la edad, los valores de edad reales. Hay escalas con fines computacionales. La segunda columna corresponderá a algo así como edad al cuadrado. Entonces, en otras palabras, está permitiendo que se ajuste a una relación cuadrática entre la edad y el resultado. Y la tercera columna corresponderá a la edad al cubo, por lo que permite una relación cúbica entre la edad y el resultado. Entonces, si incluye estas covariables en el modelo en lugar de solo la variable de edad cuando ajusta una regresión lineal, permite el ajuste del modelo con curvas.

#Así que solo para mostrarte un ejemplo de eso, aquí encajo un modelo lineal, lo recordarás de tu clase de modelado lineal. 

lm1 <- lm(wage ~ bsBasis,data=training)
plot(training$age,training$wage,pch=19,cex=0.5)
points(training$age,predict(lm1,newdata=training),col="red",pch=19,cex=0.5)


#Entonces, el salario es el resultado. De nuevo, la tilde te dice con qué lo estamos prediciendo. Aquí le pasamos esa base BS, es decir, le pasamos todos los predictores que generamos a partir del modelo polinomial. 

#Entonces, en este caso, es la edad, la edad al cuadrado y la edad al cubo. Y luego podemos graficar los datos de edad frente a los datos de salarios. Así que esa es la edad en el eje x, salario en el eje y. Y puede ver que hay una especie de relación curvilínea entre estas dos variables. Y entonces podemos graficar la edad y los valores predichos de nuestro modelo lineal, incluidos los términos con curvas, términos polinomiales y verá que obtiene un ajuste de curva a través del conjunto de datos en lugar de solo una línea recta. 

#Así que esa es una forma en que puede generar nuevas variables es permitiendo más flexibilidad en la forma en que modela variables específicas. Entonces, en el conjunto de prueba, tendrá que predecir esas mismas variables. Entonces, esta es la idea que es increíblemente crítica para el aprendizaje automático cuando crea nuevas covariables. Debe crear las covariables en el conjunto de datos de la tarea utilizando exactamente el mismo procedimiento que utilizó en el conjunto de entrenamiento. 

#Entonces puede hacer eso diciendo que voy a predecir a partir de esta variable que creé usando la función BS, un nuevo conjunto de valores. Estos son los valores de edad del conjunto de prueba. Entonces, estos son los valores que realmente voy a conectar a mi modelo de predicción cuando lo esté probando en el conjunto de prueba. 

#Esto se opone a la creación de un nuevo conjunto de predictores basados en simplemente aplicar la función BS directamente a esta variable de edad, lo que estaría creando un nuevo conjunto de variables en el conjunto de prueba que no está relacionado con las variables que creó en el conjunto de entrenamiento y puede introducir algún sesgo. 

predict(bsBasis,age=testing$age)

#Así que un poco sobre esta idea, estas ideas y algunas lecturas futuras para ti. Entonces, la creación de características de nivel uno es básicamente sobre ciencia o conocimiento específico de la aplicación. He descubierto que la mejor manera de hacerlo es encontrar cosas para un La aplicación, de la que no he hablado aquí, o de la que no conoce, o es nuevo en la que es nuevo, es buscar en Google la extracción de características para el tipo de datos que está tratando de analizar. 

#Extracción de características para imágenes. Extracción de funciones para voz. Ese tipo de cosas. usted, también puede buscar ese tipo de datos en particular y ver la mayor cantidad de información posible al respecto. En particular, está buscando cuáles son las características sobresalientes que probablemente sean diferentes entre muestras individuales. 

#En general, desea pecar de exceso de creación de características porque siempre puede filtrarlas más adelante en el proceso del algoritmo de aprendizaje automático. En algunas aplicaciones como imágenes y voces, a menudo es posible y bastante necesario crear funciones que no son necesariamente cosas que imagina fuera de su mente. Es muy difícil saber exactamente cuáles son los componentes correctos de una imagen para incluir como características en un modelo, por lo que hay cosas como las que puede haber escuchado sobre el aprendizaje profundo, que es básicamente una forma de crear características para cosas como imágenes y voz. 


#Y este es un buen tutorial al que he vinculado aquí, que explica cómo funciona el proceso de creación de características para esas cosas. Pero, en general, la creación automática de funciones requiere el mismo nivel de pensamiento para asegurarse de que las funciones que genera el proceso de creación de funciones tengan sentido. Las covariables de creación de características de nivel 2 a nuevas covariables se pueden hacer mucho con los componentes preProcess del paquete de intercalación. 

#Puede crear nuevas covariables utilizando básicamente cualquiera de las funciones en r, si tiene sentido para usted. La clave es, nuevamente, hacer muchos gráficos y hacer análisis exploratorios para ver dónde están las conexiones entre los predictores y el resultado. Puede crear nuevas covariables si cree que mejorarán el ajuste. Nuevamente, puede equivocarse por el lado de la creación excesiva de características, pero a veces las características simplemente son, son, un poco sin sentido y no debería crearlas. 

#Tenga cuidado con el sobreajuste en el sentido de que si crea muchas características que son particularmente buenas solo para su conjunto de entrenamiento, es posible que no funcionen bien en el conjunto de prueba. Por lo tanto, una buena idea es crear en exceso muchas funciones para realizar un filtrado antes de aplicar el algoritmo de aprendizaje automático. Este tutorial sobre preprocesamiento con intercalación es muy bueno. Es un buen lugar para comenzar con un preprocesamiento realmente básico. Y si desea un modelo flit spline como los que mencioné con curvas flexibles, puede usar el método gam en el paquete de intercalación que permite suavizar múltiples variables usando un suavizado diferente para cada variable. Y más sobre la creación de funciones y la ordenación de datos se encuentra en el curso de obtención de datos, obtención y limpieza de datos de la especialización de ciencia de datos.



