---
output: html_document
editor_options: 
  chunk_output_type: console
---

# The theoretical q-q plot



::: {.cell}

:::

::: {.cell hash='theoretical_qq_cache/html/unnamed-chunk-2_27fdd81d355cb0e051021687e4306df0'}
::: {.cell-output-display}
`````{=html}
<table data-quarto-disable-processing="true" class="table" style="width: auto !important; ">
 <thead>
  <tr>
   <th style="text-align:left;color: rgba(85, 85, 85, 255) !important;background-color: rgba(221, 221, 221, 255) !important;text-align: center;border: 1px solid white !important;
             font-family: 'Source Code Pro', 'Open Sans';
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;"> dplyr </th>
   <th style="text-align:left;color: rgba(85, 85, 85, 255) !important;background-color: rgba(221, 221, 221, 255) !important;text-align: center;border: 1px solid white !important;
             font-family: 'Source Code Pro', 'Open Sans';
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;"> ggplot2 </th>
   <th style="text-align:left;color: rgba(85, 85, 85, 255) !important;background-color: rgba(221, 221, 221, 255) !important;text-align: center;border: 1px solid white !important;
             font-family: 'Source Code Pro', 'Open Sans';
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;"> lattice </th>
   <th style="text-align:left;color: rgba(85, 85, 85, 255) !important;background-color: rgba(221, 221, 221, 255) !important;text-align: center;border: 1px solid white !important;
             font-family: 'Source Code Pro', 'Open Sans';
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;"> tukeyedar </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;color: darkred !important;background-color: rgba(250, 232, 232, 255) !important;text-align: center;border: 1px solid white;
             font-family: 'Open Sans', Arial;
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;"> 1.1.4 </td>
   <td style="text-align:left;color: darkred !important;background-color: rgba(250, 232, 232, 255) !important;text-align: center;border: 1px solid white;
             font-family: 'Open Sans', Arial;
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;"> 3.4.4 </td>
   <td style="text-align:left;color: darkred !important;background-color: rgba(250, 232, 232, 255) !important;text-align: center;border: 1px solid white;
             font-family: 'Open Sans', Arial;
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;"> 0.22.5 </td>
   <td style="text-align:left;color: darkred !important;background-color: rgba(250, 232, 232, 255) !important;text-align: center;border: 1px solid white;
             font-family: 'Open Sans', Arial;
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;"> 0.2.3 </td>
  </tr>
</tbody>
</table>

`````
:::
:::



## Introduction

Thus far, we have used the quantile-quantile plots to compare the distributions between two empirical (i.e. observational) datasets--hence the name *empirical q-q plot*. We can also use the q-q plot to compare an empirical distribution to a theoretical distribution (i.e. one defined mathematically). Such a plot is usually referred to as a *theoretical Q-Q plot*. Examples of popular theoretical distribution are the normal distribution (aka the Gaussian distribution), the chi-square distribution, and the exponential distribution just to name a few.


::: {.cell hash='theoretical_qq_cache/html/unnamed-chunk-3_15fdf949ee89627629498ddb34f35ab4'}
::: {.cell-output-display}
![](theoretical_qq_files/figure-html/unnamed-chunk-3-1.png){width=672}
:::
:::




There are many reasons we might want to compare empirical data to theoretical distributions:

 * A theoretical distribution is easy to parameterize. For example, if the shape of the distribution of a batch of numbers can be approximated by a normal distribution we can reduce the complexity of our data to just two values: the mean and the standard deviation.
 
 * If data can be approximated by certain theoretical distributions, then many mainstream statistical procedures can be applied to the data.
 
 * In inferential statistics, knowing that a sample was derived from a population whose distribution follows a theoretical distribution allows us to derive certain properties of the population from the sample. For example, if we know that a sample comes from a normally distributed population, we can define confidence intervals for the sample mean using a t-distribution.
 
 * Modeling the distribution of the observed data can provide insight into the underlying process that generated the data.
 
But very few empirical datasets follow any theoretical distributions exactly. So the questions usually ends up being "how well does theoretical distribution *X* fit my data?"

The theoretical quantile-quantile plot is a tool to explore how a batch of numbers deviates from a theoretical distribution and to visually assess whether the difference is significant for the purpose of the analysis. In the following examples, we will compare empirical data to the normal distribution using the **normal quantile-quantile** plot or **normal q-q** plot for short.

## The normal q-q plot

If we wish to assess whether a batch of values follows the shape of a normal distribution, we can compare it to its matching *normal* quantile function,$q_{\mu,\sigma}(f)$. For example, given a batch of values $x$, we can generate the matching normal quantile using $x$'s mean, $\mu$ and standard deviation, $\sigma$. The following figure shows the overlapping density plots (left plot) and q-q plot (right plot).


::: {.cell hash='theoretical_qq_cache/html/unnamed-chunk-4_9f88561852e4c75d31c64cb1855acc7d'}
::: {.cell-output-display}
![](theoretical_qq_files/figure-html/unnamed-chunk-4-1.png){width=768}
:::
:::


The traditional "bell" shape of the normal distribution (red density plot) is apparent in the left plot. You will seldomly expect any set of observational data to follow a normal distribution exactly. Our interest is in knowing how *close* a batch of values comes to a normal distribution.

Constructing the above q-q plot requires that we extract the mean and standard deviation from $x$. This can be avoided by noting that the normal quantile, $q_{\mu,\sigma}(f)$, can be decomposed into its mean an standard deviation components $\mu + \sigma q_{0,1}(f)$ where $q_{0,1}(f)$ is the unit normal quantile (i.e. a normal quantile whose mean is $0$ and standard deviation is $1$ unit). So, if we compare $x$ to a unit normal quantile we get the following q-q plot:


::: {.cell hash='theoretical_qq_cache/html/unnamed-chunk-5_3c3485ad0d1de0c5fd2cbbaeeb0730a1'}
::: {.cell-output-display}
![](theoretical_qq_files/figure-html/unnamed-chunk-5-1.png){width=288}
:::
:::


You'll note both the additive and multiplicative offsets. The additive offset is nothing more that the sample mean, $\mu$, and the multiplicative offset is nothing more than the sample standard deviation, $\sigma$. 

We know that if two batches differ only by their offsets, and not their overall shape, then we expect the points to follow a straight line. Knowing this, we can modify the q-q plot by plotting $x$ against the unit normal quantile, $q_{0,1}(f)$. The $x=y$ slope used in the empirical q-q plot no longer applies here given that the $x$ and $q_{0,1}(f)$ scales will not necessarily match (the $q_{0,1}(f)$ will usually range from -2 to 2). Instead, we fit a line to the points to help gauge the pattern's *straightness*. This gives us the **unit normal q-q plot**. Note that the word "unit" is often dropped from the plot name and is therefore often labeled as the **normal q-q plot**.



::: {.cell hash='theoretical_qq_cache/html/unnamed-chunk-6_a760735f1c1860b57b4bea5ce59fedb2'}
::: {.cell-output-display}
![](theoretical_qq_files/figure-html/unnamed-chunk-6-1.png){width=288}
:::
:::


The x-axis can help identify the tails of the distribution by noting that roughly 68% of the values fall between `-1` and `1` standard deviations and that roughly 95% of the values fall between `-2` and `2` standard deviations.

We'll first learn how to generate this plot using the built-in R function, then we'll do the same with the `ggplot2` package, and then using the `tukeyedar` package.

### Using R’s built-in functions

In the following example, we'll compare the `Alto 1` group to a normal distribution. 


::: {.cell hash='theoretical_qq_cache/html/unnamed-chunk-7_cdef0d2d14954d7975200f5d639ee605'}

```{.r .cell-code}
library(dplyr)

df <- lattice::singer

alto  <- df %>% 
  filter(voice.part == "Alto 1") %>% 
  pull(height)
```
:::


Note that `alto` is a single vector element. We'll use two built-in functions to generate a normal q-q plot: `qqnorm` and `qqline`. 


::: {.cell hash='theoretical_qq_cache/html/unnamed-chunk-8_64a7c10c8a631e208d147c05b84a35bd'}

```{.r .cell-code}
qqnorm(alto)
qqline(alto)
```

::: {.cell-output-display}
![](theoretical_qq_files/figure-html/unnamed-chunk-8-1.png){width=288}
:::
:::


There are many ways one can fit a line to the data, Here, we opt to fit a line to the first and third quartiles (IQR) of the q-q plot. Note that the `qqline` function is defaulting to an  [f-value type of 7](univariate_plots.html#computing-the-f-quantile). This can be changed via the `qtype` argument. But note that in practice, the choice of quantile type will have little importance in discerning the straightness of the point pattern.


### Using the ggplot2 plotting environment

To generate the theoretical q-q plot in `ggplot`, we first use the `stat_qq` function to generate the point plot, then we call the `stat_qq_line` function to generate the IQR fit. Here, we are passing a single vector object instead of a dataframe to `ggplot()`.


::: {.cell hash='theoretical_qq_cache/html/unnamed-chunk-9_2ca070ef62b7a70bbfdb051986cf84f3'}

```{.r .cell-code}
library(ggplot2)

ggplot() + aes(sample = alto) + stat_qq(distribution = qnorm) +
  stat_qq_line(col = "blue") +
  xlab("Unit normal quantile") + ylab("Height")
```

::: {.cell-output-display}
![](theoretical_qq_files/figure-html/unnamed-chunk-9-1.png){width=288}
:::
:::


Note the slight difference in syntax used with `ggplot` when passing a vector instead of a dataframe to the function. Here, we take the `aes()` function outside of the `ggplot()` function. This is done to render a cleaner syntax. The alternative, `ggplot(,aes(sample = alto))`, would make it difficult to notice the comma just before `aes()`, thus increasing the chance for a typo.

The `stat_qq_line` function uses the built-in `quantile` function and, as such, will adopt the default quantile type `7` (i.e. it computes the f-value as $(i - 1)/(n - 1))$. This setting cannot be changed in `stat_qq_line`. 

Note that `geom_qq` and  `geom_qq_line` functions are identical to `stat_qq`and `stat_qq_line`.

### Using the custom `eda_qq` function

You were introduced to the `eda_qq` custom function in the previous chapter. This function can also be used to generate normal q-q plots by setting `norm` to `TRUE`. In such a case, the function takes as input a single vector of values.


::: {.cell hash='theoretical_qq_cache/html/unnamed-chunk-10_2aaa08fe06ab5c251f9233a70577f305'}

```{.r .eda .cell-code}
library(tukeyedar)
eda_qq(alto, norm=TRUE) 
```

::: {.cell-output-display}
![](theoretical_qq_files/figure-html/unnamed-chunk-10-1.png){width=240}
:::
:::


The function defaults to the quantile type `5`. To adopt the default quantile type used in `ggplot2`, set `q.type = 7`.

Note that when the `eda_qq` function is used to generate a normal q-q plot, the light dashed lines highlight the standard deviation for both sets of values. This differs from the mid 75% representation of values adopted by the function when generating an empirical q-q plot.

## How normal is my dataset?

The `alto` batch of values seem to do a good job in following a normal distribution given how well they follow a straight line. The stair-step pattern in the points is simply a byproduct of the rounding of height values to the nearest inch. A few observations at the tail ends of the distribution deviate from normal, but this is to be expected given that tail ends of distributions tend to be noisy.

So, how do the other singer groups compare to a normal distribution? We'll make use of ggplot's faceting function to generate all eight normal q-q plots.


::: {.cell hash='theoretical_qq_cache/html/unnamed-chunk-11_5b5e4074d799e4f0525480ca88103930'}

```{.r .cell-code}
ggplot(df, aes(sample=height)) + stat_qq(distribution=qnorm) +
  stat_qq_line( col = "blue") +
  xlab("Unit normal quantile") + ylab("Height") +
  facet_wrap(~voice.part, nrow = 1)
```

::: {.cell-output-display}
![](theoretical_qq_files/figure-html/unnamed-chunk-11-1.png){width=768}
:::
:::


When comparing a batch of values to a normal distribution, we are looking for a point pattern that follows the fitted line at the *core* of the dataset (i.e. between -1 and 1 standard deviations). If a systematic deviation from the straight line is observed (such as a curved pattern, for example), then this may be evidence against an assumption of normality. For the most part, all eight batches in our example appear to follow a normal distribution.

## What would a dataset pulled from a normal distribution look like?

Simulations are a great way to develop an intuitive feel for what a dataset pulled from a normal distribution might look like in a normal q-q plot. You will seldom come across perfectly normal data in the real world. Noise is an inherent part of any underlying process. As such, random noise can influence the shape of a q-q plot despite the data coming from a normal distribution. This is especially true with small datasets as demonstrated in the following example where we simulate five small batches of values pulled from a normal distribution. The `rnorm` function is used in this example to randomly pick a number from a normal distribution whose mean is set to the mean of the `alto` values  and whose standard deviation is set to the  standard deviation of the `alto` values. We also round the values to mimic the rounding of height values observed in the `singer` dataset.



::: {.cell hash='theoretical_qq_cache/html/unnamed-chunk-12_e181eb6298f887d76f3ede27557bc0b1'}

```{.r .cell-code}
set.seed(321)  # Sets random generator seed for consistent output

# Simulate values from a normal distribution
sim <- data.frame(sample = paste0("Sample",1:5),
                  value  = round(rnorm(length(alto)*5, 
                                 mean = mean(alto), sd = sd(alto))))

# Generate q-q plots of the simulated values
ggplot(sim, aes(sample = value)) + stat_qq(distribution = qnorm) +
  stat_qq_line(line.p = c(0.25, 0.75), col = "blue") +
  xlab("Unit normal quantile") + ylab("Simulated normals") +
  facet_wrap(~ sample, nrow = 1) 
```

::: {.cell-output-display}
![](theoretical_qq_files/figure-html/unnamed-chunk-12-1.png){width=864}
:::
:::



Of the five simulated batches, `Sample3` generates a *textbook*  normal q-q plot that one would expect from a normally distributed batch of values. `Sample2` *could* lead one to question whether the data were pulled from a normal distribution, even though we know that they were! 

The singer height normal q-q plots do not look different from some of these simulated plots. In fact, they probably look more *Normal* then the simulated set of values! This lends confidence in our earlier verdict that the `singer` height distributions can be characterized by a normal distribution.

## How normal q-q plots behave in the face of skewed data

It can be helpful to simulate distributions of difference skewness to see how a normal quantile plot may behave. In the following figure, the top row shows different density distribution plots; the bottom row shows the **normal q-q plots** for each distribution.



::: {.cell hash='theoretical_qq_cache/html/unnamed-chunk-13_8a2280ff8967a47d99a6e22cef0171ce'}
::: {.cell-output-display}
![](theoretical_qq_files/figure-html/unnamed-chunk-13-1.png){width=864}
:::
:::

