#Prediction

#Estoy muy entusiasmado con todas las formas en que puede usar la fecha para predecir, y creo que es una de las áreas que probablemente sea la más conocida cuando se piensa en la ciencia de datos. 


#Esta primera conferencia cubrirá la motivación y los prerrequisitos del curso y les dará una pequeña idea de hacia dónde vamos a ir. Por lo tanto, este curso cubrirá las ideas básicas del aprendizaje automático y la predicción, y nuestro objetivo es ser muy prácticos con nuestra comprensión del aprendizaje automático. 

#Entonces, la idea aquí es que vamos a cubrir las principales técnicas que usa mucha gente y de las que quizás hayas oído hablar. 

#Regresión lineal y bosques aleatorios y cosas por el estilo, pero también vamos a cubrir algunos de los detalles esenciales y los aspectos prácticos de hacer aprendizaje automático y ejemplos reales. 

#Y, entonces, tenemos que comenzar con ideas de, como, diseño de estudio, por lo tanto, entrenamiento versus conjuntos de prueba, y decidir cómo se construye realmente un predictor en un conjunto de datos reales. Luego, hablaremos de problemas conceptuales como el error fuera de la muestra y el ajuste excesivo, por lo que es posible que haya escuchado el hecho de que algunos modelos tal vez estén un poco sintonizados con el ruido y eso no predecirá bien en una nueva muestra. 

#Entonces, hablaremos sobre cómo se puede prevenir ese tipo de problemas. También hablaremos sobre cosas como curvas ROC o métodos para evaluar predictores para decidir si un predictor es bueno o no. 

#Y nos centraremos mucho en la implementación práctica de estos algoritmos de aprendizaje automático y también en estos problemas más conceptuales en R. Y usaremos el paquete de intercalación para una gran mayoría de eso. El paquete de rvest es un buen marco unificador para muchos paquetes de aprendizaje automático que existen en R. Esos paquetes fueron creados por muchas personas diferentes, y tienen diferentes parámetros y diferentes elecciones que han realizado sus desarrolladores. Y el paquete de rvest es una especie de marco unificador agradable para eso. Este curso depende en gran medida de las herramientas que ha aprendido en la caja de herramientas del científico de datos y en la programación en R, por lo que si aún no ha tomado esas clases, se les recomienda mucho antes de tomar esta clase. 

#También será útil si ha realizado análisis de datos exploratorios, informes de datos e investigaciones reproducibles y modelos de regresión. Esas clases no son obligatorias, pero gran parte del material que cubriremos en esta clase estará relacionado con esa imagen, así que si la has visto antes, podría ser un poco más fácil para ti si repasas el material de esta clase. 

#Entonces, ¿quién predice las cosas? Esta es una pregunta importante. Creo que es un motivador importante para esta clase. Básicamente, la mayoría de las organizaciones ahora usan el aprendizaje automático de alguna forma simple o mínima y, a menudo, de formas mucho más complicadas. 

#Así que aquí hay un par de ejemplos. Los gobiernos locales podrían intentar predecir los pagos de pensiones en el futuro para saber si sus mecanismos de generación de ingresos tienen fondos suficientes generados para cubrir esos pagos de pensiones. 

#Es posible que Google quiera predecir si va a hacer clic en un anuncio para que pueda mostrarle solo los anuncios que tienen más probabilidades de obtener clics y, por lo tanto, aumentará los ingresos. Amazon, Netflix y otras compañías como esa te mostrarán una película y quieren que compres la siguiente. 

#Para hacer eso, quieren mostrarte lo que te puede interesar. Películas que has visto en esta película, por lo que es posible que te interesen estas otras películas, para que puedan mantenerte mirando y aumentar nuevamente los ingresos.


#Las compañías de seguros emplean a grandes grupos de actuarios y estadísticos para tratar de predecir su riesgo de todo tipo de cosas diferentes, incluida la muerte, para que puedan saber cuál es el precio correcto para establecer las primas de seguro. 

#Y luego, seleccione Johns Hopkins, donde trabajo también querrá predecir quién tendrá éxito en sus programas. Entonces, ¿qué estudiantes que se han postulado a nuestro programa tendrán más probabilidades de tener éxito? Todas estas diferentes tareas de predicción son realizadas por una variedad de organizaciones diferentes y se realizan en diferentes niveles. 

#Algunos de ellos son muy complicados. Predecir en qué anuncio puede hacer clic puede tener una gran cantidad de predictores, y podría basarse en un algoritmo de aprendizaje automático complicado y silencioso. 

#En algunos casos, puede ser mucho más simple en términos de lo que está tratando de predecir. Y así, de cualquier manera, es un componente importante de básicamente todas las organizaciones importantes en estos días. Entonces, ¿por qué predecirías las cosas? Bueno, uno es la gloria. 

#Aquí hay una foto de Chris Volinsky. Es miembro del equipo que ganó el premio Netflix. El Premio Netflix fue un premio de un millón de dólares que se le dio a un adolescente que podría reducir el error que estaba cometiendo Netflix cuando intentaba predecir qué película nueva podría interesarle a alguien ver.

#Así que Chris era miembro de una gran organización de múltiples equipos que combinaron sus modelos, predijeron lo mejor y ganaron el premio. 

#En realidad, es una especie de, una historia fascinante sobre cómo sucedió eso. Y así, por supuesto, todos obtuvieron mucho crédito como nerd y mucha gloria por ganar estas competencias. 

#Y esa es una de las razones por las que podría estar emocionado por ser bueno en el aprendizaje automático. También puede estar emocionado porque puede, hay dinero en ello. 

#Entonces, no solo a través de organizaciones en las que puede ganar mucho dinero si sabe cómo predecir mejor en qué anuncios hará clic la gente, etc., sino incluso en estas competiciones. 

#Entonces, por ejemplo, este es el premio de salud patrimonial. Así que este fue un premio de $ 3 millones para el equipo que mejor pudiera predecir quién sería admitido en el hospital en un año. 

#Y cuando intentaba hacer esta predicción, usaba información sobre las hospitalizaciones anteriores de años anteriores, y nadie ganó realmente tres millones de dólares, pero la gente ganó bastante dinero de este premio en el tipo de premios provisionales, y así, la gente en realidad gana dinero a través de las competencias, pero también escindieron empresas y organizaciones de análisis en función de su desempeño en estas competencias. 

#En general, ahora es una especie de deporte. La ciencia de datos es un deporte, especialmente en términos de predicción. 

#Y estas son, esta organización Kaggle es una de las muchas organizaciones que pueden albergar estas competiciones en las que puedes intentar predecir el resultado de un experimento en particular o intentar predecir todo tipo de cosas diferentes, y estas competiciones a menudo se ejecutan para un cierto período de tiempo fijo y, a menudo, también hay mucho, o un poco de dinero en juego. 

#Entonces, puede ser muy divertido, y hay una clasificación y una tabla de clasificación, por lo que puedes participar en la diversión de la competencia.

#Esto está un poco más cerca de mi área de investigación, por lo que también puede predecir los propósitos de tomar mejores decisiones médicas, por lo que Oncotype DX es una firma de expresión genética pronóstica que se puede medir en mujeres que tienen cáncer de mama, y se puede usar para predecir cuánto tiempo sobrevivirán, dado un conjunto de condiciones que tengan. 

#De modo que puede ser útil para los médicos al tomar decisiones sobre pacientes con cáncer de mama. Este es un libro que encuentro muy útil. Es un poco avanzado para esta clase, aunque muchas de las herramientas siguen siendo increíblemente útiles. 

#Se llama Elementos del aprendizaje estadístico, por lo que este es un libro que, en realidad, puede obtener una copia gratuita del PDF en el sitio web del autor, por lo que es muy bueno. 

#Pero si realmente te gusta el libro, te animo a que lo compres también. El autor se ha esforzado mucho en él y es un gran libro, por lo que podría ser muy útil en términos de tener mucha información que cubriremos en esta clase.

#Y luego, el paquete que creo que usaremos más en esta clase es el paquete de caret(). Entonces, el paquete de caret combina una gran cantidad de predictores que se han construido en R y le permite configurar conjuntos de entrenamiento y prueba en una especie de marco unificado que evita muchos de los problemas que surgen al construir modelos de predicción. 

#Si desea algunos materiales más avanzados, un lugar para ir sería la clase de aprendizaje automático de Coursera. 

#Y lo que quiero decir con material avanzado es que a veces puede que le interese mucho más el tipo de detalle matemático detrás de cómo funcionan estos algoritmos, o puede que le interese mucho más del tipo de algoritmos de aprendizaje automático de alto nivel que se encuentran en la misma vanguardia.

#Y creo que esta clase sería un gran lugar para que comiences a aprender sobre aquellos con algún material. 

#Esta clase, como dije, cubrirá los conceptos básicos y se enfocará en llevarlo al punto de una especie de cero a 60. 

#Y, en otras palabras, lo llevará al punto en el que puede usar herramientas de aprendizaje automático en su día a día, pero no necesariamente cubrirá todos los detalles de alto nivel de los algoritmos de aprendizaje automático.

#En realidad, existe una gran cantidad de información disponible sobre el aprendizaje automático. Es un tema muy candente en este momento, así que le enumeré un montón de enlaces que lo envían a información en Quora. 

#Es de Science, del MIT, CMU y Kaggle, que le brindará mucha información sobre cómo realizar el aprendizaje automático en una variedad de formas diferentes, y así, si esta clase le abre el apetito y lo entusiasma con algunos de estos otras cosas, eso también sería genial.


