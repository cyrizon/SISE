#Fonction
PGCD <- function(a,b){
  
  while(a!=b){
    
    if(a<b){
      b <- b-a
    } else {
      a <- a-b
    }
  }
  
  return(a)
}

#Appel
print(PGCD(15,5))