#---------------------------------------------------------------------------------------------

#                      Load data & libraries				#

#---------------------------------------------------------------------------------------------
data = read.csv(file.choose(),sep=",",header=TRUE)
library("party")
#---------------------------------------------------------------------------------------------

#                      Data description and Data preparation				#

#---------------------------------------------------------------------------------------------
#Dimension of data
dimension = dim(data) 
print(paste("There are ",dimension[1]," observations and ",dimension[2]," variables"))
#Names of variables
print(names(data))
#Show first 6 line of data
View(head(data)) 
#Data types and description
str(data) 
#To know the number of possible values for categorical variables
for(i in 1:dimension[2])
{
  if(typeof(data[[names(data)[i]]]) == "character"){
    print(paste(names(data)[i]," have ",length(unique(data[[names(data)[i]]]))," possible values"))
  }  
}
#Check the missing data
anyNA(data) 
#Remove the duplicate variables
data$identifierHash = NULL
data$type = NULL
data$civilityGenderId = NULL #Like gender
data$country = NULL #Like countryCode
#New dimension
dimension = dim(data) 
print(paste("There are ",dimension[1]," observations and ",dimension[2]," variables"))
#Converter the character variables to factors variables
for(i in 1:dimension[2])
{
  if(typeof(data[[names(data)[i]]]) == "character"){
    data[[names(data)[i]]] = factor(data[[names(data)[i]]])
  }  
}
#Check the converting
str(data)
#---------------------------------------------------------------------------------------------

#                      Data exploration				#

#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
#                      I)	Data Exploration (Univariate exploration)				#
#---------------------------------------------------------------------------------------------
#                      A)	The categorical variables				#
#---------------------------------------------------------------------------------------------
#function to create pie charts and barplot
createPiechart <- function(data,name,n) {
  tab = table(data[[name]])
  valeurs = names(tab)
  nb = length(valeurs)
  labs = c()
  for(i in 1:nb){
    labs = append(labs,paste(round((tab[i]/dimension[1])*100),"% "))
  }
  pie(tab,col = rainbow(length(tab)),labels = labs,main =paste("Figure ", n ," : Pie charts of ",name))
  legend("topright", valeurs, cex = 0.8,fill = rainbow(nb))
}
createBarplot <- function(data,name,n) {
  tab = table(data[[name]])
  valeurs = names(tab)
  nb = length(valeurs)
  barplot(tab,col = rainbow(nb),main = paste("Figure ", n ,": Barplot of ",name),xlab = paste("Figure ",n," : Barplot of ",name),ylab ="Frequency",legend = valeurs)
}
createBarplot2 <- function(data,name,n) {
  tab = table(data[[name]])
  valeurs = names(tab)
  nb = length(valeurs)
  print(max(tab))
  barplot(tab,col = rainbow(nb),main = paste("Figure ", n ,": Barplot of ",name),xlab = paste("Figure ",n," : Barplot of ",name),ylab ="Frequency")
}
#Language (figure 1 and figure 2)
createPiechart(data,"language",1)
createBarplot(data,"language",2)
#Gender (figure 3 and figure 4)
createPiechart(data,"gender",3)
createBarplot(data,"gender",4)
#Gender (civilityTitle 5 and figure 6)
createPiechart(data,"civilityTitle",5)
createBarplot(data,"civilityTitle",6)
#hasAnyApp (figure 7 and figure 8)
createPiechart(data,"hasAnyApp",7)
createBarplot(data,"hasAnyApp",8)
#hasAndroidApp (figure 9 and figure 10)
createPiechart(data,"hasAndroidApp",9)
createBarplot(data,"hasAndroidApp",10)
#hasIosApp (figure 11 and figure 12)
createPiechart(data,"hasIosApp",11)
createBarplot(data,"hasIosApp",12)
#hasProfilePicture (figure 13 and figure 14)
createPiechart(data,"hasProfilePicture",13)
createBarplot(data,"hasProfilePicture",14)
#countryCode (figure 17)
createBarplot2(data,"countryCode",15)
#---------------------------------------------------------------------------------------------
#                      B)	The numeric variables				#
#---------------------------------------------------------------------------------------------
#function to create histogram , boxplot and scatter plot
createBoxplot <- function(data,name,n) {
  boxplot(data[[name]],main = paste("Figure ", n," : Boxplot of ",name),ylab="Frequency",xlab =paste("Figure ", n," : Boxplot of ",name))
}
createHistogram <- function(data,name,n) {
  hist(data[[name]],main = paste("Figure ", n," : Histogram of ",name),ylab="Frequency",xlab =paste("Figure ", n," : Histogram of ",name))
}
#---------------------------------------------------------------------------------------------
#                     Boxplots and histogram				#
#---------------------------------------------------------------------------------------------
#socialNbFollowers (figure 16 and figure 17)
summary(data[["socialNbFollowers"]])
createBoxplot(data,"socialNbFollowers",16)
createHistogram(data,"socialNbFollowers",17)
#socialNbFollows (figure 18 and figure 19)
summary(data[["socialNbFollows"]])
createBoxplot(data,"socialNbFollows",18)
createHistogram(data,"socialNbFollows",19)
#socialProductsLiked (figure 20 and figure 21)
summary(data[["socialProductsLiked"]])
createBoxplot(data,"socialProductsLiked",20)
createHistogram(data,"socialProductsLiked",21)
#ProductsListed (figure 22 and figure 23)
summary(data[["productsListed"]])
createBoxplot(data,"productsListed",22)
createHistogram(data,"productsListed",23)
#ProductsSold (figure 24 and figure 25)
summary(data[["productsSold"]])
createBoxplot(data,"productsSold",24)
createHistogram(data,"productsSold",25)
#ProductsPassRate (figure 26 and figure 27)
summary(data[["productsPassRate"]])
createBoxplot(data,"productsPassRate",26)
createHistogram(data,"productsPassRate",27)
#ProductsBought (figure 28 and figure 29)
summary(data[["productsBought"]])
createBoxplot(data,"productsBought",28)
createHistogram(data,"productsBought",29)
#daysSinceLastLogin (figure 30 and figure 31)
summary(data[["daysSinceLastLogin"]])
createBoxplot(data,"daysSinceLastLogin",30)
createHistogram(data,"daysSinceLastLogin",31)
#seniority (figure 32 and figure 33)
summary(data[["seniority"]])
createBoxplot(data,"seniority",32)
createHistogram(data,"seniority",33)
#seniorityAsMonths (figure 34 and figure 35)
summary(data[["seniorityAsMonths"]])
createBoxplot(data,"seniorityAsMonths",34)
createHistogram(data,"seniorityAsMonths",35)
#seniorityAsYears (figure 36 and figure 37)
summary(data[["seniorityAsYears"]])
createBoxplot(data,"seniorityAsYears",36)
createHistogram(data,"seniorityAsYears",37)
#productsWished  (figure 38 and figure 39)
summary(data$productsWished)
boxplot(data$productsWished,main = paste("Figure ", 38," : Boxplot of ","productsWished"),ylab="Frequency",xlab =paste("Figure ", 38," : Boxplot of ","productsWished"))
hist(data$productsWished,main = paste("Figure ", 39," : Histogram of ","productsWished"),ylab="Frequency",xlab =paste("Figure ", 39," : Histogram of ","productsWished"))
#---------------------------------------------------------------------------------------------
#                      I)	Data Exploration (Bivaraite exploration)				#
#---------------------------------------------------------------------------------------------
#Scatter plot productsBought
#vs socialNbFollowers
plot(data$productsBought,data$socialNbFollowers,main = "Figure 40: productsBought-socialNbFollowers",xlab = "ProductsBought",ylab = "socialNbFollowers")
#vs socialNbFollows
plot(data$productsBought,data$socialNbFollows,main = "Figure 41: productsBought-socialNbFollows",xlab = "ProductsBought",ylab = "socialNbFollows")
#vs socialProductsLiked
plot(data$productsBought,data$socialProductsLiked,main = "Figure 42: productsBought-socialProductsLiked",xlab = "ProductsBought",ylab = "socialProductsLiked")
#vs productsListed
plot(data$productsListed,data$productsListed,main = "Figure 43: productsBought-productsListed",xlab = "ProductsBought",ylab = "productsListed")
#vs productsSold
plot(data$productsBought,data$productsSold,main = "Figure 44: productsBought-productsSold",xlab = "ProductsBought",ylab = "productsSold")
#vs productsPassRate
plot(data$productsBought,data$productsPassRate,main = "Figure 45: productsBought-productsPassRate",xlab = "ProductsBought",ylab = "productsPassRate")
#vs gender
plot(data$productsBought,data$gender,main = "Figure 46: productsBought-gender",xlab = "ProductsBought",ylab = "gender")
#vs seniority
plot(data$productsBought,data$seniority,main = "Figure 47: productsBought-seniority",xlab = "ProductsBought",ylab = "seniority")
#vs seniorityAsMonths
plot(data$productsBought,data$seniorityAsMonths,main = "Figure 48: productsBought-seniorityAsMonths",xlab = "ProductsBought",ylab = "seniorityAsMonths")
#vs seniorityAsYears
plot(data$productsBought,data$seniorityAsYears,main = "Figure 49: productsBought-seniorityAsYears",xlab = "ProductsBought",ylab = "seniorityAsYears")
#vs productsWished
plot(data$productsBought,data$productsWished,main = "Figure 50: productsBought-productsWished",xlab = "ProductsBought",ylab = "productsWished")
#scatter plots of productsSold
#vs socialNbFollowers
plot(data$productsSold,data$socialNbFollowers,main = "Figure 51: productsSold-socialNbFollowers",xlab = "productsSold",ylab = "socialNbFollowers")
#vs socialNbFollows
plot(data$productsSold,data$socialNbFollows,main = "Figure 52: productsSold-socialNbFollows",xlab = "productsSold",ylab = "socialNbFollows")
#vs socialProductsLiked
plot(data$productsSold,data$socialProductsLiked,main = "Figure 53: productsSold-socialProductsLiked",xlab = "productsSold",ylab = "socialProductsLiked")
#vs productsListed
plot(data$productsSold,data$productsListed,main = "Figure 54: productsSold-productsListed",xlab = "productsSold",ylab = "productsListed")
#vs productsPassRate
plot(data$productsSold,data$productsPassRate,main = "Figure 55: productsSold-productsPassRate",xlab = "productsSold",ylab = "productsPassRate")
#vs productsBought
plot(data$productsSold,data$productsBought,main = "Figure 56: productsSold-productsBought",xlab = "productsSold",ylab = "productsBought")
#vs gender
plot(data$productsSold,data$gender,main = "Figure 57: productsSold-gender",xlab = "productsSold",ylab = "gender")
#vs daysSinceLastLogin
plot(data$productsSold,data$daysSinceLastLogin,main = "Figure 58: productsSold-daysSinceLastLogin",xlab = "productsSold",ylab = "daysSinceLastLogin")
#vs seniority
plot(data$productsSold,data$seniority,main = "Figure 59: productsSold-seniority",xlab = "productsSold",ylab = "seniority")
#vs seniorityAsMonths
plot(data$productsSold,data$seniorityAsMonths,main = "Figure 60: productsSold-seniorityAsMonths",xlab = "productsSold",ylab = "seniorityAsMonths")
#vs productsWished
plot(data$productsSold,data$productsWished,main = "Figure 61: productsSold-productsWished",xlab = "productsSold",ylab = "productsWished")

#---------------------------------------------------------------------------------------------
#                      I)	Data Exploration (Bivariate exploration)				#
#---------------------------------------------------------------------------------------------
#                      A)	Numeric variables				#
#---------------------------------------------------------------------------------------------
#copy data and delete the factors varaibles
data2 = data
for(i in 1:dim(data2)[2])
{
  if(class(data[[names(data)[i]]]) == "factor"){
    data2[[names(data)[i]]] = NULL
  }  
}
#Show the correlation
View(cor(data2))
#Delete the seniorityAsYears and seniority
data$seniority = NULL
data$seniorityAsYears = NULL
#---------------------------------------------------------------------------------------------

#                      Data clustering and cluster validation				#

#---------------------------------------------------------------------------------------------
#create the new column leaveStore
data$leaveStore = c(1:nrow(data))
for(i in 1:nrow(data))
{
  if(data[["productsBought"]][i] == 0 && data[["productsSold"]][i] == 0)
    data[["leaveStore"]][i] = "yes"
  else
    data[["leaveStore"]][i] = "no"
  
}
data$leaveStore = factor(data$leaveStore)
#copy data
data2 = data
#delete productsBought and productsSold
data2$productsBought = NULL
data2$productsSold = NULL
#convert all categorical variables to numeric variables
for(i in 1:(dim(data2)[2]-1))
{
  if(class(data2[[names(data2)[i]]]) == "factor"){
    data2[[names(data2)[i]]] = as.numeric(data2[[names(data2)[i]]])
  }  
}
#Apply of k-means
clust=kmeans(x=data2[,1:(ncol(data2)-1)], centers=2,iter.max=10,nstart=30)
#Resut
clust$cluster
clust$centers
clust$size
clust$totss
clust$withinss
clust$tot.withinss #sum(withinss)
#Evalution of inertie
inertie=c()
for(k in 2:10){
clust=kmeans(x=data2[,1:(ncol(data2)-1)], centers=2,iter.max=10,nstart=30)
inertie=c(inertie,clust$tot.withinss)}
inertie=c(clust$totss,inertie)
#Show the plot of the inertie Figure A-1
plot(inertie,type="b",main="Figure A-1 : Data cluster using k-means",xlab="Number of iteration")
#Cluster groups with socialNbFollowers A-2
plot(data2[,2:3],col=c("red","blue")[clust$cluster],main="Figure A-2 : Data cluster with k-means")
#Figure A-3
plot(data2[,2:3],col=c("red","blue")[clust$cluster],main="Figure A-3 : Data cluster with k-means")
points(clust$centers[,2:3],col="black",pch=10)
#Figure 4
plot(data2[,3:4],col=c("red","blue")[clust$cluster],pch=c(4,5)[data2$leaveStore],main="Figure A-4 : Data cluster with k-means")
#---------------------------------------------------------------------------------------------

#                      Data classification and validation				#

#---------------------------------------------------------------------------------------------
#copy data
data2 = data
#delete productsBought and productsSold
data2$productsBought = NULL
data2$productsSold = NULL
# diviser en 2/3 train et 1/3 test
nbTrain=dim(data2)[1]*2/3
nbTrain
nbTrain=as.integer(nbTrain)
trainIndex=sample(nrow(data2),nbTrain)
train=data2[trainIndex,]
test=data2[-trainIndex,]
#creation of tree
arbre=ctree(formula=leaveStore~language+socialNbFollowers+socialNbFollows+socialProductsLiked+productsListed+productsPassRate+productsWished+gender+civilityTitle+hasAnyApp+hasAndroidApp+hasIosApp+hasProfilePicture+daysSinceLastLogin+seniorityAsMonths+countryCode,data=train)
arbre
plot(arbre,main="Figure B1 : Decision Tree")
#prediction des classes de l’ensemble de test
prediction=predict(arbre, newdata =test, interval = "prediction")
prediction
#tracer la table de contingence
contingence=table(rel=test$leaveStore,prediction)
contingence
#calculer la précision de classification
precision=sum(diag(contingence))/sum(contingence)
precision
#calculer l’erreur
error=1-precision
error