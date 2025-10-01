#saisies
print("saisie pht ")
pht <- scan()

print("code ")
code <- scan()

#calcul
pttc <- ifelse(code==1, 1.33 * pht, 1.2 * pht)

#affichage
print("print pttc = ")
print(pttc)
