#Variables
allumettes <- trunc(runif(n = 1, min = 15, max = 20))
WHO <- 0
USER <- 0
COMPUTER <- 1
WHO_VICTORY <- -1
n <- 0

while(WHO_VICTORY == -1){
  print(paste("Allumettes restantes", allumettes, sep = ":"))
  if(WHO == USER){
  #User
    print("Votre tour")
    
    while(n < 1 || n > 3){
      print("Entrez un nombre entre (1 et 3)")
      n <- scan()
    }
    
  } else {
  #Computer
    print("Tour de l'ordinateur")
    n <- trunc(runif(n = 1, min = 1, max = 3))
  }
  
  #Tests allumettes
  if(allumettes - n == 1){
    WHO_VICTORY <- WHO
  } else if (allumettes - n <= 0){
    WHO_VICTORY <- ifelse(WHO == USER, COMPUTER, USER)
  } else {
    allumettes <- allumettes - n
    WHO <- ifelse(WHO == USER, COMPUTER, USER)
    n <- 0
  }
}

print(ifelse(WHO_VICTORY == USER, "Vouz avez gagné", "L'ordinateur a gagné"))