# Box-cox transformation on a single vector
# ================================================
#
# Purpose:
#  To re-express a vector on the ladder of powers.
#  x = vector
#  p = vector of power
#  
# Reference(s)
#   Exploratory Data Analysis, by John Tukey

bc <- function(x, p = 0) {
  if(p == 0) {
    z <- log(x)
  } else {
    z <- (x^p - 1)/p
  }
}

# Letter value summary on a single vector
# ================================================
#
# Purpose:
#  To compute Tukey's letter value summaries.
#  x = vector
#  p = vector of power
#  l = level of summary values to output (or truncate to to smallest
#      letter assoicated with level 1)
#  all = generate upper, lower and mid summaries if TRUE or
#        generate mid summaries only if FALSE
#  
# Reference(s)
#   Exploratory Data Analysis, by John Tukey

lsum <- function (x, l = 5, all = TRUE) 
{
  # Limit max letter summaries to 9
  if (l > 9) {
    print("Limit level summary to 9")
    return()
  }
  # letter summary labels
  let <- c("M", "H", "E", "D", "C", "B", "A", "Z", "Y", "X")
  # Remove missing values
  x <- na.omit(x)
  # Sort values
  x <- sort(x)
  # Find depths from each end
  n <- length(x)
  Lrnk <- vector()
  Mrnk <- vector()
  Rrnk <- vector()
  Lrnk[1] <- n
  Mrnk[1] <- n
  Rrnk[1] <- n
  i = 1
  while( (i <= l) & (Lrnk[i] > 1) ){
    i=i + 1
    Lrnk[i] <- floor(Lrnk[i-1] + 1 ) /2
    Mrnk[i] <- floor(Lrnk[i])
    Rrnk[i] <- floor(Lrnk[i] + 0.5)
  }
  # Get final set of letters
  val <- factor(let[1:length(Lrnk[-1])],levels=let[1:length(Lrnk[-1])])
  # Find the summary values
  LO <- (x[Mrnk[-1]] + x[Rrnk[-1]])  / 2
  HI <- (  x[n-Mrnk[-1] + 1] + x[n-Rrnk[-1]+1] ) / 2
  MD <- (LO + HI) / 2
  SP <- HI - LO
  # Generate output
  if(all == TRUE) {
    out <- data.frame(letter=val, depth=Lrnk[-1], lower=LO, 
                      mid=MD, upper=HI, spread=SP)
  } else {
    out <- data.frame(letter=val, mid=MD)
  }
  return(out)
} 

# Spread-level table
# ================================================
#
# Purpose:
#  To generate a spread-level table (as a dataframe).
#  df = input dataframe
#  x  = category or group column
#  y  = value column
#  

sl <- function(x,y,dat) {
  require(dplyr)
  xx <- eval(substitute(x), dat)
  yy <- eval(substitute(y), dat)
  
  df1 <- data.frame(grp=xx,y=yy)
  df2 <- df1 %>%
    arrange(grp,y)                                 %>%
    group_by(grp)                                  %>%
    summarise( n = n(),
               M = (n - 1) / 2 ,
               H = ( floor(M) - 1 ) / 2,
               med = log(nth(y,M)),
               Hlo = nth(y,floor(H)),
               Hhi = nth(y,ceiling(n() + 1 - H)),
               sprd = log(Hhi - Hlo) )             %>%
    select(grp, med, sprd)                         %>%
    data.frame()
  
  return(df2)
}