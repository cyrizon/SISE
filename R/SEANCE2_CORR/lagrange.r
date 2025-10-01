#vider la mémoire
rm(list=lsl())

#interpolation de Lagrange
Lagrange <- function(y0,y1,y2,x0,x1,x2){
  #vérification - x0, x1, et x2 distincts ?
  if (length(unique(c(x0,x1,x2))) < 3){
    #l'appel à return provoque la sortie de la fonction
    return(NULL)
  }
  #calcul - cf. exemple de Wikipedia : https://fr.wikipedia.org/wiki/Interpolation_lagrangienne
  #de manière très scolaire
  #L0(X)
  A0 <- 1.0/((x0-x1)*(x0-x2))
  B0 <- A0*((-x1)+(-x2))
  C0 <- A0*((-x1)*(-x2))
  #L1(X)
  A1 <- 1.0/((x1-x0)*(x1-x2))
  B1 <- A1*((-x0)+(-x2))
  C1 <- A1*((-x0)*(-x2))
  #L2(X)
  A2 <- 1.0/((x2-x0)*(x2-x1))
  B2 <- A2*((-x0)+(-x1))
  C2 <- A2*((-x0)*(-x1))
  #coef. de la parabole
  A <- y0*A0+y1*A1+y2*A2
  B <- y0*B0+y1*B1+y2*B2
  C <- y0*C0+y1*C1+y2*C2
  #renvoyer les résultats
  return(list(A=A,B=B,C=C))
}

#appel sur l'exemple Wikipedia
P <- Lagrange(y0=3,y1=2,y2=-1,x0=1,x1=-1,x2=2)
print(P)

#polynôme de degré 2
polynome <- function(parabole,x){
  return(parabole$A*x^2+parabole$B*x+parabole$C)
}

#vérification
print(polynome(P,x=1))
print(polynome(P,x=-1))
print(polynome(P,x=2))