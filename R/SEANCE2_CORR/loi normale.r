#fonction de densité de la loi normale
densite <- function(x){
  return (1.0/sqrt(2.0*pi)*exp(-x^2/2.0))
}

#intégration méthode des trapezes
loi_normale <- function(a,b,epsilon=0.001){
  total <- 0.0
  while (a + epsilon <= b){
    total <- total + epsilon*(densite(a)+densite(a+epsilon))/2.0
    a <- a + epsilon
  }
  #dernier trapèze (moins large que epsilon)
  if (b > a){
	total <- total + (b-a) * (densite(a)+densite(b))/2.0
	}
  #return
  return(total)
}

#fonction de répartition
loi_normale_plus <- function(b,epsilon=0.001){
 if (b > 0){
  surface <- loi_normale(0,b,epsilon)
  return(0.5 + surface)
 } else
 {
  surface <- loi_normale(b,0,epsilon)
  return(0.5 - surface)
 }
}

#appel et comparaison avec pnorm
print(loi_normale_plus(1.96))
print(pnorm(1.96))

print(loi_normale_plus(1.65))
print(pnorm(1.65))

print(loi_normale_plus(-1.96))
print(pnorm(-1.96))