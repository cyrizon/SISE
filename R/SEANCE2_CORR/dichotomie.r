#fonctions à traiter
FONCTION_ID <- function(x){
  return(x)
}

#autre fonction à analyser
FONCTION_CARRE <- function(x){
  return(x^2-1)
}

#dichotomie
dichotomie <- function(FONCTION,a,b,epsilon=0.0001){
  #vérification
  if ((a > b) || (FONCTION(a) * FONCTION(b) > 0)){
    return(NA)
  }
  #calculs
  while ((b - a) > epsilon){
    m <- (a+b)/2
    if (FONCTION(a)*FONCTION(m) <= 0){
      b <- m
    } else
    {
      a <- m
    }
  }
 #
return(m)
}

#exemle d'appel
print(dichotomie(FONCTION_ID,-10,10))
print(dichotomie(FONCTION_CARRE,0,5))
