#Fonctions
fibonacci_rec <- function(n){
  if(!is.numeric(n) || n < 0 || n != floor(n)) {
    stop("Message d'erreur")
  }
  
  if(n == 0){
    return(0)
  } else if(n == 1){
    return(1)
  }
  
  return(fibonacci(n-1) + fibonacci(n-2))
}

fibonacci_iter <- function(n) {
  if (!is.numeric(n) || n < 0 || n != floor(n)) {
    stop("Message d'erreur")
  }
  
  if (n == 0) {
    return(0)
  } else if (n == 1) { 
    return(1)
  }
  
  a <- 0
  b <- 1
  for (i in 2:n) {
    temp <- a + b
    a <- b
    b <- temp
  }
  return(b)
}

fibonacci <- function(n){
  return(ifelse(n > 15, fibonacci_iter(n), fibonacci_rec(n)))
}

#Appel
for(i in 0:50){
  print(paste(i, fibonacci(i), sep = " : "))
}

print(fibonacci(-2))
print(fibonacci(1.1))
print(fibonacci("test"))