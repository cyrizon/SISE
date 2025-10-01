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

#fonction d'appel de la simulation
allsimulation <- function(n = 1000){
  somme <- 0
  for (i in 1:n){
    somme <- somme + simulation()
  }
  #moyenne
  moyenne <- somme/n
  #renvoyer
  return(moyenne)
}
#affichage
print(allsimulation(n = 1000))