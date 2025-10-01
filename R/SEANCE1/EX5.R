#Variable
i = 0
print("Entrez n (entier)")
n <- scan()

#Traitement des données
if(n > 0){
  while (i <= n){
    print(i)
    i <- i + 1
  }
} else {
  print ("n < 0")
}