#Fonctions
traiter.colonne <- function(v){
  y <- na.omit(v)
  
  if(length(y) == length(v)){
    return(v)
  } else {
    if(!is.numeric(v)){
      dist.freq <- table(y)
      id.mode <- which.max(dist.freq)
      z <- v
      z[is.na(z)] <- names(dist.freq)[id.mode]
      return(z)
    } else {
      moyenne <- mean(y)
      z <- v
      z[is.na(z)] <- moyenne
      return(z)
    }
  }
}

traitement <- function(df){
  return(as.data.frame(lapply(df,traiter.colonne)))
}

#Résultat
autos <- read.table(file="data/autos_md.txt",
                    dec = ".",
                    sep = "\t",
                    header=T,
                    row.names = 1,
                    na.strings = "?")

print(traitement(autos))