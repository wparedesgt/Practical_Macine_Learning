#Proyecto Español

#Carga los datos

training <- read.csv("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv", header = TRUE)
testing <- read.csv("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv", header = TRUE)

names(training)
names(testing)

write.csv(training, "datos_proyecto/training.csv", row.names = TRUE)
write.csv(testing, "datos_proyecto/testing.csv", row.names = TRUE)

training <- read.csv("datos_proyecto/training.csv", header = TRUE)
testing <- read.csv("datos_proyecto/testing.csv", header = TRUE)

library(tidyverse)
library(caret)
library(lubridate)


names(training)
names(testing)

training$X.1 <- NULL
testing$X.1 <- NULL

