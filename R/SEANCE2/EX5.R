#Function
loi_normale <- function(a,b,epsilon=0.001){
  f <- function(x) {
    (1 / sqrt(2 * pi)) * exp(-(x^2) / 2)
  }
  
  surface <- 0
  
  for (x in seq(a, b - epsilon, by = epsilon)) {
    surface <- surface + epsilon * (f(x) + f(x + epsilon)) / 2
  }
  
  return(surface)
}

#Appel
print(loi_normale(-1.96,1.96))
print(pnorm(1.96)-pnorm(-1.96))