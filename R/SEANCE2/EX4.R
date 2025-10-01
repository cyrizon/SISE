#Fonction
fpoisson <- function(x,lambda){
  result <- 0
  for(i in 0:x){
    result <- result + ((exp(1)**(-lambda)) * ((lambda**i)/factorial(i)))
  }
  return(result)
}

#Appel
print(fpoisson(10,20))
print(ppois(10,20))