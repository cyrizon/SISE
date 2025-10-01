#Variables
print("Entrez n (entier)")
n <- scan()
min <- 2
max <- n-1
question <- TRUE

#Traitement des données
for (i in min:max){
  if(n %% i == 0){
    print("Pas premier")
    question <- FALSE
    return()
  }
}

#Resultat
if(question == TRUE){
  print(paste(n, "premier", sep=" "))
}