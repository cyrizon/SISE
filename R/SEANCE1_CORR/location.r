print("jour = ")
jour <- scan()
print("km = ")
km <- scan()
print("code : 1 , 2, 3 ou autre valeur ")
code <- scan()
#tag temoin
tag <- TRUE
#branchement selon le code
#il faudrait une action par defaut pour code != 1, 2, 3 /!\ 
if (code == 1){
  prix <- 80 * jour + 0.5 * km
  } else if (code == 2){
  prix <-  85 * jour + 0.8 * km
  } else if (code == 3){
    prix <- 0.9 * km
  } else
  {
    tag <- FALSE
  }
#reduction avec le jour ?
if (tag == TRUE && jour > 30){
  prix <- prix / 2
  }
#affichage
if (tag == TRUE){
  print("prix = ")
  print(prix)
} else
{
  print("code incorrect")
}
