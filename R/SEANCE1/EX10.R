#Variables
print("Entrez n (entier)")
n <- scan()
min <- 2
max <- n-1

min_div <- Inf
max_div <- -Inf

#Traitement des données
for (i in min:max){
  if(n %% i == 0){
    if(i < min_div){
      min_div <- i
    }
    if(i > max_div){
      max_div <- i
    }
  }
}

#Resultat
if(min_div != Inf && max_div != Inf){
  print(paste(n, "pas premier", sep=" "))
  print(paste("PPD", min_div, sep=" "))
  print(paste("PGD", max_div, sep=" "))
} else {
  print(paste(n, "premier", sep=" "))
}