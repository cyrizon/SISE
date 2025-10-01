#Variables
print("Entrez n (entier)")
n <- scan()
min <- 1
max <- n-1

sum <- 0

#Traitement des données
for (i in min:max){
  if(n %% i == 0){
    sum <- sum + i
  }
}

#Resultat
print(ifelse(sum==n, "Nombre parfait", "Pas un nombre parfait"))