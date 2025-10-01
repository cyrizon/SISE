#Fonction
freqmax <- function(v){
  if (!is.factor(v)) {
    return(NULL)
  }
  
  freq_table <- table(v)
  
  idx_max <- which.max(freq_table)
  
  mode_label <- names(freq_table)[idx_max]
  freq_abs <- freq_table[idx_max]
  
  return(list(modalite = mode_label, frequence = as.integer(freq_abs)))
}

#Resultats
v <- c(1,2,1,1,1,2,1)
sexe <- factor(v)
levels(sexe) <- c("homme","femme")
print(sexe)

print(freqmax(sexe))