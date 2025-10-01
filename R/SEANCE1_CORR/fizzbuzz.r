#saisie
print("Nombre n :")
n <- scan()

#vérif. + resaisie éventuelle
while (n <= 1){
  print("Saisie non conforme")
  n <- scan()
}

#affichage
for (i in 1:n) {
  if (i %% 3 == 0 && i %% 5 == 0) {
    print(paste("FizzBuzz --",i))
  } else if (i %% 3 == 0) {
    print(paste("Fizz -- ",i))
  } else if (i %% 5 == 0) {
    print(paste("Buzz -- ",i))
  }
}
