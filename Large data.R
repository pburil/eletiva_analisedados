library(data.table)
install.packages('ff')
library(ff)

#criando base de dados large
casos= 1e7

basededados = data.table(a= rbinom(casos, 7, 0.7),
                         b= rnbinom(casos, 2, 0.7),
                         c= rpois(casos, 5),
                         d= rnorm(casos),
                         e= rnorm(casos),
                         f= rpois(casos, 9),
                         g= sample(c("Direita", "Esquerda", "Centro", "Centro-direita", "Centro-Esquerda"), casos, replace = TRUE),
                         h= rbinom(casos, 2, 0.7))

object.size(basededados)

head(basededados)

# salvando em disco
write.table(basededados,"C:\\Users\\55819\\Documents\\R\\Eletiva analise de dados\\eletiva_analisedados\\bases_tratadas.csv",sep=",",row.names=FALSE,quote=FALSE) 

#Extra��o

enderecoBase <- 'C:\\Users\\55819\\Documents\\R\\Eletiva analise de dados\\eletiva_analisedados\\bases_tratadas.csv'

# extra��o direta via read.csv
system.time(extracao <- read.csv2(enderecoBase))

# extra��o via amostragem com fun��o fread
system.time(extracaoamostra <- fread(enderecoBase))


## A fun��o fread se mostrou mais eficiente (1.59s em compara��o com 19.72s) ## 


enderecoBase <- 'C:\\Users\\55819\\Documents\\R\\Eletiva analise de dados\\eletiva_analisedados\\bases_tratadas.csv'

# criando o arquivo ff
system.time(extracao1 <- read.csv.ffdf(file=enderecoBase))

class(extracao1)

object.size(extracao1) # a vantagem est� no tamanho!

#media da coluna 1
mean(extracao1[,1])

#mediana da coluna 3
median(extracao1[,3])

#soma da coluna 5
sum(extracao1[,5]) 

#amostragem
extracao1Amostra <- extracao1[sample(nrow(extracao1), 200000) , ]

#regress�o linear da amostra
lm(c ~ ., extracao1Amostra)