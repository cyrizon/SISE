library(readxl)
#Fonctions

#Résultats

#1
system.time({
  large <- read_excel(path = "data/large.xlsx")
})

#2
system.time({
  numeric_cols <- large[, sapply(large, is.numeric)]
  
  impaire_cols <- numeric_cols[, sapply(numeric_cols, function(col) any(col %% 2 != 0, na.rm = TRUE))]
  
  mean_col <- sapply(impaire_cols, mean, na.rm = TRUE)
})
print(mean_col)

#3
