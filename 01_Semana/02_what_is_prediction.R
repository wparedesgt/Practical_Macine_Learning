#What is prediction

#Gran parte de la acción en el aprendizaje automático se ha centrado en qué algoritmos son los mejores para extraer información y usarla para predecir.

#Pero es importante dar un paso atrás y analizar todo el problema de predicción. 

#Este es un pequeño diagrama que hice para ilustrar algunos de los problemas clave de cada uno en la construcción de un predictor. 

#Para empezar, suponga que quiero predecir para estos puntos si son rojos o azules. Bueno, lo que podría hacer es tener un gran grupo de puntos sobre los que desea predecir y luego usar la probabilidad y el muestreo para elegir un conjunto de entrenamiento. 

#El conjunto de entrenamiento constará de algunos puntos rojos y algunos puntos azules, y medirás un montón de características de esos puntos. Luego, usará esas características para construir lo que se llama una función de predicción, y la función de predicción tomará un nuevo punto, cuyo color no conoce, pero usando esas características que midió predecirá si es rojo o azul. 

#Luego puede salir e intentar evaluar si esa función de predicción funciona bien o no. 

#Una cosa que creo que es muy importante y que a menudo se subestima en la construcción de un algoritmo de aprendizaje automático es observar la probabilidad y el paso de muestreo para construir las estadísticas de entrenamiento y prueba. 

#Este es siempre un componente necesario de la construcción de cada algoritmo de aprendizaje automático para decidir qué muestras usará para construir ese algoritmo. 

#Pero a veces se pasa por alto, porque todas las acciones de las que oye hablar para el aprendizaje automático ocurren aquí cuando está construyendo la propia función de aprendizaje automático. Un ejemplo de muy alto perfil de las formas en que esto puede causar problemas es la reciente discusión sobre las tendencias de la gripe de Google. 

#La tendencia de la gripe de Google intenta utilizar los términos que la gente estaba escribiendo en Google, términos como, tengo tos, para predecir la frecuencia con la que la gente contraería gripe. 

#En otras palabras, ¿cuál era la tasa de gripe que estaba ocurriendo en una parte particular de los Estados Unidos en un momento específico? Y compararon su algoritmo con el enfoque adoptado por el gobierno de los Estados Unidos, adónde salieron y realmente midieron cuántas personas estaban contrayendo la gripe, en diferentes lugares de los EE. UU. 

#Y descubrieron en su artículo original que el algoritmo de tendencias de la gripe de Google podía representar con mucha precisión el número de casos de gripe que aparecerían en varios lugares diferentes de los EE. UU. En un momento dado. 

#Pero fue un poco más rápido y bastante menos costoso de medir utilizando términos de búsqueda en Google. 

#El problema del que no se dieron cuenta en ese momento era que los términos de búsqueda que usarían las personas cambiarían con el tiempo. Podrían usar diferentes términos cuando estaban buscando, y eso afectaría el rendimiento del algoritmo. 

#Y también, la forma en que esos términos se usaban realmente en el algoritmo no se entendía muy bien. Entonces, cuando la función de un término de búsqueda en particular cambia en su algoritmo, puede causar problemas. Y esto lleva a resultados muy inexactos para el algoritmo de tendencias de la gripe de Google a la mitad del tiempo a medida que cambia el uso de Internet de las personas.

#Entonces, esto le da una idea de que elegir el conjunto de datos correcto y que saber cuál es la pregunta específica es nuevamente primordial, al igual que lo ha sido en otras clases de la especialización en ciencia de datos.

#Entonces, aquí están los componentes de un predictor.

#Debe comenzar como siempre en todos, cualquier problema con la ciencia de datos con una pregunta muy específica y bien definida. 

#¿Qué está tratando de predecir y con qué está tratando de predecirlo? 

#Luego sale y recopila los mejores datos de entrada que pueda para poder predecir. 

#Y a partir de esos datos, puede usar las características medidas que tiene o puede usar cálculos para crear características que pensamos que podrían ser útiles para predecir el resultado que le interesa. 

#En esta etapa, puede comenzar a utilizar los algoritmos de aprendizaje automático sobre los que puede haber leído, como Random Forest o Decision Trees. 

#Y luego, lo que puede hacer es estimar los parámetros de esos algoritmos y usar esos parámetros para aplicar el algoritmo a un nuevo conjunto de datos y finalmente evaluar ese algoritmo en esos nuevos datos. 

#Así que les voy a mostrar un pequeño ejemplo rápido, para mostrarles cómo funciona este pequeño proceso. Así que, obviamente, esta es una versión trivializada de lo que sucedería en un algoritmo de ejecución de una máquina real, pero le da una idea de lo que está sucediendo. 

#Entonces empiezas preguntando algo sobre la pregunta. Así que empiezas con una pregunta en general, la gente suele empezar con preguntas bastante generales. 

#Entonces, ¿puedo detectar automáticamente los correos electrónicos que son SPAM de los que no lo son? 

#Por lo tanto, los correos electrónicos no deseados son correos electrónicos que recibiste y provienen de empresas que se envían a miles de personas al mismo tiempo y que es posible que no te interesen. Por lo tanto, es posible que desee hacer su pregunta un poco más concreta. A menudo es necesario cuando se realiza el aprendizaje automático.


#Entonces, la pregunta podría ser, ¿puedo usar características cuantitativas de esos correos electrónicos para clasificarlos como SPAM, o cómo vamos a llamar HAM, cuál es el correo electrónico que la gente le gustaría recibir?

#Entonces, una vez que tenga su pregunta, deberá buscar los datos de entrada.

#En este caso, en realidad hay un montón de datos que están disponibles y ya preprocesados para nosotros en R. Entonces, en realidad, está en el paquete de laboratorio actual K-E-R-N-L-A-B y es el conjunto de datos de SPAM. 

#Por lo tanto, podemos cargar ese conjunto de datos en R directamente, y ya tenemos disponible cierta información que se ha recopilado sobre los correos electrónicos de SPAM y HAM. 

#Ahora, es posible que deseemos tener en cuenta que es posible que esos no sean necesariamente los datos perfectos; de hecho, no tenemos todos los correos electrónicos que se han recopilado a lo largo del tiempo o no tenemos todos los correos electrónicos que se están enviando. a usted personalmente.

#Por lo tanto, debemos ser conscientes de las posibles limitaciones de estos datos cuando los utilizamos para construir un algoritmo de predicción.

#Entonces queremos calcular algo sobre las características. 

#Entonces, imagina que tienes un montón de correos electrónicos. Y aquí hay un correo electrónico de ejemplo que me han enviado. Estimado Jeff, ¿puedes enviarme la dirección para que pueda enviarte la invitación? 

#Gracias, Ben. Si queremos construir un algoritmo de predicción, necesitamos calcular algunas características de estos correos electrónicos que podemos usar para poder construir un algoritmo predictivo. Un ejemplo podría ser, podemos calcular la frecuencia con la que aparece una palabra en particular.

#Entonces, aquí, buscamos la frecuencia con la que aparece la palabra que aparece. Entonces, en este caso, aparece dos veces en este correo electrónico, por lo que 2 de 17 palabras o aproximadamente el 11% de las palabras en este correo electrónico eres tú. 

#Podríamos calcular ese mismo porcentaje para cada correo electrónico que tenemos y ahora tenemos una característica cualitativa que podemos intentar usar para predecir. 

#Entonces, si los datos del paquete de laboratorio actual que he mostrado aquí son, en realidad, información así, para cada correo electrónico tenemos la frecuencia con la que aparecen ciertas palabras. 

#Y así, por ejemplo, si el crédito aparece con mucha frecuencia en el correo electrónico o el dinero aparece con mucha frecuencia en el correo electrónico, puede imaginar que ese correo electrónico podría ser un correo no deseado.

#Entonces, como un ejemplo de eso, observamos la frecuencia de la palabra, tu y la frecuencia con la que aparece en el correo electrónico. Y entonces, tengo un diagrama aquí que es un diagrama de densidad de esos datos. 

#Y así, en el eje x está la frecuencia con la que, tu, apareció en el correo electrónico. 

#Y en el eje y está la densidad, o el número de veces que aparece esa frecuencia entre los correos electrónicos. 

#Y entonces lo que puedes ver es que la mayoría de los correos electrónicos que son SPAM, esos son los que están en rojo, puedes ver que tienden a tener más apariciones de la palabra, tu. 

#Donde, como todos los correos electrónicos que son HAM, los que realmente queremos recibir tienen un pico mucho más alto aquí, cerca de 0, hay muy pocos correos electrónicos que tengan una gran cantidad de espectadores que sean HAM. 

#Entonces, podemos construir un algoritmo, en este caso construyamos un algoritmo muy, muy simple. Podemos estimar un algoritmo en el que queremos encontrar un corte de una constante C, donde si la frecuencia de su está por encima de C, predecimos el spam y, de lo contrario, predecimos que es HAM.

#Entonces, volviendo a nuestros datos, podemos calcular, tratar de averiguar cuál es el mejor límite, y aquí hay un ejemplo de un límite que puede elegir, así que elija un límite aquí que, si está por encima de 0.5, entonces decimos que es SPAM. , y si está por debajo de 0,5 podemos decir que es HAM. 

#Y entonces creemos que esto podría funcionar porque puede ver que el gran pico de mensajes HAM azules están debajo del corte. Mientras que el gran, uno de los grandes picos de los mensajes de SPAM está por encima del límite. 

#Así que puedes imaginar que almacenará en caché una parte de ese SPAM. 

#Entonces, lo que hacemos es evaluar eso. Entonces, lo que haríamos es calcular, por ejemplo, predicciones para cada uno de los diferentes correos electrónicos. 

#Tomamos una predicción que dice, si la frecuencia tuya es superior a 0.5, entonces eres spam y si está por debajo, entonces no eres spam. 

#Y luego hacemos una tabla de esas predicciones y la dividimos por la longitud de todas las observaciones que tenemos. Y lo que podemos decir es que, cuando no eres spam aproximadamente el 45% del tiempo, el 46% del tiempo, lo hacemos bien. 

#Cuando recibes spam aproximadamente el 29% del tiempo, te entendemos bien. 

#Entonces, el total que hacemos que escriba aproximadamente el 45% más el 29% es aproximadamente el 75% del tiempo. Entonces, nuestro algoritmo de predicción tiene una precisión de aproximadamente un 75% en este caso particular. 

#Así es como evaluaríamos el algoritmo. Este es, por supuesto, cualquier mismo conjunto de datos donde realmente lo calculamos, la función de predicción, y como veremos en conferencias posteriores. Esta será una estimación optimista de la tasa de error general. Esa es una descripción general de los pasos básicos para crear un algoritmo predictivo.


