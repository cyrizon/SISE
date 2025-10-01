#Fonction
loi_normale_plus <- function(b,epsilon=0.001){
  return(ifelse(b >= 0,
         0.5 + loi_normale(0,b),
         0.5 - loi_normale(0,abs(b))
  ))
}

#Appel
print(loi_normale_plus(1.96))
print(pnorm(1.96))