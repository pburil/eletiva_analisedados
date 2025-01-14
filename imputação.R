library(data.table)
library(poliscidata)


banco <- world


## imputa��o num�rica
# prepara��o da base, colocando NA aleat�rios
bancoDT <- banco %>% setDT() #copiar base world, usando a data.table

(bancoDTNAseed <- round(runif(10, 1, 50))) # criamos 10 valores aleat�rios

(bancoDT$debt[bancoDTNAseed] <- NA) # imputamos NA nos valores aleat�rios

# tend�ncia central
library(Hmisc) # biblio que facilita imputa��o de tend�ncia central
bancoDT$debt <- impute(bancoDT$debt, fun = mean) # m�dia
bancoDT$debt <- impute(bancoDT$debt, fun = median) # mediana

is.imputed(bancoDT$debt) # teste se o valor foi imputado
table(is.imputed(bancoDT$debt)) # tabela de imputa��o por sim / n�o

# predi��o
bancoDT$debt[bancoDTNAseed] <- NA # recolocamos os NA
bancoNAIndex <- is.na(bancoDT$debt) # localizamos os NA

## Hot deck
# imputa��o aleat�ria
bancoDT$debt[bancoDTNAseed] <- NA # recolocamos os NA

(bancoDT$debt <- impute(bancoDT$debt, "random")) # fazemos a imputa��o aleat�ria

# imputa��o por inst�ncias
bancoDT$debt[bancoDTNAseed] <- NA # recolocamos os NA

install.packages("VIM")
library(VIM)
bancoDT2 <- kNN(bancoDT)
