#Fonctions
trapeze <- function(f, a, b, epsilon = 0.001) {
  surface <- 0
  for (x in seq(a, b - epsilon, by = epsilon)) {
    surface <- surface + epsilon * (f(x) + f(x + epsilon)) / 2
  }
  return(surface)
}

simpson <- function(f, a, b, epsilon = 0.001) {
  if ((b - a) %% (2 * epsilon) != 0) {
    b <- a + floor((b - a) / (2 * epsilon)) * 2 * epsilon
  }
  
  surface <- 0
  for (x in seq(a, b - 2 * epsilon, by = 2 * epsilon)) {
    h <- epsilon
    surface <- surface + (h / 3) * (f(x) + 4 * f(x + h) + f(x + 2 * h))
  }
  return(surface)
}

loi_normale <- function(a, b, epsilon = 0.001, surface = trapeze) {
  return(surface(densite_normale, a, b, epsilon))
}

loi_normale_plus <- function(b, epsilon = 0.001, surface = trapeze) {
  return(ifelse(b >= 0,
                0.5 + surface(densite_normale, 0, b, epsilon),
                0.5 - surface(densite_normale, 0, abs(b), epsilon)
  ))
}

loi_khideux <- function(b, ddl, epsilon = 0.001, surface = trapeze) {
  f <- function(x) densite_khi2(x, ddl)
  return(surface(f, 0, b, epsilon))
}

#Appel
print(loi_normale_plus(1.96, epsilon = 0.01, surface = trapeze))
print(loi_normale_plus(1.96, epsilon = 0.01, surface = simpson))

print(pnorm(1.96))

print(loi_khideux(5, ddl = 3, epsilon = 0.01, surface = trapeze))
print(loi_khideux(5, ddl = 3, epsilon = 0.01, surface = simpson))

print(pchisq(5, df = 3)) 