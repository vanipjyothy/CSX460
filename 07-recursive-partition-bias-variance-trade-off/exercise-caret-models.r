---
title: "Improving Model Perfromance / Tuning Parameters"
author: "Vani P Jyothy"
date: "`r Sys.Date()`"
output: pdf_document
---


## Tuning Parameter

Generically and regardless of model type, what are the purposes of a model tuning parameters?


## Caret Models

This assignment demonstrates the use of caret for constructing models. 
Each model should be built and compared using using `Kappa` as the performance
metric calculated using 10-fold repeated cross-validation with 3 folds.

Using the rectangular data that you created for the NYCFlights to create a model
for arr_delay >= 15 minutes.

- glm

```{r}
train_control<- trainControl(method="cv", number=3, savePredictions = TRUE)

fit_glm


```
- rpart
- knn
- C50
- randomForest
- adaBoost
- Two methods of your choice from the Caret Model List (you will need to install any dependencies)

Save the caret objects with the names provided.

```{r init, warning=FALSE, echo=FALSE, message=FALSE}
library(rpart)
library(caret)
library("ROCR")
library(data.table)
library(magrittr)
library(dplyr)
library(rpart)
library(rpart.plot)


```


## Exercise 1: caret/logistic regression (5 points)

Rebuild your logistic regression model from the previous week, this time using the `caret` package. 
```{r,echo=FALSE}

flights_dt=fread("C:\\Users\\Vani\\Downloads\\UCB\\CSX460\\02-building-blocks\\02-exercise-nycflights\\data\\flights.csv")

#reading the AIRPORT dataset

airports_dt=fread("C:\\Users\\Vani\\Downloads\\UCB\\CSX460\\02-building-blocks\\02-exercise-nycflights\\data\\airports.csv")

#Reading the PLANES data set

planes_dt=fread("C:\\Users\\Vani\\Downloads\\UCB\\CSX460\\02-building-blocks\\02-exercise-nycflights\\data\\planes.csv")
planes_dt

#reading the WEATHER dataset
weather_dt=fread("C:\\Users\\Vani\\Downloads\\UCB\\CSX460\\02-building-blocks\\02-exercise-nycflights\\data\\weather.csv")

#Joining to make a single data table

Aviation=left_join(flights_dt,weather_dt,by=c("origin","year","month","day","hour") ) %>%
  left_join(planes_dt, by='tailnum') %>% 
  left_join(airports_dt, by=c('origin'='faa') ) %>% 
  left_join(airports_dt, by=c('dest'='faa') )

Aviation_new=mutate(Aviation,arr_delay_15=ifelse(arr_delay>15,0,1))
Aviation1=Aviation_new[, c("arr_delay","arr_delay_15", "visib","precip","humid","temp","dep_delay","arr_time","carrier","origin","dest","air_time","sched_arr_time","month","distance")]


Aviation1=subset(Aviation1, (!is.na(Aviation1[,2])))

```
#Data set used after doing the necessary preprocessing and only selecting the required fiels

```{r}

str(Aviation1)

```
# Splitting the data into tesing and training data set
```{r}
set.seed(1)
Train <- createDataPartition(Aviation1$arr_delay_15, p=0.6, list=FALSE,times=1)
training <- Aviation1[ Train, ]
testing <- Aviation1[ -Train, ]

#Converting the output variable to a factor variable
training$arr_delay_15=factor(training$arr_delay_15)
testing$arr_delay_15=factor(testing$arr_delay_15)

```


# Your work here.

fit.glm <- ..
fit.knn <- ..
fit.rpart <- ..
fit.rf <- ..
fit.myown1 <- ..
fit.myown1 <- ..
```

Compare the  models?

Which is best?  Why?

```
```
