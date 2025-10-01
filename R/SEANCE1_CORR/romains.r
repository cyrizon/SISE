#saisie de la valeur
#on considère que l'utilisateur respecte
#la plage de valeurs
print("Saisir la valeur")
n = trunc(scan())

#résultat
s <- ""

#milliers
while (n >= 1000){
  s <- paste(s,"M",sep="")
  n <- n - 1000
}

#centaines au delà de 100
if (n >= 900){
  s <- paste(s,"CM",sep="")
  n <- n - 900
}

if (n >= 500){
  s <- paste(s,"D",sep="")
  n <- n - 500
}

if (n >= 400){
  s <- paste(s,"CD",sep="")
  n <- n - 400
}

#centaines
while (n >= 100){
  s <- paste(s,"C",sep="")
  n <- n - 100
}

#dizaines au-delà de 10
if (n >= 90){
  s <- paste(s,"XC",sep="")
  n <- n - 90
}

if (n >= 50){
  s <- paste(s,"L",sep="")
  n <- n - 50
}

if (n >= 40){
  s <- paste(s,"XL",sep="")
  n <- n - 40
}

#dizaines
while (n >= 10){
  s <- paste(s,"X",sep="")
  n <- n - 10
}

#dizaines au-delà de 10
if (n >= 9){
  s <- paste(s,"IX",sep="")
  n <- n - 9
}

if (n >= 5){
  s <- paste(s,"V",sep="")
  n <- n - 5
}

if (n >= 4){
  s <- paste(s,"IV",sep="")
  n <- n - 4
}

#unité
while (n >= 1){
  s <- paste(s,"I",sep="")
  n <- n - 1
}

#affichage
print(s)