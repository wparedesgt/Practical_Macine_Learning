#Type of errors

#Esta conferencia trata sobre los tipos de errores y las formas en que evalúa las funciones de predicción que generas durante esta clase. Entonces, en primer lugar, nos enfocaremos en los tipos de errores que puede cometer cuando está haciendo un problema de predicción binaria. En otras palabras, intentaba predecir cosas en uno de dos grupos. En general, hablaremos de lenguaje en términos de verdaderos positivos y verdaderos negativos, y falsos positivos y falsos negativos. 

#Entonces, lo primero que hay que tener en cuenta es que, cuando hablamos de positivo versus negativo, en realidad estamos hablando de lo que decidió el algoritmo. Ya sea que haya decidido que estás en una clase o no. Entonces verdadero y falso, se refieren al verdadero estado del mundo. Entonces, verdadero significa que realmente perteneces a la clase que estamos tratando de identificar y falso significa que en realidad no perteneces a esa clase.

#Entonces, a modo de ejemplo, el verdadero significado positivo, la verdadera parte del verdadero positivo, significa que estabas correctamente, en otras palabras, que la verdad es que en realidad había algo que identificar. Un positivo. En otras palabras, te identificamos como perteneciente a esa clase. De manera similar, para un falso positivo, la parte positiva nuevamente se refiere al hecho de que lo identificamos como parte de la clase positiva, y falso se refiere al hecho de que estaba equivocado. 

#En realidad no corrimos, te clasificamos en la clase correcta. Para hacer esto un poco más concreto, considere un ejemplo de prueba médica. Entonces, en este caso, estamos tratando de identificar a las personas que están enfermas usando, digamos, una prueba de detección, un ejemplo muy común sería, digamos, mamografías para tratar de identificar si las mujeres tienen cáncer de mama. 

#En este caso, la parte verdadera será el estado de si está enfermo o no. Entonces, si decimos que realmente te identificamos, entonces estabas realmente enfermo. Y si lo identificamos falsamente, entonces estaba realmente sano. 

#No estabas realmente enfermo. Entonces, en este caso, un verdadero positivo es realmente alguien que está realmente enfermo. Y es positivo, en otras palabras, en realidad diagnosticamos a esas personas tan correctamente como enfermas. 

#Si eres un falso positivo, significa que falso, en otras palabras, eres una persona sana, pero positivo, significa que todavía éramos alguien que identificamos como enfermo, aunque tú no lo estabas. 

#Lo mismo ocurre con un verdadero negativo. Esto es alguien verdadero, que es verdaderamente negativo, verdaderamente sano, y lo identificamos como negativo. Y un falso negativo sería alguien que está enfermo, por lo que lo identificamos incorrectamente como sano, y la parte negativa es que lo identificamos como sano. 

#Puede obtener más información sobre la sensibilidad y la especificidad en este enlace de Wikipedia a continuación. 

#También puedes verlos en esta tabla de 2 por 2. 

#Entonces se llama tabla de 2 por 2, porque tiene dos filas, aquí, y dos columnas, aquí. Entonces, las columnas corresponden a su estado de enfermedad. Entonces, en este, en este ejemplo en particular, positivo significa que tiene la enfermedad y negativo significa que no tiene la enfermedad. 

#Esa es la verdad real sobre el estado de su enfermedad. Y la prueba es nuestra predicción, nuestro algoritmo de aprendizaje automático. Un positivo significa que predecimos que tiene una enfermedad y un negativo significa que predecimos que no tiene la enfermedad. 

#Entonces, algunas de las cantidades clave de las que habla la gente son la sensibilidad. Esta es la probabilidad de que le demos una predicción de que está enfermo, dado que realmente está enfermo, así que, si está realmente enfermo, ¿cuál es la probabilidad de que obtengamos eso, verdad? Y luego la especificidad es si estás realmente sano, ¿cuál es la probabilidad de que lo hagamos bien? 

#El valor predictivo positivo es la probabilidad de que lo llamemos enfermo, o la probabilidad de que esté enfermo, dado que lo llamamos enfermo. Así que es un poco diferente, que la sensibilidad en el sentido de que, ahora está mirando a todas las personas a las que llamamos enfermos, y diciendo, qué fracción de ellos. En realidad están enfermos. 

#Lo mismo ocurre con el valor predictivo negativo. Y la precisión es solo una probabilidad de que lo clasificamos con el resultado correcto. Entonces, en esta tabla, son los términos en diagonal. Son los verdaderos aspectos positivos y los verdaderos negativos, que se suman. Entonces puedes escribirlos como fracciones. Entonces, por ejemplo, la sensibilidad. Esa es la probabilidad, dado que estás enfermo, de que te llamemos enfermo. Entonces miramos esta primera columna. Esta es toda la gente que está enferma. Y miramos, qué fracción de ellos, realmente acertamos. Eso es, los verdaderos positivos, divididos por los verdaderos positivos, más los falsos negativos, lo que le da la sensibilidad. De manera similar, puede hacer el mismo tipo de fracciones para la especificidad, el valor predictivo positivo, el valor predictivo negativo, etc.


#Al mirar el valor predictivo positivo. Básicamente, miramos, en este caso son los verdaderos positivos, divididos entre los verdaderos positivos más los falsos positivos, porque estamos mirando solo las pruebas positivas, y decimos ¿qué fracción de las pruebas positivas obtuvimos bien? 

#Entonces, los verdaderos positivos fueron los que acertamos, y los verdaderos positivos más los falsos positivos, es el total de las pruebas positivas. Así que esto es algo importante porque, en muchos problemas de predicción, una de las clases será más rara que la otra. 

#Entonces, por ejemplo, en los estudios médicos, es muy común que solo un porcentaje muy pequeño de personas se enferme. En este caso, suponga que hay una enfermedad en la que solo una, el 0,1% de las personas está enferma en la población. 

#Y supongamos que tenemos un algoritmo de aprendizaje automático realmente bueno. Un kit de prueba realmente bueno, que es 99% sensible y 99% específico. En otras palabras, la probabilidad de que lo hagamos bien, si está enfermo, es del 99%, y la probabilidad de que lo hagamos bien, si está sano, es del 99%. 

#Entonces, en este caso, suponga que obtiene un resultado positivo. ¿Cuál es la probabilidad de que tengamos la enfermedad? Puede considerar dos casos diferentes. Uno, en una población general. En otras palabras, en una población donde existe una probabilidad muy pequeña de que usted tenga la enfermedad. Otro que puede considerar es un caso en el que el 10% de las personas tiene la enfermedad, por lo que la enfermedad es mucho más prevalente. 

#Veamos cómo eso cambia su valor predictivo positivo. Entonces, la población general, recuerde, solo tenemos alrededor del 1% de las personas que tienen la enfermedad. Entonces, solo hay 100 personas en esta columna que tienen la enfermedad, pero hay muchas más personas que están sanas. Del mismo modo, tenemos una precisión del 99%, si tiene la enfermedad. 

#Entonces, 99 de cada 100 personas. Y 99 de estos 100, correctamente se llaman enfermos. De manera similar, en, entre las personas que están sanas, obtenemos 99% de razón, por lo que 98,901 llamamos saludables, cuando realmente están saludables. Eso es el 99% del tiempo. Pero suponga que quisiéramos saber, si obtuvo un resultado positivo, ¿cuál es la probabilidad de que realmente tenga la enfermedad? Entonces, veamos esto por un segundo. Así que tú dices. Suponga que realmente obtuvo una prueba positiva, esa es la primera fila de aquí. 

#¿Cuál es la probabilidad de que realmente tenga la enfermedad? 

#Entonces, esa es la cantidad de personas que realmente tienen la enfermedad, entre la cantidad total de personas que tuvieron una prueba positiva, entonces es 99. Dividido por 99 más 999, es solo un valor predictivo positivo del 9%. 

#En otras palabras, si obtuvo un resultado positivo en la prueba, hay solo un 9% de probabilidad de que realmente tenga la enfermedad. ¿Cuál es la razón de eso? La razón es el 99% de un número pequeño, por lo que 99 de 100. Aún es menor que el 1% de un mayor número. 

#Así que 999 de una fracción mucho mayor son personas sanas. En cambio, si consideramos el caso en el que el 10% de las personas están realmente enfermas, entonces hay un número mucho mayor de personas que están realmente enfermas. Y el 99% de las veces, lo haremos bien, por lo que 99, 9,900 de las personas que en realidad están enfermas, llamaremos enfermas, y solo 900 de las personas que están sanas serán llamadas enfermas. 

#Y entonces, las cosas salen como esperabas. En otras palabras, 9,900 de 9,900 más 900, eso es. Este número en la esquina superior izquierda. Dividido por esta fila total. 

#Es del 92%, por lo que tiene un valor predictivo positivo alto. ¿Qué significa esto? Si está prediciendo un evento raro. Tienes que ser consciente de lo raro que es ese evento. Esto se remonta a la idea de saber de qué población está tomando muestras. 

#Cuando está creando un modelo predictivo. Este es en realidad un problema clave de salud pública, por lo que probablemente haya visto en las noticias que ha habido preguntas sobre cómo, cuál es el valor de las mamografías para detectar enfermedades y detectar el valor de las enfermedades en comparación con la detección de casos que no son necesariamente de vida amenazante. 

#Del mismo modo, probablemente haya oído hablar de él para la detección del cáncer de próstata y en ambos casos. Tiene una enfermedad bastante rara y, aunque los mecanismos de detección son relativamente buenos, es muy difícil saber si está obteniendo muchos falsos positivos, como una fracción del número total de positivos que está obteniendo. 

#Para datos continuos, en realidad no tiene un escenario tan simple, en el que solo tiene uno de dos casos y uno de los dos tipos de errores que posiblemente pueda cometer. El objetivo aquí es ver qué tan cerca estás de la verdad. Entonces, una forma común de hacerlo es con algo llamado error cuadrático medio. Y entonces la idea es que tiene una predicción que tiene de su modelo o su algoritmo de aprendizaje automático. Entonces, tiene una predicción para cada muestra que está tratando de predecir. Y quizás también sepa la verdad sobre esas muestras, digamos en un conjunto de prueba.

#Entonces, lo que haces es calcular la diferencia entre la predicción y la verdad. Y lo cuadras, por lo que los números son todos positivos. Y luego promedia el número total de, una especie de distancia total entre la predicción previa y el árbol. 

#Lo único que es un poco difícil de interpretar este número es que elevó al cuadrado esta distancia, por lo que es un poco difícil de interpretar en la misma escala que las predicciones o la verdad. Entonces, lo que la gente suele hacer es calcular la raíz cuadrada de esa cantidad. Así que aquí, debajo del signo de la raíz cuadrada, está el mismo número, es solo la distancia promedio entre la predicción y la verdad, y simplemente lo suma y lo eleva al cuadrado. 

#Y luego tomas la raíz cuadrada en ese número, y eso te da la raíz, el error cuadrático medio de la raíz. Y esta es probablemente la medida de error más común que se usa para datos continuos. Entonces, para los datos continuos, las personas a menudo usan el error cuadrático medio o el error cuadrático medio. Pero si a menudo no funciona cuando hay muchos valores atípicos. 

#O los valores de las variables pueden tener escalas muy diferentes. Porque será sensible a esos valores atípicos. Entonces, por ejemplo, si tiene uno de valor realmente grande. Realmente podría aumentar la media. En cambio, lo que podríamos usar es a menudo la desviación absoluta mediana. Entonces, en ese caso, toman la mediana de la diferencia, la distancia entre el valor observado y el valor predicho, y hacen el valor absoluto en lugar de hacer el valor al cuadrado. 

#Y de nuevo, eso requiere que todas las distancias sean positivas, pero es un poco más robusto para el tamaño de esos errores. Y luego, la sensibilidad y la especificidad especial se usan con mucha frecuencia cuando se habla de pruebas médicas en particular, pero también se usan de manera particularmente generalizada si le importa un tipo de error más que el otro tipo de error. Y luego, precisión que pondera por igual los falsos positivos y los falsos positivos. Este es un punto importante si de nuevo tienes un gran. Discrepancia en el número de veces que eres positivo o negativo. Para casos multiclase, es posible que tenga algo como concordancia, y aquí he vinculado a una medida de distancia en particular, kappa. Pero hay toda una gran clase de medidas de distancia, y todas tienen propiedades diferentes, que se pueden usar cuando tiene datos multiclase. Entonces, esas son algunas de las medidas de error comunes que se utilizan al realizar algoritmos de predicción.