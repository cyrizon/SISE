#générer le nombre mystère
mystere <- trunc(runif(1)*100)+1

#tag booléen pour recherche
trouve <- FALSE

#compteur d'essais
compteur <- 0

#recherche
while (trouve == FALSE){
  #saisir la valeur
  print("Saisie valeur")
  valeur <- scan()
  compteur <- compteur + 1
  #tester
  if (valeur == mystere){
    trouve <- TRUE
  } else
  {
    if (valeur > mystere)
    print("le nombre mystère est plus petit")
    else
    print("le nombre mystère est plus grand")
  }
}

#affichage
print("BRAVO, nombre d'essais = ")
print(compteur)