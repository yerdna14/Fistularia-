#hola javi

#hola Aleja
#a graficar se ha dicho
library (lattice)
library(ggplot2)
aleja <- read.csv("Matriz corregida.csv")

str(aleja)
aleja$Intensidad <- as.factor(aleja$Intensidad)
aleja$Coloracion <- as.factor(aleja$Coloracion)
aleja$Actividad <- factor(aleja$Actividad,levels = c("Busqueda", "Alerta",  "Ataque"))

ggplot(data = aleja, mapping = aes(x = Actividad, fill = Intensidad)) +
  geom_bar(alpha = .45, position = "fill") +
   labs(y = "Proporción") + scale_fill_manual(values=c("grey78","grey53","dodgerblue4")) + theme_classic()#Muy bacano

ggplot(data = aleja, mapping = aes(x = Ubicacion, fill = Coloracion)) +
  geom_bar(alpha = .45, position = "fill", width = 0.7) +
  labs(y = "Proporción", fill = "Patron de Bandas") + scale_fill_manual(values = c("grey78","dodgerblue4")) + theme_classic() #Muy bacano

ggplot(data = aleja, mapping = aes(x = Actividad, fill = Coloracion)) +
  geom_bar(alpha = .45, position = "fill") +
  labs(y = "Proporción", fill = "Patron de Bandas") + scale_fill_manual(values = c("grey78","dodgerblue4"))+ theme_classic() #Muy bacano

#Graficas con barras separadas 
ggplot(data = aleja, mapping = aes(x = Actividad, fill = Intensidad)) +
  geom_bar(alpha = .45, position = "dodge") +
  labs(y = "Proporción") + scale_fill_manual(values=c("grey78","grey53","dodgerblue4")) + theme_classic() #Muy bacano

ggplot(data = aleja, mapping = aes(x = Ubicacion, fill = Coloracion)) +
  geom_bar(alpha = .45, position = "dodge", width = 0.7) +
  labs(y = "Proporción", fill = "Patron de Bandas") + scale_fill_manual(values = c("grey78","dodgerblue4")) + theme_classic() #Muy bacano

ggplot(data = aleja, mapping = aes(x = Actividad, fill = Coloracion)) +
  geom_bar(alpha = .45, position = "dodge") +
  labs(y = "Proporción", fill = "Patron de Bandas") + scale_fill_manual(values = c("grey78","dodgerblue4")) + theme_classic() #Muy bacano
