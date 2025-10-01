#Fonction
residus.ajustes <- function(m){
  
  row_totals <- rowSums(m)
  col_totals <- colSums(m)
  n <- sum(m)
  
  attendus <- outer(row_totals, col_totals) / n
  attendus <- attendus

  r.adj <- (m - attendus) / 
    (sqrt(attendus * (1 - row_totals / n) * (1 - col_totals / n)))
  
  return(r.adj)
}

#Resultats
m <- matrix(c(33,94,21,63,452,115,4,13,5,8,154,38), nrow=3,ncol=4)
print(m)

print(residus.ajustes(m))