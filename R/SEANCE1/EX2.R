#Variable
TVA <- 1.20
pttc <- 0

#Saisie de données
print("Saisir pht :")
pht <- scan()
print("Saisir code :")
code <- scan()

#Traitement
pttc <- pht * ifelse(code == 1.20, 0.33, TVA)

#Retour
print(pttc)