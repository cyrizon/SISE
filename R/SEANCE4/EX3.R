#Fonctions
#Application lapply
cr.data.frame <- function(df){
  if(!is.data.frame(df)){
    return(NULL)
  }
  
  sortie.list <- lapply(df, cr.vector)
  
  
  sortie.df <- as.data.frame(sortie.list)
  return(sortie.df)
}

#CR d'un vecteur
cr.vector <- function(v){
  if(!is.numeric(v)){
    return(v)
  }
  
  et <- sd(v)
  return(
    ifelse(
      et>0,
      (v-mean(v))/et,
      (rep(0,times=length(v)))
      )
    )
}

#Résultats
autos <- read.table(file="data/autos.txt",
                    dec = ".",
                    sep = "\t",
                    header=T)
print(class(autos))
print(summary(autos))

print(cr.data.frame(autos))