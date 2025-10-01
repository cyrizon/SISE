#seuils pour le test des bâtons brisés
batons_brises <- function(p){
  #pour chaque facteur
  for (k in 1:p){
    b <- 0
    for (m in k:p){
      b <- b + 1/m
    }
    print(paste(k,b,sep=' -- '))
  }
}

#un test
print(batons_brises(p=6))