pgcd <- function(a,b){
	#chercher
	while (a != b){
		if (a > b){
			a <- a - b
		} else
		{
			b <- b - a
		}
	}
	return(a) #return(b) aurait été pareil
}

#calcul
d <- pgcd(10,12)
print("solution, methode 1 : ")
print(d)

#solution 2
pgcd.bis <- function(a,b){
	#chercher
	while (a != b){
		ifelse(a > b, a <- a - b, b <- b - a)
	}
	return(a) #return(b) aurait été pareil
}

print("solution, methode 2 : ")
print(pgcd.bis(10,12))

