#vider la mémoire
rm(list=ls())

#fonction surface entre deux bornes (a,b)
#méthode des trapèzes
#la fonction de densité est en paramètre
trapeze <- function(densite,a,b,epsilon=0.001,...){
  total <- 0.0
  while (a + epsilon <= b){
    total <- total + epsilon*(densite(a,...)+densite(a+epsilon,...))/2.0
    a <- a + epsilon
  }
  return(total)  
}

#fonction surface entre deux bornes (a,b)
#méthode de Simpson
#la fonction de densité est en paramètre
simpson <- function(densite,a,b,epsilon=0.001,...){
  total <- 0.0
  while (a + epsilon <= b){
    valeur <- (epsilon/6.0)*(densite(a,...)+4.0*densite(0.5*(a+(a+epsilon)),...)+densite(a+epsilon,...))
    total <- total + valeur
    a <- a + epsilon
  }
  return(total)  
}

#densité de la loi normale
dnormale <- function(x){
  return (1.0/sqrt(2.0*pi)*exp(-x^2/2.0))
}

#densité de la loi du khi-2
dkhi2 <- function(x,ddl){
  v <- 1.0/((2^(ddl/2)) * gamma(ddl/2))
  v <- v * x^(ddl/2-1) * exp(-x/2)
  return(v)
}

#intégration méthode <<surface = trapeze ou simpson>>
loi_normale <- function(a,b,epsilon=0.001,surface=trapeze){
  total <- surface(dnormale,a,b,epsilon)
  return(total)
}

#loi de répartition
loi_normale_plus <- function(b,epsilon=0.001,surface=trapeze){
  if (b > 0){
    surface <- loi_normale(0,b)
    return(0.5 + surface)
  } else
  {
    surface <- loi_normale(b,-b)
    return((1.0-surface)/2.0)
  }
}

#loi du khi-2
loi_khi2 <- function(b,ddl,epsilon=0.001,surface=trapeze){
  total <- surface(dkhi2,0,b,epsilon,ddl)
}

#test avec trapèze
print(loi_normale_plus(1.96))

#test avec Simpson
print(loi_normale_plus(1.96,surface=simpson))

#vérification
print(pnorm(1.96))

#test trapèze
print(loi_khi2(3.84,5,epsilon=0.25))

#test simpson
print(loi_khi2(3.84,5,epsilon=0.25,surface=simpson))

#vérification
print(pchisq(3.84,5))
