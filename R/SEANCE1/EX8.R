#Variables
s <- 0
print("Entrez n (entier) > 1")
n <- scan()

print("Entrez p (entier) > 1")
p <- scan()


#Traitement des données
if(p > n){
  print("Pas de calcul possible")
  return()
}

for (i in 1:n){
  if(i %% p == 0){
    s <- s + i
  }
}

#Resultats
print(s)