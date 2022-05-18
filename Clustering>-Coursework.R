getwd()

#read the data file
Credit_Card<-read.csv("Credit.card.csv",header=TRUE)


#inspect the data set
names(Credit_Card)
head(Credit_Card)
tail(Credit_Card)
summary(Credit_Card)
str(Credit_Card)
View(Credit_Card)
ncol(Credit_Card)
dim(Credit_Card)
nrow(Credit_Card)
 

 #select  5 columns for the cluster analysis
Credit_Card<-Credit_Card [,c(1,2,4,7,9)]

#normalize the credit_card data set
min_max_norm <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}
summary(Credit_Card)
Credit_norm <- as.data.frame(lapply(Credit_Card[2:5], min_max_norm))
View(Credit_norm)



blend <- cbind(Credit_Card$CUST_ID,Credit_norm)
View(blend)


distance <- dist(Credit_Card,method = "euclidean,")
print(distance)

install.packages("factoextra")
activate(factoextra)
fviz_dist()








