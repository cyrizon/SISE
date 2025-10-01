#Fonction
dichotomie <- function(FONCTION, a, b, epsilon=0.0001){
  if(!(b > a && sign(FONCTION(a)) != sign(FONCTION(b)))){
    stop(NA)
  }
  
  while(b - a > epsilon){
    m <- (a + b) / 2
    if(FONCTION(a)*FONCTION(m) <= 0){
      b <- m
    } else {
      a <- m
    }
  }
  
  return(m)
}

FONCTION_ID <- function(x){
  return(x)
}

FONCTION_CARRE <- function(x){
  return(x^2-1)
}

#Appel
print(dichotomie(FONCTION_ID,-10,10))
print(dichotomie(FONCTION_CARRE,0,5))