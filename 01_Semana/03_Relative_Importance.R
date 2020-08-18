#03_Relative_Importance


#Esta conferencia trata sobre las compensaciones y los diferentes componentes de la construcción de un algoritmo de aprendizaje automático. Así que recuerde, de la conferencia anterior hablamos sobre los diferentes componentes de la construcción de un algoritmo de aprendizaje automático.

#Empezamos con una pregunta. Así que esta es la pregunta que estamos tratando de responder, y tratamos de hacerla lo más concreta posible. Luego recopilamos algunos datos. Los datos que vamos a utilizar para construir nuestro algoritmo de aprendizaje automático y aplicar ese algoritmo más adelante. A partir de esos datos, los comprimimos en un conjunto de características que usaremos para predecir. 

#Y luego alimentamos esas características en un algoritmo que luego usaremos para aplicar para predecir cosas. En mi experiencia, ha sido que la pregunta es el componente más importante para construir un buen algoritmo de aprendizaje automático, obteniendo una pregunta muy concreta y específica donde se pueden recolectar datos. El siguiente paso más importante es poder recopilar datos. 

#Con frecuencia, la pregunta que realmente desea responder, los datos no estarán disponibles o los datos solo estarán disponibles en una especie de tangencial. Formar. Entonces, la creación de funciones es un componente importante, ya que si no comprime los datos de la manera correcta, podría perder toda la información relevante y valiosa. 

#Y finalmente, en mi experiencia, el algoritmo es a menudo la parte menos importante de la construcción de un algoritmo de aprendizaje automático. Puede ser muy importante según la modalidad exacta del tipo de datos que esté utilizando. Por ejemplo, los datos de imagen y de voz pueden requerir ciertos tipos de algoritmos de predicción que no necesariamente son como. Importante para diferentes tipos de predicciones. 

#Así que un punto importante que creo que vale la pena insistir fue en realidad citado por primera vez por John Tukey, que es que la combinación de algunos datos y un doloroso deseo de una respuesta no garantiza que se pueda extraer una respuesta razonable de un cuerpo dado. de datos. 

#En otras palabras, un componente importante de saber cómo hacer predicciones es saber cuándo rendirse, cuando los datos que tiene no son suficientes para responder la pregunta que está tratando de responder. El punto clave que debes recordar. 

#Al tomar esa decisión, la basura entra en la basura. En otras palabras, si tiene datos incorrectos que recopiló. O datos que no son muy útiles para realizar predicciones. No importa qué tan bueno sea su algoritmo de aprendizaje automático. A menudo obtendrá muy malos resultados.

#En general, lo más fácil de predecir es cuando tiene datos sobre exactamente lo mismo que está tratando de predecir. En otras palabras, cuando estás. 

#En el premio de Netflix, estaban tratando de modificar las calificaciones de las películas nuevas, cómo la gente calificaría las películas y estaban tratando de hacer esa predicción sobre la base de las calificaciones de películas antiguas. 

#Y esa es una relación muy directa, puedes imaginar cuán antiguas serían las calificaciones de películas. Se rige por un proceso similar al de las nuevas clasificaciones de películas. En mi área, una cosa que podría hacer es recopilar medidas moleculares, como la expresión genética, y esa es una medida de algo que está sucediendo en su cuerpo. Y podría usar eso para intentar predecir cómo responde la gente. A enfermedad u otras condiciones médicas diferentes. Una vez más, son una especie de, puedes imaginar una ruta a partir de los datos de expresión genética que hemos recopilado, la información molecular que hemos recopilado, un valor para el estado de tu enfermedad. En general, depende, cuál es una buena predicción, cuáles son las características que recolectarías para poder predecir. 


#Pero, en general, cuanto más se acerque a tipos de datos similares, más se acercará para realizar una predicción de precisión alta. 

#Este es un enlace aquí a un video que habla sobre la efectividad irrazonable de los datos. En otras palabras, obtener muchos más datos a menudo puede superar la obtención de modelos estadísticos o de aprendizaje automático mucho mejores en casi todos los casos. Y el paso más importante para desarrollar un algoritmo de aprendizaje automático después de definir una pregunta es recopilar los datos correctos. 

#Datos que son relevantes para la pregunta que está tratando de responder. Las características también importan. Entonces, las propiedades importantes de las buenas características son que comprimen los datos de una manera que hace posible calcular su predicción, o su algoritmo de aprendizaje automático, de una manera muy simple. 

#Y tal vez sean más interpretables que los datos que ha recopilado, esos son los datos sin procesar que pueden ser complicados. Lo son, las buenas características retienen toda la información relevante mientras comprimen los datos, y ese puede ser un equilibrio difícil de lograr. Por lo general, también se crean con conocimientos de aplicaciones de expertos, y esto es algo que hay un debate en la comunidad sobre si es mejor crear funciones automáticamente o si es mejor utilizar el conocimiento de dominio de expertos.


#Y, en general, parece que el conocimiento experto del dominio puede ayudar bastante en muchas, muchas aplicaciones, por lo que debe consultarse al crear funciones para el algoritmo de aprendizaje automático. Algún error común es intentar automatizar la selección de funciones de una manera que no le permite comprender cómo son realmente esas funciones. 

#Se aplica para hacer buenas predicciones. Las predicciones de caja negra pueden ser muy útiles, pueden ser muy precisas pero también pueden cambiar en un centavo si no prestamos atención a cómo esas características realmente predicen el resultado. No prestar atención a las peculiaridades específicas de los datos es otro problema que puede surgir en algunos casos. 

#La función de un conjunto de datos en particular puede ser que haya esquemas si hay comportamientos extraños de características específicas y no comprenderlos puede causar problemas. Y, obviamente, tirar información innecesariamente no es una buena idea. Puede automatizar las selecciones de funciones a veces con cuidado; de hecho, hay toda un área de investigación que se ha dedicado a esto, por lo que yo llamaría una especie de aprendizaje semi supervisado o aprendizaje profundo. 

#Entonces, la idea en este documento fue intentar usar, tratar de descubrir características de los videos de YouTube. Eso podría usarse luego en algoritmos de predicción. Entonces, por ejemplo, pudieron crear un predictor muy preciso de si eras un gato en un video o no. Basado en un montón de características que recopilaron de forma no supervisada. En otras palabras, filtraron los datos para identificar aquellas características que podrían ser útiles para algoritmos predictivos posteriores. 

#Pero incluso cuando hicieron esto, volvieron a mirar esas características y trataron de averiguar por qué serían predictivas y, por ejemplo, estas características, esta característica aquí deja muy claro por qué sería un buen predictor para un gato. Porque puedes ver la imagen de un gato en el video. Característica que han recopilado. Los algoritmos importan menos de lo que piensas, y esto puede ser una fuente de sorpresa y frustración para algunas personas. 

#Así que esta es una, una tabla en la que realmente intentaron predecir una variedad de tareas de predicción diferentes, por ejemplo, una especie de tarea de segmentación, predecir votos en la Cámara de Representantes de EE. UU. Y predecir formas de onda, y un montón de otras tareas de predicción diferentes. 

#Y lo hicieron de dos formas diferentes, primero usaron algo llamado análisis discriminante lineal, que es una especie de predictor temprano muy básico que puede aprender. Y luego también intentaron para cada conjunto de datos encontrar el mejor algoritmo de predicción absoluto que pudieran tener y luego esta tabla muestra el error de predicción de estos dos enfoques diferentes. 


#Y puede ver que el mejor error de predicción es siempre un poco mejor que el error discriminante lineal. Pero, en realidad, no está tan lejos. Entonces, por ejemplo, aquí en esta predicción de Pima, fue 0.19 fue el, 0.197 fue el error con el mejor método. 

#Y 0,22 para análisis discriminatorio lineal. Entonces, parece que usar el mismo método una y otra vez empeoró el error de predicción, pero no increíblemente peor. Y eso es muy típico de muchas aplicaciones. 

#Ese. El uso de un enfoque muy sensible le dará una gran importancia para resolver el problema. Y luego, obtener el mejor método absoluto puede mejorar, pero a menudo no mejora mucho sobre la mayoría de los buenos métodos sensibles. 

#Algunas cuestiones a tener en cuenta al crear un algoritmo de aprendizaje automático están ahí, tiene diferentes componentes. En primer lugar, es posible que necesite que sea interpretable. En otras palabras, si va a mostrar este algoritmo de aprendizaje automático a los médicos o, en mi caso. O en el caso de una empresa web, es posible que desee mostrárselo al director ejecutivo. 

#Quiere que su predictor sea interpretable para que ellos puedan entenderlo. Parte de ser interpretable a menudo es ser simple, en otras palabras, ser muy fácil de explicar a menudo es mejor que ser realmente complicado y difícil de entender. Y a menudo hay compensaciones con respecto a la precisión, por lo que obtener esas dos cualidades puede reducir su precisión, y la pregunta es cuánto lo hacen. Reduzca su precisión. ¿Es demasiado renunciar a la interpretabilidad y la sencillez que se obtiene? 

#También desea que sea escalable y rápido. Por rápido me refiero a que es muy fácil construir el modelo, es muy fácil probar el modelo en pequeñas muestras. Escalable significa que es fácil de aplicar a un gran conjunto de datos. Ya sea porque es muy, muy rápido o porque es paralelizable en múltiples muestras, por ejemplo. Entonces, en la predicción general, se trata de compensaciones de precisión. Entonces, la idea es que a veces intercambiará mucha precisión o un poco de precisión por interpretabilidad. A veces lo cambiará por velocidad, simplicidad o escalabilidad.

#Pero, en general, lo que está tratando de hacer es encontrar el equilibrio adecuado entre esas, esas otras características del algoritmo de predicción que podrían ser importantes para usted y qué tan preciso necesita que sea. La interpretabilidad a menudo es importante, por lo que, por ejemplo, en estudios médicos, este es un artículo que estudió cómo a algunos médicos les gusta una mejor predicción


#Reglas que se ven así, se parecen un poco a árboles de decisión. En otras palabras. Empiezas y dices que si el colesterol total está por encima de un valor particular y fumas, obtienes un resultado determinado. Entonces, ese tipo de declaraciones si / entonces pueden ser muy interpretables para algunas personas, y esa es la razón por la que a la gente le gustan cosas como los árboles de decisión. 

#Y eso puede importar más o menos dependiendo de cuál sea nuestro, el propósito de su algoritmo. Pero la interpretabilidad evita cosas como el problema de las tendencias de la gripe de Google, donde la gente realmente no entendía cómo las características estaban directamente relacionadas con la tasa de gripe. 

#Entonces, si no comprende cómo funcionan las funciones, puede quedar atrapado cuando el algoritmo comienza a tener problemas o falla. La escalabilidad también importa. Un componente muy interesante de este desafío de Netflix es que el premio de Netflix fue un desafío de un millón de dólares, y tuvieron muchos equipos compitiendo, y varios equipos produjeron algoritmos analíticos que eran mucho mejores para predecir que el algoritmo original de Netflix. 

#Pero resulta que en realidad nunca implementaron el algoritmo final en su maquinaria de producción, y la razón fue. Que el algoritmo no escalado muy bien. Era una combinación de muchos, muchos algoritmos de aprendizaje automático diferentes y tomó mucho tiempo viajar, computar particularmente en los enormes conjuntos de datos que Netflix estaba recopilando. Y, en realidad, optaron por algo que era un poco menos preciso, pero silencioso, un poco más escalable. Entonces eso dice una lección de precisión que no siempre es la mejor. 

#Y el único responsable de la toma de decisiones al intentar crear algoritmos de predicción. Aunque suele ser en el que más se concentra.



