library(parallel)
library(doParallel)

my_maxmin <- function(x){
  vec <- x
  n <- length(vec)
  for(i in n:2){
    for(j in 1:(i-1)){
      if(vec[j+1] < vec[j]){
        temp <- vec[j+1]
        vec[j+1] <- vec[j]
        vec[j] <- temp
      }
    }
  }
  return(c(vec[1],vec[n]))
}

etendue_sequentiel <- function(x){
  min_max <- my_maxmin(x)
  return (min_max[2]-min_max[1])
}

vecteur <- rnorm(10000)
temps = system.time({
  etendue_sequentiel(vecteur)
})

print(temps)

etendue_parallele <- function(x,ncores=4){
  cl <- makeCluster(ncores)
  
  split_x <- split(x, cut(seq_along(x), ncores, labels = FALSE))
  
  results <- parSapply(cl, split_x, my_maxmin)
  
  stopCluster(cl)
  
  global_min <- min(results[1, ])
  global_max <- max(results[2, ])
  
  return(global_max - global_min)
}

vecteur <- rnorm(100000)
temps = system.time({
  res <- etendue_parallele(vecteur,10)
  print(res)
})

print(temps)

etendue_parallele_bis <- function(x, ncores=4){
  cl <- makeCluster(ncores)
  registerDoParallel(cl)
  
  split_x <- split(x, cut(seq_along(x), ncores, labels = FALSE))
  
  results <- foreach(part = split_x,
                     .combine = rbind,
                     .export = c("my_maxmin")) %dopar% {
                       my_maxmin(part)
                     }
  
  stopCluster(cl)
  
  global_min <- min(results[1, ])
  global_max <- max(results[2, ])
  
  return(global_max - global_min)
}


vecteur <- rnorm(100000)
temps = system.time({
  res <- etendue_parallele_bis(vecteur,10)
  print(res)
})

print(temps)