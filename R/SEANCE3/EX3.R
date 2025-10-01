#Fonction
comp_moyenne_pairwise <- function(v1,v2){
  if (length(v1) != length(v2)) {
    return(NULL)
  }
  
  test <- t.test(v1, v2, paired = TRUE)
  
  return(list(
    t = test$statistic,
    ddl = test$parameter,
    p_value = test$p.value
  ))
}

#Resultats
v1 <- c(1.2,3.4,5.6,7.8,1.3)
v2 <- c(3.6,1.7,5.6,9.0,1.5)

z <- comp_moyenne_pairwise(v1,v2)
print(z)