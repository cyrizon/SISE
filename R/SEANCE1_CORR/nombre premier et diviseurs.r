#récupération de la valeur de n
n <- scan()
#un témoin pour savoir si on a trouvé un diviseur
diviseur <- FALSE
#les diviseurs à trouver
min.div <- -1
#tester les valeurs allant de 2 à n-1
for (i in 2:(n-1)){
  if(n%%i == 0){
   diviseur <- TRUE
   #une seule modification qui n'est plus jamais remise en cause
   if (min.div == -1){
     min.div <- i
   }
   max.div <- i #pas de break pour aller jusqu'au dernier diviseur <==> max
  }
}
#arrive l'heure des comptes
if (diviseur == TRUE){
  print(paste(as.character(n)," n'est pas premier"))
  print(paste(as.character(min.div)," est le plus petit diviseur"))
  print(paste(as.character(max.div)," est le plus grand diviseur"))
} else
{
  print(paste(as.character(n)," est premier"))
}