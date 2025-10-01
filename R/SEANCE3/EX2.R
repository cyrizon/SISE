#Fonction
test_student <- function(v1,v2){
  if(!is.factor(v2) || nlevels(v2) != 2){
    stop(NULL)
  }
  
  h <- v1[v2 == "h"]
  f <- v1[v2 == "f"]
  
  return(comp_moyenne(h,f))
}

#Resultats
x <- c(185,159,170,168,190,167,160,179,176,155)
y <- as.factor(c("h","f","f","h","f","f","f","h","h","f"))

print(test_student(x,y))