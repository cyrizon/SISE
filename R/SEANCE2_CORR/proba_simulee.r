#1 - fonction de répartition loi normale
#par simulation
proba <- function(n, seuil){
  #comptage
  compte <- 0
  for (i in 1:n){
    v <- rnorm(1)
    if (v > seuil){
      compte <- compte + 1
    }
  }
  #proportion
  return(compte/n)
}