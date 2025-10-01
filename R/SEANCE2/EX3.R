#Fonctions
simulation <- function(){
  depart <- 100000
  
  for (i in 1:3){
    alea <- runif(1)
    if(alea <= 0.2){
      depart <- depart + 10000
    } else if(alea > 0.7){
      depart <- depart - 5000
    }
  }

  return(depart)
}

allsimulation <- function(n = 1000){
  a <- 0
  for(i in 1:n){
    a <- a + simulation()
  }
  return(a/n)
}

#Appel
print(allsimulation())