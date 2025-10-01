intervalle <- function (a,b,k=3){
  if (a > b || k == 0){
    return (NA)
  } else
  {
    return ((b-a)/k)
  }
}

print(intervalle(a=10,b=12))
print(intervalle(a=12,b=10))
print(intervalle(a=12,b=10,k=0))
