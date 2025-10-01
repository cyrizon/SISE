#mot ? traiter
mot <- scan(what=character())

#lettre ? compter
lettre <- scan(what=character())

#compteur
compteur <- 0

#recherche
for (i in 1:nchar(mot)){
  if (lettre == substr(mot,i,i)){
    compteur <- compteur + 1
  }
}

#affichage
print(compteur)