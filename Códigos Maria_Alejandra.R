datos

library(lme4)
mod1<-glmer(Coloracion ~ Actividad + (1|Individuo), family=binomial, data=datos)
summary(mod1)

library(car)
Anova(mod1)

#No es necesaria la prueba de comparación múltiple debido a que
#no hay un efecto significativo de la Actividad sobre la Coloración

#Por otro lado, cuando se detecte un efecto significativo en el Anova es
#recomendable utilizar la corrección por Bonferroni
library(emmeans)
Comp1<-lsmeans(mod1, ~Actividad)
pairs(Comp1, adj="bon")


mod2<-glmer(Coloracion ~ Talla + (1|Individuo), family=binomial, data=datos)
summary(mod2)

Anova(mod2)
#No hay efecto de la Talla


mod3<-glmer(Coloracion ~ Ubicacion + (1|Individuo), family=binomial, data=datos)
summary(mod3)

Anova(mod3)
#Hay un efecto de la ubicación son diferentes Planicie y Talud
#Esto tambien se refleja en la prueba de comapración múltiple con
#corrección por Bonferroni.

Comp1<-lsmeans(mod3, ~Ubicacion)
pairs(Comp1, adj="bon")

#Modelo aditivo completo
mod4<-glmer(Coloracion ~ Actividad+Ubicacion+Movimientos+Asociacion + (1|Individuo), family=binomial, data=datos)
summary(mod4)

Anova(mod4)
#No hay efecto de la Actividad, Ubicación, Movimientos y Asociacion

#Se debe formular de nuevo un modelo excluyendo la variable menos significativa
#Según el Anova esa variable es Asociación debido a que tiene el mayor valor-p

mod4.2<-glmer(Coloracion ~ Actividad+Ubicacion+Movimientos + (1|Individuo), family=binomial, data=datos)
summary(mod4.2)

Anova(mod4.2)

#Comparación de los dos modelos anteriores según los criterios de información
#AIC, BIC y prueba de razón de verosimilitudes
anova(mod4, mod4.2)
#No hay diferencia entre los dos modelos (valor-p relativamente grande)
#Indica que la variable Asociacion se puede excluir del modelo


#Se debe formular de nuevo un modelo excluyendo de las tres variables restantes
#la menos significativa
#Según el Anova del modelo 4.2 esa variable es Movimientos

mod4.3<-glmer(Coloracion ~ Actividad+Ubicacion + (1|Individuo), family=binomial, data=datos)
summary(mod4.3)

Anova(mod4.3)

#Comparación de los dos modelos
anova(mod4.2, mod4.3)
#No hay diferencia entre los dos modelos (valor-p relativamente grande)
#Indica que la variable Movimientos se puede excluir del modelo


#Se debe formular de nuevo un modelo excluyendo de las dos variables restantes
#la menos significativa
#Según el Anova del modelo 4.3 esa variable es Actividad

mod4.4<-glmer(Coloracion ~ Ubicacion + (1|Individuo), family=binomial, data=datos)
summary(mod4.4)

Anova(mod4.4)

#Comparación de los dos modelos
anova(mod4.3, mod4.4)
#No hay diferencia entre los dos modelos (valor-p relativamente grande)
#Indica que la variable Actividad se puede excluir del modelo

#Según los modelos ajustados, la única variable que tiene un efecto
#significativo es la Ubicación.
