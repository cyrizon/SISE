#définir la fonction
produit <- function(b){
  d <- a * b
  a <<- 20
  return(d)
}

#valeur de a
a <- 10

#appel fonction
print(produit(5))

#valeur de a
print(a)
