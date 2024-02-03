## Robust tests

It should be clear by now that many of the popular statistical procedures that reduce the data to a mean and standard deviation are not robust to datasets having skewed distributions or extreme outliers. In fact, most observational data seldom follow a nice normal distribution. The above exercise demonstrates how a very simple implementation of a t-Test can result in a lengthy detour through exploration and re-expression. This can be time consuming when exploring many different datasests. Fortunately there are several alternative statistics that are far less restrictive than the t-Test but serve the same purpose: comparing batches of numbers. These are covered here very superficially for reference.

### Permutation test

The idea here is that if concentrations of TCB come from sites with identical TCB profiles, then one should not be able to notice a difference in values measured at both sites. By mixing up (permuting) the values across batches, we can come up with a distribution of mean (or median) concentration differences between batches that we would expect to get if there was no difference. We then compare our observed mean (or median) differences to that of the distribution of simulated mean (or median) differences. In the following example, we will choose the median over the mean because of its robust measure of location.

```{r, fig.height=3.5, fig.width=4.0}
set.seed(321)
# Pool the concentrations
Pool <- c(Ref, Cont)

# Create an empty vector that will store the simulated median differences
med.dif <- vector()

# Run simulations
for (i in 1:9999){
  # Permute the pooled data then assign the resampled data to each batch
  Pool.rnd <- sample(Pool, replace=FALSE)
  # Grab the first batch of values
  Cont.rnd <- Pool.rnd[1:length(Cont)]
  # Grab the second batch of values
  Ref.rnd <- Pool.rnd[ (length(Cont)+1):length(Pool)]
  # Compute median differences
  med.dif[i] <- median(Cont.rnd) - median(Ref.rnd)
}

# Plot the distribution of median differences  
hist(med.dif)
# Now let's see where our observed difference in median concentration lies
abline(v = median(Cont) - median(Ref), col="red", lw=2)
```

We can compute a *pseudo* p-value from the above. Note that we are interested in the number of simulated values that are more extreme than our observed value.

```{r}
N.greater <- sum( (median(Cont) - median(Ref)) >= med.dif) # Number of simulated differences
# greater than the observed value
n <- length(med.dif) #number of simulated values
p <- min(N.greater + 1, n + 1 - N.greater) / (n +1)
p
```

Here, the p-value gives us the probability that our observed difference in median concentration value is consistent with the expected difference if the two sites were identical. In our example, that probability is around `r round(p,2)` suggesting that *overall*, the concentrations at both sites are relatively the same if we adopt the traditional cutoff of 0.05. But note that this p-value is 

### Wilcoxon rank sum test

This is another popular alternative to the t-Test. The technical implementation and interpretation is identical to that of the t-Test. It differs from the t-Test in that it is based on the observation ranks as opposed to the observation means. Here, we implement a two-sided test addressing the question *"are the differences in concentrations between the sites significant"*.

```{r}
wilcox.test(Cont, Ref, alternative = "greater")
```

The p-value (which is similar to that found via the permutation technique) suggests that the difference in *overall* concentrations is not that great between both sites... despite the presence of a few outliers!
  