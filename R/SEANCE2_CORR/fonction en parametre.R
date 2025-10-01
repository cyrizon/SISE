#vider la mémoire
rm(list=ls())

#fonction surface entre deux bornes (a,b) - méthode des trapèzes
#la fonction de densité est en paramètre + autres param. éventuels
trapeze <- function(densite,a,b,epsilon=0.001,...){
  total <- 0.0
  while (a + epsilon <= b){
    total <- total + epsilon*(densite(a,...)+densite(a+epsilon,...))/2.0
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

#répartition normale entre 2 bornes
loi_normale <- function(a,b,epsilon=0.001){
  total <- trapeze(dnormale,a,b,epsilon)
  return(total)
}

#loi de répartition normale
loi_normale_plus <- function(b,epsilon=0.001){
  if (b > 0){
    surface <- loi_normale(0,b)
    return(0.5 + surface)
  } else
  {
    surface <- loi_normale(b,-b)
    return((1.0-surface)/2.0)
  }
}

#loi du khi-2 - fonction de répartition
loi_khi2 <- function(b,ddl,epsilon=0.001){
  total <- trapeze(dkhi2,0,b,epsilon,ddl)
  return(total)
}

#test
print(loi_normale_plus(1.96))

#vérification
print(pnorm(1.96))

#test
print(loi_khi2(3.84,5))

#vérification
print(pchisq(3.84,5))
