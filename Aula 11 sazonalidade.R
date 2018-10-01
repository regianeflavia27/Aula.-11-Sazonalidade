> install.packages("Hmisc")
Installing package into 'C:/Users/Alunos/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/Hmisc_4.1-1.zip'
Content type 'application/zip' length 3012758 bytes (2.9 MB)
downloaded 2.9 MB

package 'Hmisc' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Alunos\AppData\Local\Temp\Rtmpc5eNIl\downloaded_packages
> install.packages("Hmisc")      #Instala Pacote Hmisc
Installing package into 'C:/Users/Alunos/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/Hmisc_4.1-1.zip'
Content type 'application/zip' length 3012758 bytes (2.9 MB)
downloaded 2.9 MB

package 'Hmisc' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Alunos\AppData\Local\Temp\Rtmpc5eNIl\downloaded_packages
> library(Hmisc)
Carregando pacotes exigidos: lattice
Carregando pacotes exigidos: survival
Carregando pacotes exigidos: Formula
Carregando pacotes exigidos: ggplot2
Want to understand how all the pieces fit together? See the R for Data Science book:
  http://r4ds.had.co.nz/
  
  Attaching package: 'Hmisc'

The following objects are masked from 'package:base':
  
  format.pval, units

> library(forecast)
This is forecast 8.4 
Want to meet other forecasters? Join the International Institute of Forecasters:
  http://forecasters.org/
  > library(readxl)
> IPCA.df<-read_excel("c:/EconometriaA/IPCA.xls")
> plot(IPCA.df$IPCA, type = "l")
> acf(IPCA$IPCA)
Error in as.ts(x) : object 'IPCA' not found
> acf(IPCA.df$IPCA)
> pacf(IPCA.df$IPCA)
> MM <- data.frame(na.omit(ma(IPCA.df$IPCA,order = 12, centre = T)))
> a <- (127-nrow(MM))+1
> IPCA.DF <- as.data.frame(IPCA.df$IPCA[a:127])
> Tabela1 <- cbind(IPCA.DF,MM)
> colnames(Tabela1) <- c("IPCA","Média Móvel")
> View(Tabela1)
> Grafico <- ts(Tabela1, start = 2008, frequency = 12)
> plot(Grafico, plot.type= "single", col=c("Black","Blue"))
> MM <- data.frame(na.omit(ma(IPCA.df$IPCA,order = 6, centre = T)))
> a <- (127-nrow(MM))+1
> IPCA.DF <- as.data.frame(IPCA.df$IPCA[a:127])
> Tabela1 <- cbind(IPCA.DF,MM)
> colnames(Tabela1) <- c("IPCA","Média Móvel")
> View(Tabela1)
> Grafico <- ts(Tabela1, start = 2008, frequency = 12)
> plot(Grafico, plot.type= "single", col=c("Black","Blue"))
> z <- lm(IPCA.df$IPCA~IPCA.df$Ano.Mês)
> abline(z, col="Green")
> summary(z)

Call:
  lm(formula = IPCA.df$IPCA ~ IPCA.df$Ano.Mês)

Residuals:
  Min       1Q   Median       3Q      Max 
-0.82458 -0.22349 -0.08363  0.20146  1.19230 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)
(Intercept)      7.388e-01  4.464e-01   1.655    0.100
IPCA.df$Ano.Mês -2.180e-10  3.262e-10  -0.668    0.505

Residual standard error: 0.3545 on 125 degrees of freedom
Multiple R-squared:  0.00356,	Adjusted R-squared:  -0.004412 
F-statistic: 0.4466 on 1 and 125 DF,  p-value: 0.5052

> tabela2 <- as.data.frame(Tabela1$IPCA/Tabela1$`Média Móvel`)
> plot(tabela2)
> Inflacao <- ts(IPCA.df$IPCA, start = 2008, frequency = 12)
> decomposicao <- decompose(Inflacao)
> plot(decompose(Inflacao))
> Tendencia <- decomposicao$trend
> Sazonalidade <- decomposicao$seasonal
> Ciclo <- decomposicao$random
> Tab_Dados1 <- data.frame(IPCA.df$IPCA, Ciclo)
> View(Tab_Dados1)
> plot(Sazonalidade, type="l")
> Serie_Tempo1 <- ts(Tab_Dados1, start = 2008, frequency = 12)
> plot(Serie_Tempo1, plot.type = "single", col= c("Blue", "Red"))
> Tab_Dados2 <- data.frame(IPCA.df$IPCA, Tendencia)
> Serie_Tempo2 <- ts(Tab_Dados2, start = 2008, frequency = 12)
> plot(Serie_Tempo2, plot.type = "single", col= c("Blue", "Red"))
> 