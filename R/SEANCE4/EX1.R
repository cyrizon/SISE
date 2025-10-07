library(xlsx)

voitures <- read.xlsx(file="./data/cars.xlsx",header=T,sheetIndex=1)

nrow(voitures)
ncol(voitures)

print(summary(voitures))

print(voitures[voitures$Marque=="Pontiac", c("Marque","Modele","Type","Prix","Km")])

print(voitures[voitures$Marque=="Pontiac" & voitures$Type == "Sedan", c("Marque","Modele","Type","Prix","Km")])

print(voitures[voitures$Marque=="Pontiac" & voitures$Prix > 20000 & voitures$Prix < 25000, c("Marque","Modele","Type","Prix","Km")])

print(table(voitures$Type))

print(table(voitures$Type[voitures$Marque=="Pontiac" | voitures$Marque=="Chevrolet"]))

print(head(voitures[order(voitures$Prix),], n=5))

voituresSedan <- voitures[voitures$Type == "Sedan",]
print(head(voituresSedan[order(voituresSedan$Prix), ], n=5))

nrow(voitures[voitures$Cuir=="oui" & voitures$HiFi=="oui",])

print(table(voitures$HiFi,voitures$Cuir))
print(prop.table(table(voitures$HiFi,voitures$Cuir),1)["oui","oui"])

print(tapply(voitures$Prix,voitures$Type,mean))

print(sort(tapply(voitures$Prix,voitures$Type,mean),decreasing=T))

print(tapply(voitures$Prix, INDEX = list(voitures$Cuir,voitures$HiFi), mean))
