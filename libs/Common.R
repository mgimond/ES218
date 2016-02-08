knitr::opts_chunk$set(
  comment = NA,
  message = FALSE,
  tidy = FALSE,
  cache = FALSE,
  warning = FALSE,
  encoding = "UTF-8",
  fig.show='hold')

options( scipen = 999)

knitr::knit_hooks$set(small.mar = function(before, options, envir) {
  if (before) par(mar = c(4, 4, 1, 1))  # smaller margin on top and right
})

#knitr::opts_knit$set(list(width = 140))
options(width=120)
