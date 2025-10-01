#Variable
prix <- 0

#Saisie de données
print("Saisir jour :")
jour <- scan()
print("Saisir km :")
km <- scan()
print("Saisir code :")
code <- scan()

#Traitement
if (code != 1 && code != 2 && code != 3)
{
  print("Code différent de 1/2/3")
} else {
  if(code == 1){
    prix <- 0.5 * km + 80 * jour
  } else if (code == 2){
    prix <- 0.8 * km + 85 * jour
  } else if (code == 3){
    prix <- 0.9 * km
  }
  
  if (jour > 30) {
    prix <- prix / 2
  }
  
  print (prix)
}