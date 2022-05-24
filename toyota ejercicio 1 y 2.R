library(dummies)
library(GGally)
library(gplots)

toyota.df<- read.csv("ToyotaCorolla.csv")

str(toyota.df)

#b)
#PASAMOS A FACTORES 

toyota.df$Mfg_Year <- factor(toyota.df$Mfg_Year)


toyotadummy.df <- dummy.data.frame(toyota.df[,-c(1,2,5,6,11,15)])
toyotadummy.df


#Matriz de correlacion
Cor_Matrix <- round(cor(toyotadummy.df),2)
Cor_Matrix

#c)


Toyota_a <- toyotadummy.df[,-c(8,9,15,16,29,30,31,32,33,34,35)]
Toyota_a

#Heatmap to analyse all data
heatmap.2(cor(Toyota_a), Rowv = FALSE, Colv = FALSE, dendrogram = "none",
          cellnote = round(cor(Toyota_a),2),
          notecol = "black", key = FALSE, trace = 'none', margins = c(10,10))

Toyota_Co.df <- toyotadummy.df[,c(1,2,3,7,10,11,12,13,14,17)]
Toyota_Co.df



heatmap.2(cor(Toyota_Co.df), Rowv = FALSE, Colv = FALSE, dendrogram = "none",
          cellnote = round(cor(Toyota_Co.df),2),
          notecol = "black", key = FALSE, trace = 'none', margins = c(10,10))

#d)



Toyota_Drop.df <- Toyota_Co.df[,-c(5,6,7,10)]
Toyota_Drop.df




heatmap.2(cor(Toyota_Drop.df), Rowv = FALSE, Colv = FALSE, dendrogram = "none",
          cellnote = round(cor(Toyota_Drop.df),2),
          notecol = "black", key = FALSE, trace = 'none', margins = c(10,10))


#e)
#grafica
y<-Toyota_Drop.df
y

Cor_Matrix <- round(cor(y),2)
Cor_Matrix

ggpairs(Toyota_Drop.df)


