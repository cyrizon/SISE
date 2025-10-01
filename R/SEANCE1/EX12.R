#Variables
nb <- 1
n <- Inf
rdm <- trunc(runif(n=1, min = 0, max = 100))
print(rdm)

#Traitement des données
while (n != rdm){
  print("Entrez un nombre pour trouver le nombre mystère")
  n <- scan()
  
  if(n == rdm){
    return()
  } else if(n>rdm){
    print("Plus petit")
  } else if(n<rdm){
    print("Plus grand")
  }
  
  nb <- nb +1
}

#Resultat
print(paste(nb, "essais", sep=" "))