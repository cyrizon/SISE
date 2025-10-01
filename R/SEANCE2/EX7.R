#Fonctions
integrale_trapeze <- function(f,a,b,epsilon=0.001){
  surface <- 0
  
  for (x in seq(a, b - epsilon, by = epsilon)) {
    surface <- surface + epsilon * (f(x) + f(x + epsilon)) / 2
  }
  
  return(surface)
}

densite_normale <- function(x){
  (1 / sqrt(2 * pi)) * exp(-(x^2) / 2)
}

loi_normale_plus <- function(b,epsilon=0.001){
  return(ifelse(b >= 0,
                0.5 + integrale_trapeze(densite_normale, 0, b, epsilon),
                0.5 - integrale_trapeze(densite_normale, 0, abs(b), epsilon)
  ))
}

densite_khi2 <- function(x, ddl) {
  if (x <= 0) return(0)
  coef <- 1 / (2^(ddl / 2) * gamma(ddl / 2))
  return(coef * x^((ddl / 2) - 1) * exp(-x / 2))
}

loi_khideux <- function(b,ddl,epsilon=0.001){
  f <- function(x) densite_khi2(x, ddl)
  return(integrale_trapeze(f, 0, b, epsilon))
}

#Appel
print(loi_khideux(5, ddl = 3))
print(pchisq(5, df = 3))