knitr::opts_chunk$set(
  comment = NA,
  message = FALSE,
  tidy = FALSE,
  cache = TRUE,
  warning = FALSE,
  encoding = "UTF-8",
  fig.show='hold')

options( scipen = 999)

knitr::knit_hooks$set(small.mar = function(before, options, envir) {
  if (before) par(mar = c(4, 4, 1, 1))  # smaller margin on top and right
})

#knitr::opts_knit$set(list(width = 140))
knitr::clean_cache()

# Set console width
options(width=120)


# Function that returns package versions
pkg_ver <- function(x){
  library(kableExtra, verbose = FALSE)
  library(dplyr, verbose = FALSE, quietly = TRUE, warn.conflicts = FALSE)
  ver.lst <- lapply(x, FUN = function(x) as.character(packageVersion(x)))
  names(ver.lst) <- x
  ver.df <- as.data.frame(ver.lst)
  out <- ver.df %>% 
    kable(format = "html", escape = F) %>%
    kable_styling(full_width = F, position = "left") %>%
    row_spec(0, background = "#dddddd", align = "c", color="#555555",
             extra_css = "border: 1px solid white !important;
             font-family: 'Source Code Pro', 'Open Sans';
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;") %>% 
    row_spec(1, background = "#FAE8E8", align = "c", color="darkred"  ,
             extra_css = "border: 1px solid white;
             font-family: 'Open Sans', Arial;
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;")
  detach("package:dplyr")
  detach("package:kableExtra")
  return(out)
}


# Function that returns R versions
R_ver <- function(x){
  library(kableExtra, verbose = FALSE)
  library(dplyr, verbose = FALSE, quietly = TRUE, warn.conflicts = FALSE)
  version <- paste(R.version$major, R.version$minor, sep=".")
  names(version) <- "R"
  ver.df <- as.data.frame(version)
  out <- ver.df %>% 
    kable(format = "html", escape = F) %>%
    kable_styling(full_width = F, position = "left") %>%
    row_spec(0, background = "#dddddd", align = "c", color="#555555",
             extra_css = "border: 1px solid white !important;
             font-family: 'Source Code Pro', 'Open Sans';
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;") %>% 
    row_spec(1, background = "#FAE8E8", align = "c", color="darkred"  ,
             extra_css = "border: 1px solid white;
             font-family: 'Open Sans', Arial;
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;")
  detach("package:dplyr")
  detach("package:kableExtra")
  return(out)
}
