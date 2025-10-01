#lettres de l'alphabet
lettres <- "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

#mot à traiter
mot <- "ZAZA"

#décalage - forcément inférieur à 26
decalage <- 3

#texte crypté
crypted <- ""

#traiter
for (i in 1:nchar(mot)){
  #lettre à traiter
  lm <- substr(mot,i,i)
  #position dans l'alphabet
  pos <- regexpr(lm,lettres)
  #nouvelle position après décalage
  new.pos <- pos + decalage
  #correction si supérieur à 26
  new.pos <- ifelse(new.pos > 26, new.pos - 26, new.pos)
  #nouvelle lettre
  new.lm <- substr(lettres,new.pos,new.pos)
  #constituer le nouveau mot
  crypted <- paste(crypted,new.lm,sep="")
}

#affichage
print(crypted)

