print("a : ")
a <- scan()
print("b : ")
b <- scan()
print("c : ")
d <- scan()
#tester a
if (a == 0){
  #puis tester b
  if (b != 0){
    print("x : ")
    print(-d/b)
   } else
   {
    print("pas de racine")
   }
} else
{
  #delta
  delta <- b^2 - 4*a*d
  #selon delta
  if (delta < 0){
  print("pas de racines réelles")
  } else
  {
    if (delta > 0){
      print("x1 : ")
      print((-b-sqrt(delta))/(2*a))
      print("x2 : ")
      print((-b+sqrt(delta))/(2*a))
    } else
    {
      print("x : ")
      print(-b/(2*a))
    }
  }
}  

