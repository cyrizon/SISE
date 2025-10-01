#mot à traiter
mot <- "totobango"

#voyelles
voyelles <- "aeiouy"

#pour chaque lettre dans voyelles
for (k in 1:nchar(voyelles)){
  
  #lettre à rechercher
  lettre <- substr(voyelles,k,k)
  
  #compteur
  compteur <- 0
  
  #recherche
  for (i in 1:nchar(mot)){
    if (lettre == substr(mot,i,i)){
      compteur <- compteur + 1
    }
  }
  
  #affichage
  print(paste(lettre,"=",as.character(compteur)))  
  
}

