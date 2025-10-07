# "Classe"

Perform_ACP <- function(donnees){
  if(!is.data.frame(donnees) && !any(sapply(donnees, is.numeric))){
    stop("Not a dataframe or contains non-numeric values")
  }
  
  instance <- list()
  instance$X <- donnees
  instance$calc <- princomp(donnees, cor = TRUE, score = TRUE)
  instance$vp <- instance$calc$sdev^2
  class(instance) <- "ACP"
  return(instance)
}

# Tests
# 1
data(mtcars)
obj <- Perform_ACP(mtcars)

# 2
print(obj)

# 3
print.ACP <- function(objet) {
  cat("Variables : ", colnames(objet$X), "\n")
  cat("Valeurs propres : ", objet$vp, "\n")
}

methods(print)

print(obj)

# 4
screeplot.ACP <- function(object, seuils=FALSE) {
  vp <- object$vp
  
  n <- length(vp)
  
  plot(1:n, vp, type = "b", pch = 19, col = "black",
       main = "Éboulis des v.p.")
  
  if (seuils) {
    briser_baton <- function(k) {
      sapply(1:k, function(i) sum(1 / (i:k)) / k)
    }
    seuils_baton <- briser_baton(n) * sum(vp)
    lines(1:n, seuils_baton, type = "b", pch = 17, col = "red")
  }
}

methods(screeplot)

screeplot(obj, seuils=TRUE)

# 5
summary.ACP <- function(object, ncomp) {
  if(is.null(ncomp) || ncomp == 0 || ncomp > length(object$vp)){
    ncomp <- 2
  }
  
  correlation <- sweep(
    object$calc$loadings[,1:ncomp], 
    2, 
    object$calc$sdev[1:ncomp], 
    FUN = "*")
  
  rownames(correlation) <- rownames(object$calc$loadings)
  colnames(correlation) <- paste0("Comp.", 1:ncomp)
  
  cat("Valeurs propres : ", object$vp, "\n")
  cat("Correlation : ", "\n")
  print(round(correlation,2))
}

methods(summary)

print(summary(obj,ncomp=3))

# 6
cercle_correlation.ACP <- function(object,comp1=1,comp2=2){
  #**** corrélation variables-facteurs ****
  c1 <- object$calc$loadings[,comp1]*object$calc$sdev[comp1]
  c2 <- object$calc$loadings[,comp2]*object$calc$sdev[comp2]
  #affichage
  correlation <- cbind(c1,c2)
  #*** cercle des corrélations - variables actives ***
  plot(c1,c2,xlim=c(-1,+1),ylim=c(-1,+1),type="n",asp=1)
  abline(h=0,v=0)
  symbols(0,0,circles=1,inches=F,add=T)
  arrows(0, 0, c1, c2, length = 0.1, angle = 15, col = "blue")
  text(c1,c2,labels=colnames(object$X),cex=0.5)
}

cercle_correlation.ACP(obj)

# 7
plan_factoriel.ACP <- function(object,comp1=1,comp2=2,seuilCos=0.5,labels=NULL){
  coords <- object$calc$scores[, c(comp1, comp2)]
  
  total_inertia <- rowSums(object$calc$scores^2)
  cos2 <- rowSums(coords^2) / total_inertia
  
  keep <- cos2 >= seuilCos
  coords_filtres <- coords[keep, , drop = FALSE]
  
  if (is.null(labels)) {
    labels <- rownames(object$X)
  }
  labels_filtres <- labels[keep]
  
  plot(coords_filtres, xlab = paste0("Comp.", comp1), ylab = paste0("Comp.", comp2),
       main = "Plan factoriel des individus", pch = 20, col = "darkgreen")
  abline(h = 0, v = 0, col = "gray")
  text(coords_filtres, labels = labels_filtres, pos = 3, cex = 0.7)
}

plan_factoriel.ACP(obj,seuilCos=0.9)