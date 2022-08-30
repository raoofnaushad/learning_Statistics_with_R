#' ---
#' title: "Introduction to R"
#' author: "Qi Zhang "
#' date: "September 1, 2022"
#' ---
#'
#'
#'
###' "Everything that exists is an object.
###'
###' Everything that happens is a function call."
###'
###' --- John McKinley Chambers
###'
###'
###' Two basic types of things/objects: data and functions
###'
###' * Data: things like 42, "forty-two", 42.000, and $$\begin{array}{ccc} 1 & 2 & 3\\ 4 & 5 & 6 \end{array}$$
###'
###' * Functions: things like log, +, < , %%, and median.
###'
###' A function turns the input object/arguments, into an output object, according to a defnite rule.
###'
###' Programming is writing functions and apply to transform inputs into outputs.
###'
###' * Good programming ensures the transformation is done easily and correctly.
###'
###' * The trick to good programming is to take a big transformation and break it down into smaller ones, and then break those down,
###' until you come to tasks which are easy (e.g., using built-in functions)
###'
###' #### Data
###'
###' At base level, all data can represented in binary format, by bits (i.e., TRUE/FALSE, YES/NO, 1/0). The following are the basic data types:
###'
###' * Booleans/Logical: Direct binary values: TRUE or FALSE in R
###' * Integers: whole numbers (positive, negative or zero), represented by a fixed-length block of bits
###' * Characters: fixed-length blocks of bits, with special coding; strings: sequences of characters
###' * Floating point numbers: an integer times a positive integer to the power of an integer, as in $3\times 10^6$ or $1\times 10^{3}$. When it is too large, it is Inf or -Inf.
###' * Missing or ill-defined values: NA, NaN, etc.
###'
###' #### Operators
###'
###' * Unary: take just one argument. E.g., - for arithmetic negation, ! for Boolean negation
###' * Binary: take two arguments. E.g., +, -, *, and /. Also, %% (for mod), and ^

-42
42 + 5
42 - 5
41 * 5
4 ^ 2
42 / 5

###' The operators can be stacked. What are the values of the following?
4-2*5

###' Comparison operators
###'
###'These are also binary operators; they take two objects, and give back a Boolean

4 > 5
4 < 5
5 >= 4
4 <= 5
4 == 5
4 != 5

###' Warning: == is a comparison operator, = is not!
###'
###' Logical operators
###'   These basic ones are & (and) and | (or)

(5 > 8) & (6 * 7 == 42)
(5 > 8) | (6 * 7 == 42)
(5 > 8) | (6 * 7 == 42) & (0 != 0)
(5 > 8) | (6 * 7 == 42) & (0 != 0) | (10 - 8 >= 0)

###' Note: The double forms && and || have different meanings. We'll see them later
###'
###' "#" is for comments. Whatever after # symbol is a line will not run. Usually we use it to add annotations to our code,
###' or use it for old code that we do not want to use, but do not want to delete completely now.

4+5 # 4 plus 5

# 4+5 this code will not run because I "comment" it away.


###'
###' #### Data type
###'
###' The typeof() function returns the data type
###'
###' is.foo() functions return Booleans for whether the argument is of type foo
###'
###' as.foo() (tries to) "cast" its argument to type foo, to translate it sensibly into such a value
###' When it is not sensible to translate, it returns NA.
###'
###' class() function returns the class of the object, it returns what "type" of an object is from the point of view of object-oriented programming in R (e.g., a specific R package).
###'
###' typeof() returns the type of data from the point of view of R itself.
typeof(4)
is.numeric(4)
is.na(4)
is.na(4/0)
is.na(0/0)
is.character(4)
is.character("4")
is.character("four")
is.na("four")
as.numeric('four')
as.numeric('4')

as.character(5/4)
as.numeric(as.character(5/4))
4 * as.numeric(as.character(5/4))
5/4 == as.numeric(as.character(5/4))

###'
###' #### Variables
###'
###' Data can have names. We can assign the data objects to names, which give us variables. Some variables are built-in:

pi
###' Variables can be arguments to functions or operators, just like constants:

pi * 10
cos(pi)
###' We create variables with the assignment operator, <- or =

approx.pi <- 22/7
approx.pi
radius = 10
radius
approx.pi * radius^2

###' The assignment operator also changes values:

area <- approx.pi * radius^2
area
area = 30
area

###' In most of cases, "<-" and "=" works the same as assignment operator.
###' But there are actually some subtle differences.
###' We will discuss some of these differences when it matters in practice.
###' Some people argue that "<-" should be preferred over "="
###' At least, we should use the same type of assignment operator throughout one R script.
###'
###' You will write code using many variables.
###' It will make your life much easier if the names of your variables are descriptive,
###' easier to design, easier to debug, easier to improve, and easier for others to read.
###' Please try to limit use of fixed constants in code; instead use named variables
###' Named variables are a first step towards abstraction
###'
###' The following is one example of such abstraction
###' This code check whether the area of a circle is big

area = 30
(area>10)

###' Here the criterion of a big circle is whether its area is bigger than 10.
###' If we decide to change the cutoff to 40. We have to do the following
(area>40)

###' An alternative is to define a variable for the cutoff
cutoff.big = 10
(area>cutoff.big)

###' Then when we want to change the cutoff, we only need to change of value of the cutoff, and do not need to change the code for comparison.
cutoff.big = 40
(area>cutoff.big)




###'
###' #### Practice
###'
###' Please write R programs to answer the following questions.
###'
###' (1) Is 379 plus 83 times 48 lager than 38 times 94 minus 61?
###'
###' (2) What is the data type of pi? What about 'pi'? We know that pi is a built-in constant, can you convert 'pi' to numeric?
###'



###'
###' #### Useful commands in R workspace
###' ls() command shows you What have been defined in the environment.
ls()
###' Getting rid of variables:
rm("area")
ls()
rm(list=ls()) # Be warned! This erases everything
ls()
###'
###' #### R packages
###'
###' The functions that we have been using so far are "built-in" functions that we can use directly when we open R.
###'
###' R is well-known for large repository of R packages that contains various functions for general and customized tasks.
###'
###' An R package is just a bunch of R functions written and compiled by someone.
###' R/RStudio provides no guarantee on the quality of these packages. Only the authors do, if they want to.
###'
###' These functions cannot be used directly. You need to install these packages first, and then load it to the R session that you are currently working on.
###' If the name of a package that you have installed is called "magicHat", then run the line library(magicHat) will load the functions in this packge to the R session.
###'
###' Depending on the R you are using (Rstudio or not), and where the pacakge is hosted, there are many ways of installing packages.
###'
###' * The most common way is to use command install.packages, install.packages(c('magicHat','magicGloves','magicbowtie')). It installs R packages named magicHat, magicGloves, and magicbowtie hosted on CRAN https://cran.r-project.org/
###' This is the main repository of R packages. Each package has a webpage on CRAN where you can also find the manual, and some other useful information.
###' * If you are using Rstudio, you can also click "Tools--> install packages", and select the packages to be installed from the menu.
###' Either way, you may be asked to choose a mirror of CRAN where these files will be downloaded. Usually I choose one that is close to me geographically.
###' * Another significant source of R packages is Bioconductor https://bioconductor.org/. This is extremely useful especially if you are interested in analyzing biological data.
###' But some of the packages actually can be applied to other data, and rather general. Bioconductor packages are usually better ducumented, and may contain a detailed tutorial with examples.
###' To install a Bioconductor package, you need to install the Bioconductor (installer) first, and then run the commands that install a specific package. Please refer to Bioconductor website for more details.
###' * More and more people start to host R packages on their on Github page. For some of them, you may be able to install them directly.
###' There is an install_github function to install R packages hosted on GitHub in the devtools package. But it requests developer's name.
###' install_github("DeveloperName/PackageName")
###'
###'
###' #### R markdown and knitr package.
###'
###' kinitr package allows you to write documents that blend text and code seamlessly.
###' Then you just need to knit (compile) it into a document.
###'
###' There are various ways of creating such a document. We will only cover one way in this course, because it is how you will create your submission for lab.
###'
###' In a R script, all lines starting with " #' " will be recognized as text in R markdown file.
###'
###' You may choose to compile the document as pdf or html, and I prefer html.
###'
###' #### The most important operator in R
###'
###' ?
###'
###' Type ?function_name in the console will bring you the help page of that function, if it exists.
###'
###' Usually this help page contains the meaning of each input argument of that function, output data type, default inputs, and some additional details, and a usage example.
###'
###' If you still have doubt about a function's usage after reading the help page, sometimes it may be helpful to test the function.
###'
###' That is, consider some hypothetical input of the function, predict the output in your head, then feed the input to the function to see whether it is consistent with your prediction.
###' If not, try to revise the prediction model in your head based on the actual output you see.
###'
###'
###' #### Practice
###'
###' 1. Install R packages ggplot2
###'
###' 2. Knit this lecture note.
###'
###' 3. read the help page of R function lm
###'
###'
###' #### Basic data structure
###'
###' A data structure is a grouping of related data values into an object
###'
###' Vector: A vector is a sequence of values, all of the same type
###'
###' #### Creating vectors
###'
###' The c() function returns a vector containing all its arguments in specified order.
x = c(3, 5, 10, 42)
x
is.vector(x)

###' vector(length=n) returns an empty vector of length n; helpful for filling things up later
solar.planets = vector(length=8)
solar.planets
solar.planets[3] = 'earth'
solar.planets

###' Creating specific vectors:
###' A sequence of consecutive integers
1:5
-1:5
###' More flexible way of generating a sequence
seq(from=1,to=5)
seq(from=1,to=5,by=0.5)
seq(from=1,to=5,by=0.7)
seq(from=1,to=5,length.out=6)

###' Replications of the same value (sequences)
rep(2,3)
rep('earth',3)
rep(c(1,3),3)
rep(c(1,3),each=3)

###'
###' #### Vector arithmetic
###'
###' Arithmetic operator apply to vectors in a "component-wise" fashion

y = c(-3, -5, -10, -42)
x + y
x * y
###' Recycling:
###' When the vectors have different lengths, the elements in shorter vector are repeated (recycled) when the shorter vector runs out.

x + c(-7,-8,-7)
x + c(-7,-8,-7,-7)
x^c(1,0,-1,0.5)

###' Single numbers are vectors of length 1 for purposes of recycling:
2 * x

###' Can do component-wise comparisons with vectors:

x > 9
###' Logical operators also work elementwise:
(x > 9) & (x < 20)

###'
###' #### Indexing vectors
###'
###' Vector of indices:
x = c(3, 5, 10, 42)
y = c(-3, -5, -10, -42)
x[c(2,4)]
###' Vector of negative indices (everything but .. ):
x[-c(1,3)]
###' Boolean vector (everything such that):
x[x > 9]
y[x > 9]
###' which() gives the elements of a Boolean vector that are TRUE:
indices <- which(x > 9)
indices
y[indices]

###'
###' #### Named components
###'
###' We can give names to elements/components of vectors, and index vectors accordingly

names(x) = c("v1","v2","jane","john")
names(x)
names(y)
x[c("jane","v1")]
x1= x[-1]
x1['jane']
x[3]
x1[3]
###' For a named vector, R prints the names. What you saw were not additional components of x
###'
###' names() returns another vector (of characters):
names.x <- names(x)
names.x
names(y) <- names(x)
which(names(x) == "jane")



###'
###' #### Practice
###'
###' Please write R program to answer each of the following questions.
###'
###' We will use an R built-in dataset LakeHuron. You can get the dataset using command data(LakeHuron).
###' This dataset record Annual measurements of the level, in feet, of Lake Huron 1875--1972.
###'
###' a) Display the first 10 elements of this vector


###'
###' b) create a variable named year whose values are the corresponding years of LakeHuron.
###'
###' c) Name the elements of LakeHuron by year, and display the first 10 elements of this vector again.
###'
###' d) Find the year with the highest level during 1940-1960
###'



###'
###' #### Factor
###'
###'Factors are used to represent categorical data. They look like characters, but are actually integers under the hood.
###'
###' These integers are their positions in the sequence of the unique values of the charaters in a specific order.
###' Factors can be ordered (ordinal data) or unordered.
###' Factors are an important class for statistical analysis and for plotting
solar.planets = c('mercury','venus','earth','mars','jupiter','saturn','uranus','neptune')
typeof(solar.planets)
solar.planets.data = c('mercury','jupiter','saturn','venus','earth','mars','mercury','venus','jupiter','saturn','mercury','venus','uranus','neptune')
typeof(solar.planets.data)
solar.planets.data.factor = factor(solar.planets.data)
solar.planets.data.factor
as.numeric(solar.planets.data.factor)
as.numeric(solar.planets.data)
###' As you have seen, a factor can be converted to numeric, because they are integers under the hood, but a character cannot.
###'
levels(solar.planets.data.factor)
###' "Levels" of a factor is the ordered sequence of its unique values. The integer values depends on the order. What is the order by default?
###' You can change the order by adding an argument specifying the levels when defining the factor.
###' Let us try to assign the levels based on their closeness to the sun.
solar.planets.data.factor.ordered = factor(solar.planets.data,levels = solar.planets)
solar.planets.data.factor.ordered
as.numeric(solar.planets.data.factor.ordered)


###'
###' #### Lists
###'
###' A list is sequence of values, but not necessarily all of the same type
###' Recall that a vector is a sequence of values of the same type


my.sim = list("exponential", 7, matrix(1,2,2))
my.sim
###' Most of (non-numeric) vector operations can be applied to lists
###'
###' #### Accessing parts of lists
###' Can use [ ] as with vectors
###'
###' Or use [[ ]], but only with a single index [[ ]] drops names and structures, [ ] does not
my.sim[2]
my.sim[[2]]
my.sim[[2]]^2
try(my.sim[2]^2)

###' We can name some or all of the elements of a list:

names(my.sim) = c("family","mean","data")
my.sim
my.sim[["family"]]
my.sim["family"]
###' Lists have a special shortcut way of using names, with $:

my.sim[["family"]]
my.sim$family

###' Creating a list with names:

my.sim2 = list(mean=7, sd=1, family="gaussian",data=matrix(rnorm(6,3,2)))

###' Adding named elements:

my.sim$random.seed = 1
my.sim[["last.updated"]] = "2021-07-01"

###' Removing a named list element, by assigning it the value NULL:

my.sim$random.seed = NULL



###'
###' #### Key-value pairs
###'
###' Lists give us a natural way to store and look up data by name, rather than by position.
###'
###' This is a really useful programming concept that may come with many names: key-value pairs, dictionaries, or associative arrays
###'
###' For example, we can compare the "family" element of my.sim and my.sim2 by looking that up by name, without caring where it is (in what position it lies) in the list
###'
my.sim[['family']]
my.sim2[['family']]

###' My personal take-away when I learned this: always name the elements of your list and vector when natural names exist, and always index these elements with names when they are named.
###'

###'
###' #### Data frames
###'
###' The format for the "classic" data table in statistics: data frame.
###'
###' * Think of each row as an observation/case
###' * Think of each as a variable/feature
###' * Not just a matrix because variables can have different types
###' * Both rows and columns can be assigned names
###' You can think of a data frame to be a matrix whose columns can have different data types,
###' or a list whose elements are all length n vectors with potentially different data types.

###' Creating a data frame:
###' Use data.frame(), similar to how we create lists

my.df = data.frame(nums=seq(0.1,0.6,by=0.1), chars=letters[1:6],
                   bools=sample(c(TRUE,FALSE), 6, replace=TRUE))
my.df
###' Note, a list can have different lengths for different elements.
my.list = list(nums=seq(0.1,0.6,by=0.1), chars=letters[1:12],
               bools=sample(c(TRUE,FALSE), 6, replace=TRUE))
my.list
###' Indexing a data frame
###'
###' * By rows/columns: similar to how we index matrices
###' * By columns only: similar to how we index lists
my.df[,1] # Also works for a matrix

my.df[,"nums"] # Also works for a matrix

my.df$nums # Doesn't work for a matrix, but works for a list

my.df$chars # Note: this one has been converted into a factor data type

as.character(my.df$chars) # Converting it back to a character data type


###' Adding rows and columns:
###' We can add rows or columns to an array or data frame with rbind() and cbind(), but be careful about forced type conversions. (They also work for matrices)

rbind(my.df,list(nums=-3,chars='B+',bools=T))
rbind(my.df,c(-3,4,6))
rbind(my.df,c(3,4,6))[7,2]


###' Creating a data frame from a matrix:
###' Sometimes you are given a matrix. You can then make it a data frame, and even add additional columns to it.
###'

class(state.x77) # Built-in matrix of states data, 50 states x 8 variables
head(state.x77)
class(state.region) # Factor of regions for the 50 states
head(state.region)
class(state.division) # Factor of divisions for the 50 states
head(state.division)
state.df = data.frame(state.x77)
state.df$Region=state.region
state.df$Division=state.division
state.df$order = 1:nrow(state.df)
state.df$order_reverse = nrow(state.df):1
class(state.df)
head(state.df) # Note that the first 8 columns name carried over from state.x77

###' You can convert a matrix to a data frame and add additional columns in one single step
###'
# state.df = data.frame(state.x77, Region=state.region, Division=state.division)

###' Deleting columns from a data frame.
###' To delete columns: we can either use negative integer indexing, or set a column to NULL

state.df = state.df[,-ncol(state.df)]
head(state.df, 3)

state.df$order = NULL
head(state.df, 3)

###' With matrices or data frames, we often want to access a subset of the rows corresponding to some condition.
###' You already know how to do this, with Boolean indexing

# Compare the averages of the Frost column for states in New England and for Pacific divisions
mean(state.df[state.df$Division == "New England", "Frost"])

mean(state.df$Frost[state.df$Division == "Pacific"])

###' As you may have noticed, using "$" and [] multiple times in the same expression looks cumbersome. There are more convenient alternatives.
###'
###' subset():
###' The subset() function provides a convenient alternative way of accessing rows for data frames
###'
###' Using subset(), we can just use the column names directly (i.e., no need for using $, or write state.df twice)

state.df.ne.1 = subset(state.df, Division == "New England")
###' Get same thing by extracting the appropriate rows manually
state.df.ne.2 = state.df[state.df$Division == "New England", ]
all(state.df.ne.1 == state.df.ne.2)

###' Same calculation using subset()
mean(subset(state.df, Division == "New England")$Frost)
mean(subset(state.df, Division == "Pacific")$Frost)

#' A more general solution is to use with() function.
#' with(dt,expr) allows you to write the expr using the variable names (column names for a data frame) in expr directly without referencing to dt every time. It can be used ina wide range of settings. I personally have found it a lifesaver.
#'
with(state.df,mean(Frost[Division == "New England"]))
with(state.df,mean(Frost[Division == "Pacific"]))

with(state.df,plot(Income, Illiteracy))

#' It can be combined with subset()

with(subset(state.df,Region=='South'),plot(Income, Illiteracy))

#'
#'A third way to address this issue and more is to adopt tidyverse . The tidyverse package actually contains other packages (dplyr, ggplot2, etc.), and looks more like a universe. These packages are built based on the same grammar, data structure and design principle. Once the initial learning curve is overcome, they can be very useful and intuitive in real data analysis. We will use it in this course, but not intensively. For those who are interested, this is a good online book for it (https://jhudatascience.org/tidyversecourse/)
#'
#'
#'"%>%" operator is one of the most important operation in tidyverse. Using this operator, one can start with a dataset, and stack many operations to build an analysis pipeline.
#'
library(tidyverse)

state.df %>%
  filter(Division=="New England")%>%
  summarise(mean(Frost))

mean.forst.pacific <- state.df %>%
  filter(Division=="Pacific")%>%
  summarise(mean(Frost))

mean.forst.pacific


#'
#' #### Data files
#'
#'Very often you will need to work with a dataset given to you as a file.
#'
###' Depending on the original format, there are many functions for reading data into R, including, but not limited to the following:
###'
###' * readLines(): reading in lines of text from a file or webpage; returns vector of strings
###' * read.table(): read in a data table from a file or webpage; returns data frame
###' * read.csv(): like the above, but assumes comma separated data; returns data frame
###' For now we will focus on read.table(), read.csv() and their counterparts write.table(), write.csv(), respectively

###'
###'
###' Generally there are two ways to read/write in data in specialized R formats:
###'  readRDS(), saveRDS(): functions for reading/writing single R objects from/to a file
###'load(), save(): functions for reading/writing any number of R objects from/to a file

###'
###'
###'Then read.table() reads a data matrix into R. It works as in:
###'
###'  read.table(file=file.name, sep=" "), to read data from a local file on your computer called file.name, assuming (say) space separated data
###'
###'read.table(file=webpage.link, sep="\t"), to read data from a webpage up at webpage.link, assuming (say) tab separated data
###'
###'The function read.csv() is just a shortcut for using read.table() with sep=",". (But note: these two actually differ on some of the default inputs!)
###'
###' If you are using RStudio, you can also read data by clicking "Import Dataset" in the top right panel. This interface produce a chunk of R code that read the data,
###' you can also change the default options if you are not happy with what R studio proposes.
###'
###' We will primarily use read.csv, read.table
setwd('D:\\Dropbox\\courses\\F2022_835intro\\notes\\')
dt.birth = read.csv('data\\births.csv',header = T)
dim(dt.birth)

#' sometimes the first column is row IDs which you may want to exclude


dt.orings1 = read.csv('data\\orings.csv',header = T)

head(dt.orings1)


dt.orings = read.csv('data\\orings.csv',header = T,row.names = 1)

head(dt.orings)

###'
###' R objects can be saved in an R data file with extension data .RData, .rdata or etc using R function save().
###'
###' To use these objects in a separate R session, you need to use R function load()
###'
###' Data table data frame or matrices can be written to a text file such as .csv or .txt using R function write.table() and write.csv()
###'
###' I provide some minimal example in the following, please refer to the help manual of these functions for details.

write.table(dt.orings,file='myorings.txt',sep="\t",row.names = F)

all.dt = list(birth=dt.birth,orings=dt.orings)
save(all.dt, file='mydt.rdata')

try(write.table(all.dt,file='mydt.txt',sep="\t",row.names = F))

rm(all.dt)
ls()

load('mydt.rdata')
ls()



###'
###' #### Practice:
###'
###'
###'
###' 1. Check the dimension of this dataset, and display the first four rows in the console
###'
###' 2. One column of this dataset should be removed because it is not informativ. Can you guess which one it is? Please remove it from the data.frame.
###'
###'
###'
###' 4. Display the rate of Murder and nonnegligent manslaugher for New Hampshire.

###'
###' 5. Calculate the average Rape rate (revised rape rate..2) for the states with robbery rate higher than 80.
###'
###' 6. Calculate the standard deviation of the Violent crime rates of the states whose populations are larger than 5,000,000.




#'
#' #### Iteration and replication

###'
###'#### for()
###'
###'  A for() loop increments a counter variable along a vector.
###'  It repeatedly runs a code block, called the body of the loop, with the counter set at its current value, until it runs through the vector

n = 10
log.vec = vector(length=n, mode="numeric")
for (i in 1:n) {
  log.vec[i] = log(i)
}
log.vec

#' Avoiding explicit loops is good practice. One alternative is vectorization through apply() function family. We will not cover this in this course.
#'
#'
#' #### replicate()
#'
#' R funciton replicate() repeats a chunk of code for a given number of times. It is very useful in simulation studies.

x=rnorm(10)
y=rexp(3)
z = sum(x^2)-mean(y)

n = 1000

# If use for loop


z.vec.for = rep(NA,n)
for(ii in 1:n){
  x=rnorm(10)
  y=rexp(3)
 z.vec.for[ii]= sum(x^2)-mean(y)

}

hist(z.vec.for)

# now let us use replicate()
z.vec = replicate(n,
 {
  x=rnorm(10)
  y=rexp(3)
  sum(x^2)-mean(y)
 }
)

hist(z.vec)
