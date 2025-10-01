#Variable
a <- 0.0
b <- 0.0
c <- 0.0

#Saisie de données
print("Saisir a :")
a <- scan()
print("Saisir b :")
b <- scan()
print("Saisir c :")
c <- scan()

#Traitement
if(a == 0)
{
  if (b != 0){
    r = (-1 * c)/b
    print(r)
  } else {
    print("Pas de racine")
  }
}

if(a != 0){
  delta = (b**2)-4*a*c
  
  if (delta < 0){
    print("Pas de racine")
  } else if (delta > 0){
    r = (-1 * b) / (2 * a)
    print(r)
  } else if (delta == 0){
    r1 = (-1 * b) - sqrt(delta)/(2 * a)
    print(r1)
    r2 = (-1 * b + sqrt(delta))/(2 * a)
    print(r2)
  }
}
