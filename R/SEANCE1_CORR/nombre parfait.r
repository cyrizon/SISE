#récupération de la valeur de n
#n, nombre parfait ?
n <- scan()

#somme des diviseurs
somme <- 0

#tester les valeurs allant de 1 à n-1
for (i in 1:(n-1)){
  if(n%%i == 0){
    somme <- somme + i
  }
}

#arrive l'heure des comptes
if (somme == n){
  print(paste(as.character(n)," est parfait"))
} else
{
  print(paste(as.character(n)," n'est pas parfait"))
}