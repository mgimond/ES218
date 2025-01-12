# Calculate y values based on the parabolic relationship
set.seed(787)
n <- 500
x <- runif(n,-5,5) 
y <- 11 + 0.2*x + 0.1 * x^2 + rnorm(n,0,abs(x)/2)
df <- data.frame(x,y)
OP<-par(mfrow=c(1,2));M <- eda_lm(df, x, y, poly=2);eda_sl(M);par(OP)

set.seed(787)
n <- 500
x <- runif(n,-5,5) 
y <- 11 + 0.2*x + 0.4 * x^2 + rnorm(n,0,abs(x+5)/5)
df <- data.frame(x,y)
OP<-par(mfrow=c(1,2));M <- eda_lm(df, x, y, poly=2);eda_sl(M);par(OP)
