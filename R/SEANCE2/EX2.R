#Fonction
intervals <- function(a,b,k=3){
  if(a > b || k == 0){
    return(NA)
  }
  
  return((b-a)/k)
}

#Appel
print(intervals(7,5))
print(intervals(5,7,0))
print(intervals(7,5,1))
print(intervals(5,7,2))