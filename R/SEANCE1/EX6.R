#Variable
print("Entrez n (entier)")
n <- scan()
n1 <- n-1

#Traitement des données
for (i in 1:n1){
  n <- i * n
}

#Retour
print(n)