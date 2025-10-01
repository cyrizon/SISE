#fonction pour appel récursif
recursion <- function(current,source){
  #si un seul élément dans source
  if (nchar(source)==1){
    #former la chaîne
    current <- paste(current,source,sep="")
    print(paste("OK",current,sep=" : "))
  } else
  {
    #former la chaîne suivante à partir de chaque carac. de source
    for (i in 1:nchar(source)){
      #rajouter le caractère à current
      currentbis <- paste(current,substr(source,i,i),sep="")
      #source suivante -- retirer le caractère de source
      sourcebis <- paste(substr(source,1,i-1),substr(source,i+1,nchar(source)),sep="")
      #appel récursif avec la chaîne restante
      recursion(currentbis,sourcebis)  
    }
  }
  
}


#fonction pour combinaison
combinatoire <- function(chaine){
  #appel de la fonction
  recursion("",chaine)
}

#test
combinatoire("ABC")
