#Proyecto Español

library(tidyverse)
library(caret)
library(corrplot)
library(rpart)
library(reshape2)
library(ROCR)
library(rattle)
#Cargando los datos

training <- read.csv("datos_proyecto/training.csv", header = TRUE)
testing <- read.csv("datos_proyecto/testing.csv", header = TRUE)

#Creo factor de classe

training$classe <- as.factor(training$classe)


dim(training)  #19622   161
dim(testing)   #20 161


#Elimino los que creo el csv como columna id

training$X.1 <- NULL
testing$X.1 <- NULL

#Limpio los datos de las columnas que tienen NA y no sirven


training <- training[,colSums(is.na(training)) == 0]
testing <- testing[,colSums(is.na(testing)) == 0]

head(training)
head(testing)

#Las primeras 7 columnas son inutiles

training[,c(1:7)] <- NULL
testing[,c(1:7)] <- NULL

#Creo una particion de prueba en la de training ya que la de testing es muy pequeña y puedo caer en un sobre ajuste

index <- createDataPartition(training$classe, times = 1, p = 0.7, list = FALSE)

training_wp <-  training[index,]
testing_wp <- training[-index,]

#Buscando Correlación entre variables 

head(training_wp)

summary(training_wp)


#Eliminando los que no tienen varianza con la funcion nearZeroVar de la libreria caret.

zerovar_wp <- nearZeroVar(training_wp)

training_wp <- training_wp[, -zerovar_wp]
testing_wp <- testing_wp[, -zerovar_wp]

#buscando Correlaciones entre las variables de datos


training_cor <- cor(training_wp[,c(1:52)], method = "pearson")

round(training_cor, digits = 2)

#corrplot(training_cor)

training_melted <- melt(training_cor)

head(training_melted)

#training_melted %>% ggplot(aes(Var1, Var2, fill = value)) + geom_tile()


get_lower_triangle <- function(cormat) {
  cormat[upper.tri(cormat)] <- NA
  return(cormat)
}


get_upper_triangle <- function(cormat) {
  cormat[lower.tri(cormat)] <- NA
  return(cormat)
}

reorder_cormat <- function(cormat){
  dd <- as.dist((1-cormat)/2)
  hc <-  hclust(dd)
  cormat <- cormat[hc$order, hc$order]
}

cormat <- reorder_cormat(training_cor)
cormat_ut <- get_upper_triangle(cormat)
cormat_ut_melted <- melt(cormat_ut, na.rm = TRUE)

cormat_ut_melted %>% ggplot(aes(Var2, Var1, fill = value)) + 
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name = "Pearson/Correlation") + theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, size = 12, hjust = 1)) +
  coord_fixed()

#Buscando los mas correlacionados de mas de un 80% de coincidencia

train_hight_correlation <- findCorrelation(cormat, cutoff = 0.80)

names(training_wp)[train_hight_correlation] 


#gyros_forearm_y+gyros_belt_y+gyros_belt_x+gyros_arm_x+gyros_dumbbell_x+yaw_arm+magnet_belt_x+roll_arm+accel_dumbbell_y+pitch_belt+magnet_dumbbell_x+yaw_belt+magnet_arm_x  

#Utilizando solo los que estan altamente correlacionados

training_wp_hc <- training_wp[train_hight_correlation]
training_wp_hc$classe <- training_wp$classe

testing_wp_hc <- testing_wp[train_hight_correlation]
testing_wp_hc$classe <- testing_wp$classe

#Creando los modelos ajustados

#Random Forest

fit_rf <- train(classe~., data = training_wp_hc, method = "rf" )
predict_rf <- predict(fit_rf, testing_wp_hc)
cm_rf <- confusionMatrix(predict_rf, testing_wp_hc$classe)$overall["Accuracy"]  #0.9826678

ggplot(fit_rf, highlight = TRUE)

#Red Neural

fit_nnet <- train(classe~., data = training_wp_hc, method = "nnet")
predict_nnet <- predict(fit_nnet, testing_wp_hc)
cm_nnet <- confusionMatrix(predict_nnet, testing_wp_hc$classe)$overall["Accuracy"]  #0.4044

#Asignación Latente de Dirichlet (ALD) o Latent Dirichlet Allocation (LDA) 

fit_lda <- train(classe~., data = training_wp_hc, method = "lda")
predict_lda <- predict(fit_lda, testing_wp_hc)
cm_lda <- confusionMatrix(predict_lda, testing_wp_hc$classe)$overall["Accuracy"] #0.4010

#Potenciación del gradiente GBM

fit_gbm <- train(classe~.,data = training_wp_hc, method = "gbm")
predict_gbm <- predict(fit_gbm, testing_wp_hc)
cm_gmb <- confusionMatrix(predict_gbm, testing_wp_hc$classe)$overall["Accuracy"] #0.8973662

#Arboles de decision 

fit_rpart <- train(classe~.,data = training_wp_hc, method = "rpart")
predict_rpart <- predict(fit_rpart, testing_wp_hc)
cm_rpart <- confusionMatrix(predict_rpart, testing_wp_hc$classe)$overall["Accuracy"]


fancyRpartPlot(fit_rpart$finalModel)

#Validacion cruzada Random Forest

control <- trainControl(method = "cv", number = 10, p = .9)

fit_rf_cv <- train(classe~., data = training_wp_hc, method = "rf", trControl = control )
predict_rf_cv <- predict(fit_rf_cv, testing_wp_hc)
cm_rf_cv <- confusionMatrix(predict_rf_cv, testing_wp_hc$classe)$overall["Accuracy"]
cm_rf_cv_total <- confusionMatrix(predict_rf_cv, testing_wp_hc$classe)

ggplot(fit_rf_cv, highlight = TRUE)


#En las dos graficas de random forest se observa que si se eligen mas de 10 variables predictoras la precision cae, sin embargo está sobre el 95% debido a que utilizamos las 13 variables con mayor correlacion. 

#Graficando Matriz de confusion para  

table(testing_wp_hc$classe, predict_rf_cv, dnn = c("Actual", "Predict"))

table <- data.frame(confusionMatrix(predict_rf_cv, testing_wp_hc$classe)$table)

plotTable <- table %>%
  mutate(tp_fp = ifelse(table$Prediction == table$Reference, "TP", "FP")) %>%
  group_by(Reference) %>%
  mutate(prop = Freq/sum(Freq))

ggplot(data = plotTable, mapping = aes(x = Reference, y = Prediction, fill = tp_fp, alpha = prop)) +
  geom_tile() +
  geom_text(aes(label = Freq), vjust = .5, fontface  = "bold", alpha = 1) +
  scale_fill_manual(values = c(TP = "green", FP = "red")) +
  theme_bw() +
  xlim(rev(levels(table$Reference)))



#Utilizando los dos modelos mas cercanos combinados

coincidencia <- predict_rf_cv == predict_gbm

Agreement_accuracy <- confusionMatrix(testing_wp_hc$classe[coincidencia], predict_rf[coincidencia])$overall["Accuracy"]


table(Agreement_accuracy) 


#Obtain OOB error in:


cm_rf_cv_total$err.rate[,1]


#Aplicando RF a la data valida 


predict_test <- predict(fit_rf_cv, newdata=testing)
predict_test
