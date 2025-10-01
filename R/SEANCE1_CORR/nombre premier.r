#récupération de la valeur de n
n <- scan()

#un témoin pour savoir si on a trouvé un diviseur
diviseur <- FALSE

#tester les valeurs allant de 2 à n-1 (croissant)
if (n > 3){
	for (i in 2:(n-1)){
	  if(n%%i == 0){
	   diviseur <- TRUE
	   break
	  }
	}
}

#arrive l'heure des comptes
if (diviseur == TRUE){
  print(paste(as.character(n)," n'est pas premier"))
} else
{
  print(paste(as.character(n)," est premier"))
}