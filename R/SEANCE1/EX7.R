#Variables
n <- 0
while (n < 1){
  print("Entrez n (entier) > 1")
  n <- scan()
}
n1 <- n - 1

#Traitement des données
for (i in 1:n1){
  if (i %% 3 == 0 && i %% 5 == 0){
    print(paste("FizzBuzz", i, sep="|"))
  } else if (i %% 3 == 0){
    print(paste("Fizz", i, sep="|"))
  } else if (i %% 5 == 0) {
    print(paste("Buzz", i, sep="|"))
  }
}

