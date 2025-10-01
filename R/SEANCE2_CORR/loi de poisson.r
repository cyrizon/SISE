#définir la fonction
fpoisson <- function(x,lambda){
 #tester la validité des paramètres
 if (x < 0 || lambda <= 0){
  return (NA)
 }
 #c'est OK, on peut calculer la somme...
 #cette partie ne va jamais changer
 e <- exp(-lambda)
 #faire la somme
 somme <- 0
 for (i in 0:x){
  somme <- somme + lambda^i / factorial(i)
 }
 #renvoyer le résultat
 return (e * somme)
}

#appel de la fonction
fpoisson(6,11.3)
#comparaison avec la fonction native de R
ppois(6,11.3)
