#Fonction
intervalle <- function(x){
  if(!is.numeric(x)){
    return(NA)
  }
  
  return(quantile(x)[4]-quantile(x)[2])
  #return(quantile(x, probs=0.75)-quantile(x,probs=0.25))
}

#Résultat
data(mtcars)
data(iris)

v <- sapply(mtcars,intervalle)
print(v)

v <- sapply(iris,intervalle)
print(v)