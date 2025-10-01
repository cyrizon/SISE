#Fonction
test.khi2 <- function(y,x){
  if(length(y) != length(x) || !is.factor(y) || !is.factor(x)){
    return(NULL)
  }
  
  effectifs <- table(x,y)
  
  row_totals <- rowSums(effectifs)
  col_totals <- colSums(effectifs)
  n <- sum(effectifs)
  
  attendus <- outer(row_totals, col_totals) / n
  
  chi2_stat <- sum((effectifs - attendus)^2 / attendus)
  
  ddl <- (nrow(effectifs) - 1) * (ncol(effectifs) - 1)
  
  p_value <- 1 - pchisq(chi2_stat, df = ddl)
  
  return(list(chi2 = chi2_stat,
              ddl = ddl,
              pvalue = p_value)
         )
}

#Resultats
x <- c(1,2,2,3,2,2,1,1,2,2,1,1,1,1,2)
x <- factor(x)
y <- c(1,2,1,2,1,2,1,1,2,1,2,1,1,2,2)
y <- factor(y)

print(test.khi2(x,y))
print(chisq.test(x,y))