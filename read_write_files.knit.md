# Reading and Writing Data Files


::: {.cell}

:::

::: {.cell hash='read_write_files_cache/html/unnamed-chunk-2_6b47d55ccc298457eecab3c642db74d7'}
::: {.cell-output-display}
`````{=html}
<table class="table" style="width: auto !important; ">
 <thead>
  <tr>
   <th style="text-align:left;color: #555555 !important;background-color: #dddddd !important;text-align: center;border: 1px solid white !important;
             font-family: 'Source Code Pro', 'Open Sans';
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;"> readxl </th>
   <th style="text-align:left;color: #555555 !important;background-color: #dddddd !important;text-align: center;border: 1px solid white !important;
             font-family: 'Source Code Pro', 'Open Sans';
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;"> Hmisc </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;color: darkred !important;background-color: #FAE8E8 !important;text-align: center;border: 1px solid white;
             font-family: 'Open Sans', Arial;
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;"> 1.4.1 </td>
   <td style="text-align:left;color: darkred !important;background-color: #FAE8E8 !important;text-align: center;border: 1px solid white;
             font-family: 'Open Sans', Arial;
             padding:1px !important;
             padding-left:4px !important;
             padding-right:4px !important;
             font-size: 0.8em;
             border-radius: 5px;"> 4.7.2 </td>
  </tr>
</tbody>
</table>

`````
:::
:::



## Reading data files into R

Data files can be loaded from the R session's working directory, from a directory structure *relative* to the working directory using the single dot `.` or double dot `..` syntax, or (for some file types) directly from a website. The following sections will expose you to a mixture of data file environments. For a refresher on directory structures, review [Understanding directory structures](The_R_environment.html#understanding-directory-structures).

### Reading from a comma delimitted (CSV) file
A popular data file format (and one that has withstood the test of time) is the text file format where columns are separated by a *tab*, *space* or *comma*. In the following example, R reads a comma delimited file called *ACS.csv* into a data object called `dat`. 


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-3_9c054eac3514140e3c22d040a0340ac6'}

```{.r .cell-code}
dat <- read.csv("ACS.csv", header=TRUE)
```
:::


If the CSV file resides on a website, you can load the file directly from that site as follows:


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-4_78075dfafe3f89deab61b3439fcb1819'}

```{.r .cell-code}
dat <- read.csv("http://mgimond.github.io/ES218/Data/ACS.csv", header=TRUE)
```
:::


Note that not all data file formats can be readily loaded directly from a website in a "read" function without additional lines of code. Examples are given in the next two sub-sections.

To read other text formats that use different delimiters invoke the command `read.table()` and define the type of delimiter using the `sep=` parameter. For example, to read a tab delimited data file called *ACS.txt*, run the command `read.table("ACS.txt", sep="\t")`.

Note that if a number or a string is identified as being a placeholder for missing values in the data file, you can use the `na.strings =` parameter in the `read.csv` function. For example, assume that the word `"missing"` was used in the csv file to denote a missing value, the function would be modified as follows:


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-5_5ac5ce3a5c4b35a65815894c61336495'}

```{.r .cell-code}
dat <- read.csv("http://mgimond.github.io/ES218/Data/ACS.csv", 
                na.strings = "missing")
```
:::


If more than one value is used as a placeholder for a missing value, you will need to combine the values using the `c()` operator. For example, if in addition to the word `"missing"` the value of `-9999` was used to designate missing values, you would modify the above chunk of code as follows:


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-6_963b966c299dfa7c64e38ac8a41f3707'}

```{.r .cell-code}
dat <- read.csv("http://mgimond.github.io/ES218/Data/ACS.csv", 
                na.strings = c("missing", "-9999") )
```
:::


Note how the number is wrapped in double quotes. Also, note that the `na.strings` parameter is applied to *all* columns in the dataframe. So if the word `"missing"` or the number `-9999` are valid values for some of the columns, you should not use this option. Instead, you would need to selectively replace the missing values after the dataset is loaded. This option will be explored in subsequent tutorials.


### Reading from a R data file

R has its own data file format--it's usually saved using the *.rds* extension. To read a R data file, invoke the `readRDS()` function.


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-7_30e7adbb3e0e2dbe27601b737d6226b1'}

```{.r .cell-code}
dat <- readRDS("ACS.rds")
```
:::


As with a CSV file, you can load a RDS file straight from a website, however, you must first run the file through a *decompressor* before attempting to load it via `readRDS`. A built-in decompressor function called `gzcon` can be used for this purpose.


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-8_09c9910f08decfe2b02f8efb8d05d61d'}

```{.r .cell-code}
dat <- readRDS(gzcon(url("http://mgimond.github.io/ES218/Data/ACS.rds")))
```
:::


The .rds file format is usually smaller than its text file counterpart and will therefore take up less storage space. The .rds file will also preserve data types and classes such as factors and dates eliminating the need to redefine data types after loading the file.

### Reading from an Excel file

A package that does a good job in importing Excel files is `readxl`. It recognizes most column formats defined by Excel including date formats. However, only one sheet can be loaded at a time. So if multiple Excel sheets are to be worked on, each sheet will need to be loaded into separate dataframe objects.

If you don't have the `readxl` package installed, install the package as you would any other package via RStudio's interface or in R using the following command:


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-9_9fd0799383a7d6557710bef62b35bf3f'}

```{.r .cell-code}
install.packages("readxl")
```
:::


In this example, we will load an Excel data sheet called `Discharge` which tabulates daily river water discharge. The sample file, `Discharge_2004_2014.xlsx`, can be downloaded [here](http://mgimond.github.io/ES218/Data/Discharge_2004_2014.xlsx). The following chunk of code assumes that the Excel file is saved in a folder called `Data/` inside the R session's working directory.


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-10_529f8b77c1ceffed7b5582995678c1f4'}

```{.r .cell-code}
library(readxl)
xl <- read_excel("./Data/Discharge_2004_2014.xlsx", sheet = "Discharge")
```
:::


Note that the single dot `.` that precedes the `Data/` folder name instructs R to look for the `Data/` folder in the *current* working directory. A later example will show you how to instruct R to look for files and folders *outside* of the current working directory using two dots `..` instead of one.

An advantage to using this package for loading Excel files is its ability to preserve data types--including date formatted columns! In the above example, the Excel file has a column called `Date` which stores the month/day/year data as a date object. We can check that the loaded `xl` object recognizes the `Date` column as a `date` data type:


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-11_5e53e8b91819dc9fb57e4f94b1d30f6a'}

```{.r .cell-code}
str(xl)
```

::: {.cell-output .cell-output-stdout}
```
tibble [3,866 × 3] (S3: tbl_df/tbl/data.frame)
 $ Date     : POSIXct[1:3866], format: "2004-06-01" "2004-06-02" "2004-06-03" "2004-06-04" ...
 $ Discharge: num [1:3866] 6170 6590 6210 7120 6990 6160 5570 4500 4940 4550 ...
 $ Code     : chr [1:3866] "A" "A" "A" "A" ...
```
:::
:::


The `Date` column is defined as a `POSIXct` data type; this is the computer's way of storing dates as the number of seconds since some internal reference date. We would therefore not need to convert the date column as would be the case if the date column was loaded from a CSV file. If such was the case, then the date column would most likely be loaded as a character or factor data type. A more in-depth discussion on date objects and their manipulation in R is covered in the [next chapter](Week02c.html).

Excel files can be loaded directly from the web using the following chunk of code:


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-12_093c28b27aa046148ef44625a05861a6'}

```{.r .cell-code}
web.file <- "http://mgimond.github.io/ES218/Data/Discharge_2004_2014.xlsx"
tmp      <- tempfile(fileext=".xlsx")
download.file(web.file,destfile=tmp, mode="wb")
xl       <-  read_excel(tmp, sheet = "Discharge")
```
:::


Instead of downloading the file into virtual memory, R needs to download the file into a temporary folder before it can open it. However, that temporary file my not be available in a later session, so you will probably need to reload the data if you launch a new R session.

### Importing data from proprietary data file formats

It's usually recommended that a data file be stored as a CSV or tab delimited file format if compatibility across software platforms is desired. However, you might find yourself in a situation where you have no option but to import data stored in a proprietary format. This requires the use (and installation) of a package called `Hmisc`. The package will convert the following file formats: SAS (XPT format), SPSS (SAV format) and Stata (dta format). You can install the package on your computer as follows:


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-13_6c6e43ef3553c4ee661700df3cb608d3'}

```{.r .cell-code}
install.packages("Hmisc")
```
:::


In this example, a SAS file of blood pressure from the [CDC](http://www.cdc.gov/nchs/nhanes.htm) will be loaded into an object called `dat` (file documentation can be found [here](http://personal.colby.edu/reload/personal/m/mgimond/R/Data/BPX_G_README.txt)).


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-14_03584a627e19548a1577ce5928ecb7f1'}

```{.r .cell-code}
library(Hmisc)
dat <- sasxport.get("http://personal.colby.edu/personal/m/mgimond/R/Data/BPX_G.xpt")
```
:::


Likewise, to import an SPSS file, use the `spss.get()` function; and to import a STATA file, use the `stata.get()` function.

&nbsp;&nbsp;

## How to save R objects to data files
&nbsp;&nbsp;

### Export to a CSV file

To export a data object called `dat.sub` as a comma delimited file in a folder called `Data/` residing at a level *above* the R session's working directory, run the following:


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-15_e07f06b620b2d8291bbbb75b5ea09ffe'}

```{.r .cell-code}
write.csv(dat.sub, "../Data/ACS_sub.csv")
```
:::


Note that the two dots `..` tells the function to get out of the current folder (i.e. moving up a directory) before proceeding down into the `Data/` folder.

### Export to a Rds file

To export a data object called `dat.sub` to a .Rds (R) file format in a folder called `Data/` residing at a level *above* the R session's working directory, run the following:


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-16_688cf90d4c5262a22ee23775c4924217'}

```{.r .cell-code}
saveRDS(dat.sub, "../Data/ACS_sub.rds")
```
:::


## Saving an R session

You can save an entire R session (which includes *all* data objects) using the `save` function.

To save *all* objects, set the `list=` parameter to `ls()`:

::: {.cell hash='read_write_files_cache/html/unnamed-chunk-17_697e80fa7bd8932d6bb642f07fa81783'}

```{.r .cell-code}
save(list = ls(), file = "../Data/ACS_all.Rdata")
```
:::



To save only two R session objects--`dat` and `dat.sub`--to a file, pass the list of objects to the `list=` parameter:


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-18_25c35dd4d7645d69b26e861f5208d28f'}

```{.r .cell-code}
save(list = c(dat, dat.sub), file = "../Data/ACS_subset.Rdata")
```
:::


## Loading an R session

To load a previously saved R session type:


::: {.cell hash='read_write_files_cache/html/unnamed-chunk-19_05723b3c1c7f1e27b5f81cd5e7f0d91a'}

```{.r .cell-code}
load("../Data/ACS_all.Rdata")
```
:::

