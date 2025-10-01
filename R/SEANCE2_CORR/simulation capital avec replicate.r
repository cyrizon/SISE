#************************
#utilisation de replicate
#************************

#définition de la fonction de simulation
simulation <- function(){
  depart <- 100000
  #les 3 années cumulées
  for (i in 1:3){
    r <- runif(1)
    depart <- ifelse(r<=0.2,depart+10000,ifelse(r<=0.7,depart,depart-5000))
  }
  #retour
  return (depart)
}

#répeter 1000 fois la simulation
v <- replicate(1000,simulation())
#vérifier qu'il y a bien 1000 valeurs
length(v)
#calculer et afficher la moyenne
m <- mean(v)
print(m) #moyenne des simulations
