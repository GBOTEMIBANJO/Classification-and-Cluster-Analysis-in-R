getwd()

#read the data file
Credit_Card<-read.csv("Credit.card.csv",header=TRUE)


#inspect the data set
names(Credit_Card)
head(Credit_Card)
tail(Credit_Card)
summary(Credit_Card)
str(Credit_Card)

ncol(Credit_Card)
dim(Credit_Card)
nrow(Credit_Card)
 

#normalize the credit_card data set
#install caret package
install.packages("caret")
#activate caret package
library(caret)

#pre-process the data
preproc<- preProcess(Credit_Card, method = "range")

#perform the normalisation
Credit_Card<-predict(preproc,Credit_Card,c(2:18))
View(Credit_Card)

#view results
summary(Credit_Card)


#install.packages("factoextra")
library("factoextra")

#Assessing clustering tendency
tendency <- get_clust_tendency(Credit_Card[,2:18], 10, graph = TRUE)
tendency$hopkins_stat


#find missing rows
#install the skimr package
install.packages("skimr")
#activate the skimr package
library(skimr)
#apply skim function to data
skim(Credit_Card)

Credit_Card<-
  Credit_Card[!is.na(Credit_Card$CREDIT_LIMIT),]

Credit_Card$MINIMUM_PAYMENTS <- NULL
Credit_Card <- Credit_Card[,2:17]

#standardize credit card data 
scale(Credit_Card, center = TRUE, scale = TRUE)
summary(Credit_Card)
skim(Credit_Card)
#choose the right number of expected clusters (k)
fviz_nbclust(Credit_Card, kmeans, method = "wss")


#perform k-means clustering on  Credit_Card dataset with k=2
set.seed(123)
cluster <- kmeans(Credit_Card, centers =2, nstart = 25)
cluster$size

# #plot(cluster)
fviz_cluster(cluster,Credit_Card)
fviz_cluster(cluster,Credit_Card,elipse.type="norm")


