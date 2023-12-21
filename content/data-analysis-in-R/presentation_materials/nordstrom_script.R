#########################
# CRDDS Intro to R Workshop
# Presenter: Scott Nordstrom (scottwatsonnordstrom@gmail.com)
# Date: May 17, 2023
#########################

##### REMINDERS:

# You are opening and reading this script in the editor window.
# To run a command, highlight a portion of code and either
# press "Run" (up above, to the right of the floppy drive), or
# do ctrl+enter (pc) or cmd+enter (mac)
#
# Your output will appear in the console window!

# Also remember that the pound sign (#) initiates a comment
# R will not run comments - when it encounters a line with a pound sign,
# it will ignore everything after the pound.
# This is useful for documenting your scripts (making ntoes to yourself,
# or other possible users of your script.)

##### Simple arithmetic in R

2 + 2

# remember order of operations (PEMDAS)
(2+2)^2 

# this is a logical statement - it returns TRUE or FALSE
192^2 < 4^4 

##### Saving variables in memory

# the = (or <-) operators are used for variable assignment
# the value computed on the right hand side of the =
# gets assigned to the name on the left 
x = 2 + 2

# Just running a variable name will display what it stores
x

# You can run commands or operations on variables
x^2

# Little-known trick: wrapping your command in parentheses ()
# will print its output to the console when it runs
(x = 2 + 2)

# You can use variables to assign other variables
x = 2 + 2
y = 3 * 18
(z = y / x)

# You can over-write variables
x
x = 4 * 4
x

# Remove variables with rm()
rm(x)

# Check the variables that you have declared with ls()
ls()
# if you want to remove everything, you can run: rm(list = ls())

##### Functions

# Functions have a name (no spaces) and end with parentheses
# You put "arguments" into the parentheses - these are inputs or settings to
# specify what the function does.

# For example: cosine is cos()
cos(0)
cos(pi)

# A handful of functions don't require arguments, but these are rare.
# e.g., this one returns the current time and date (useful for timing how long
# it takes your scripts to run)
date() 

# You can read about each of these functions in the "help pages"
# Access the help pages by typing question mark (?) then the name
# of the function, e.g.,
? cos
? sqrt

##### Other data types

# R can of course handle non-integer numbers
-3.5
sqrt(.5)

# R can also handle characters or "strings"
# These are wrapped in quote marks - either double or single quotes work, so long 
# as you are consistent

"five"
"5"
'sko buffs!'

# Note that you can assign characters to variables
five.character = 'five'
five.character

# Logicals: as noted above, statements that can be interpreted as TRUE or FALSE
# are 'logical' statements (sometimes also called 'boolean' or 'binary')

5 > 4
cos(1) > sin(1)

# You can assign these to variables as well
five.four = 5 > 4
five.four

# Note that if you try to do math operations on them, TRUE gets coded as 1 and
# FALSE gets coded as 0
sum(c(TRUE, TRUE, FALSE, FALSE, TRUE))
mean(c(TRUE, TRUE, FALSE, FALSE, TRUE))

# You can convert from one type to the other using functions that start with `as.`,
# e.g., as.character(), as.numeric(), etc.

# This will return an error
"5" + "4"

# This will save as a character but not execute the math
"5 + 4"

# But this will run properly!
as.numeric("5") + as.numeric("4")


##### Vectors

# Vectors will store multiple elements, in order, in one dimension
# Vectors can hold numbers, characters, dates, etc., but everything in the
# vector must be the same type.

# A vector of integers
brady_sb_wins <- c(2001, 2003, 2004, 2014, 2016, 2018, 2020)
# A vector of characters
brady_sb_wins <- c('xxxvi', 'xxxviii', 'xxxix', 'xlix', 'li', 'liii', 'lv')

# Note that if you try to make a vector of multiple types, some of your types
# will get coerced into something else.
ex_vec <- c(5, 6, 'red') # note - two integers and a character
ex_vec
# now they are all characters


##### Indexing

# Indexing is how you pick out certain elements of a vector (or any object with
# multiple elements in it)

# We index using square brackets, []
# We put the number(s) of the element that we want to pick out into the brackets

# E.g., here is a vector (already built in to R) with all the letters
letters 
# To pick out the letter "e", which is the fifth element, we do this:
letters[5]

# But we can also do this with multiple elements!
# You can make a new vector for indexing, e.g., using c()
letters[c(5, 22, 15, 12, 21, 20, 9, 15, 14)]

# There are multiple ways to add to a vector. 
# One is to simply do c(old_vector, new_elements)
# For example
usa_colors <- c('red', 'white', 'blue')
# To get the colors of Azerbaijan, which are red white blue and green,
# we can simply add 'green' to the end of the usa_colors vector
azeri_colors <- c(usa_colors, 'green')
azeri_colors

# To remove elements, we can use the minus sign in indexing
# Minus sign in front of an element (or elements) tell R to remove those
# To get the colors of the Lebanese flag, remove the third element ('blue')
lebanese_colors <- azeri_colors[-3]
lebanese_colors

# You can also use the minus to remove multiple elements
canadaian_colors <- azeri_colors[-c(3, 4)]
canadaian_colors

##### Data frames

# Data frames are two-dimensional objects for storing data.
# Rows usually correspond to one observation (data point) and columns usually
# store variables
# They function very similar to spreadsheets, and R has a number of great
# built-in features for handling them.

# For example, the (built-in) data frame `cars`:
# This data frame has 50 rows (50 observations of cars)
# with two columns - speed and distance traveled at that speed
cars

# You can index a data frame with square brackets, just like arrays
# Except now, there are *two* positions, one for row and one for column
# You will separate these indices with a comma,:
# [row(s), column(s)]

# Pick out the element in the first row and first column
cars[1,1]
 
# You can also pick out multiple rows and columns
cars[c(5, 7, 10), 2]

# Leaving one of these indices blank (but keeping the comma) will take all of
# the rows/columns:
# e.g., this will keep all columns
cars[c(5, 7, 10),]

# You can also pick out an individual column with the dollar sign ($)
cars$speed
cars$dist
# note that when you pull out just one column, the result is a vector (1D)

# To pick out multiple columns, you'll want a vector of characters corresponding
# to the column names
cars[, c("dist", "speed")]
# Note that indexing is order-specific! So this flipped the order of the two
# columns.

# You can also index with variables, e.g., to pick out rows 47 through 49, you can do the following:
fast_cars = c(47, 48, 49) # (a shortcut of this is 47:49)
cars[fast_cars, ] # this will pick out rows 47 - 49 (keeping all columns)

# It is also possible to index with logical statements.
# Remembering that cars$speed < 15 is a logical statement,
# this will pick out the rows where the speed is less than 15
cars[cars$speed < 15,]

# You can do an exact match to 15 (i.e., get rows with speed of exactly 15) with
# == or %in%
# The two lines below should do the same thing.
cars[cars$speed == 15,]
cars[cars$speed %in% 15,]

# Negate this (in this case, cars where the speed is not 15) with an
# exaclamation mark (!)
# ! in front of a logical statement will turn TRUE to FALSE and vice versa
!c(TRUE, FALSE)

cars[cars$speed != 15,]
cars[!cars$speed %in% 15,]


##### Reading in data

# Directories: check your current working directory with
getwd()
# Note that this will return a character object (string) -
# all directories and file names are represented as strings

# Set you working directory with setwd()
# (NOTE - this will throw an error if you run it! - you should put in your own working directory...)
setwd('~/Documents/Teaching/workshops_etc/r_crdds_2023-05/') 
getwd()

# You can read in CSV files (comma separated value files) using read.csv(filename)
# (remembering to put the filename in quotes)
# e.g., if I set the working directory as above, and `wos` is the folder
# on my machine that houses these files, I can read them in like this:
climateArt1 = read.csv('wos/ClimateAndArt_01.csv')
# There are a slew of arguments to read.csv() you can use as needed, 
# e.g., to ignore the first several lines, or to not manually set the 
# column names if the column names are missing from the spreadsheet, etc.

# Some useful ways to explore the data:

# How many rows and columns?
dim(climateArt1)

# What are the columns?
names(climateArt1)
# (note that spaces in the CSV get converted into periods)

# Other useful functions, in general

# This will print the first six lines (you can add an argument in to print more)
head(climateArt1)

# This will tell us the type stored in each column
str(climateArt1)

# Let's look at one of the columns. If we simply run the name in the console, it
# will desplay the whole column.
climateArt1$Publication.Type
# we can see J for journal, C for conference proceeding.
# We can use unique() to look at just the unique elements of this column.
unique(climateArt1$Publication.Type)
# How frequently does each article type appear in this column?
# We can use the table() function for this:
table(climateArt1$Publication.Type)
# We can see the overwhelming majority of these are "J" (journal)

##### Missing data

# Data - especially data collected from online - will often have missing values.
# E.g., a CSV file or a spreadsheet may have a blank cell for missing values
# These will be read into R as NAs (for numeric columns) or in some cases (e.g.,
# character data) as the empty string, ""

# To illustrate this - let's look at the Publication Year column. If we try to
# take the minimum (to find the earliest publicaiton in our dataset), we get an
# NA:
min(climateArt1$Publication.Year)

# Some functions *can* get around this if they have an argument that lets you
# ignore the NAs, e.g.
min(climateArt1$Publication.Year, na.rm = TRUE)

# But still - there are many cases where we'll want to know where NAs are and
# how to get rid of them.
# A useful function for finding NAs is is.na()
# this will read in an object (including vectors) and return a TRUE in positions
# that are NA, and FALSE for elements that are not NA
is.na(climateArt1$Publication.Year)

# How many NAs are there? One way we could answer this is remember that 
# TRUEs get coded as 1s and FALSEs get coded as zeros. If we have a vector
# of TRUEs and FALSEs above, we can count the number of TRUEs 
# by simply taking the sum of the vector.
sum(is.na(climateArt1$Publication.Year))
# There are 13 NAs. But where are they?

# We can also use the function which() - which() reads in a vector of logicals
# and tells you which indices have TRUE.
which(is.na(climateArt1$Publication.Year))
# These are the positions in the vector of publication years that have NAs.
# Because we pulled this vector straight out of the data frame, we know that
# these are also the rows of the data frame which have NAs in that column.

# Remember that we can negate a logical vector by putting an exclamation mark in
# front of it.
# The following vector will have a TRUE in every position that is *not* NA in
# the publication year column:
!is.na(climateArt1$Publication.Year)

# Remembering from above that we can use logical vectors for indexing, we can subset the data frame to remove NAs as follows:
climateArt1.subs = climateArt1[!is.na(climateArt1$Publication.Year),]
# A check to make sure this worked:
sum(is.na(climateArt1.subs$Publication.Year))

##### Combining data frames together

# There's some complexity possibly involved in combining multiple data frames.
# In the simple case where all of the data frames have similar structure (in our
# case, all have the same column names), we can bind them together using
# rbind().
# rbind() will bind together the rows of different data frames - you can think
# of this as stacking them on top of each other.

# While there are simpler and more elegant ways of combining all of our data
# frames into one, here is a way we can read in and combine all of the data
# frames in one call to rbind:
climateArt = rbind(
  read.csv('wos/ClimateAndArt_01.csv'),
  read.csv('wos/ClimateAndArt_02.csv'),
  read.csv('wos/ClimateAndArt_03.csv'),
  read.csv('wos/ClimateAndArt_04.csv'),
  read.csv('wos/ClimateAndArt_05.csv'),
  read.csv('wos/ClimateAndArt_06.csv'),
  read.csv('wos/ClimateAndArt_07.csv'),
  read.csv('wos/ClimateAndArt_08.csv'),
  read.csv('wos/ClimateAndArt_09.csv'),
  read.csv('wos/ClimateAndArt_10.csv'),
  read.csv('wos/ClimateAndArt_11.csv'),
  read.csv('wos/ClimateAndArt_12.csv'),
  read.csv('wos/ClimateAndArt_13.csv')
)

nrow(climateArt)
# that's a lot of data!

##### Working in the tidyverse

# The tidyverse is a suite of packages that are useful for manipulating,
# analyzing, and visualizing data.
# Packages are bundles of R functions that other users write and make available
# for others to use. Functions and features of R that do not appear in any
# package are typically called "Base R"; all of the functions and features we
# have used so far are from Base R.

# We can install packages using the install.packages() function.
# You want to put the name of your package in quotes here.
# E.g., you can install the `nic` package (for "nature inspired 
# colors") with the following line:
# install.packages('nic')
# You only need to run this line once. Once the package is installed, it will
# remain accessible to R until you update your version of R.

# To access some of the features of various packages, we need to load in the
# package. We can do this with the library() command.

# Let's load in the following packages.
library(ggplot2)
library(dplyr)

# Now functions and other features from these packages are accessible to us.

##### Piping

# A useful feature of dplyr (that has since been adopted in base R!) is the
# pipe, which is denoted by the following characters: %>%
# Piping looks in practice like this:

# object %>% function()

# What is on the left hand side of the pipe (some object) gets placed into the
# function on the right hand side as the first argument in that function.
# This is nice because you can string together sequences like this:
# object %>% function1() %>% function2() %>% function3() %>% ...

# Some examples:
5 %>% sqrt() # same as sqrt(5)
mtcars$cyl %>% as.character() # same as as.character(mtcars$cyl)
mtcars$cyl %>% length() %>% sqrt()

# This final example is useful not just for demonstrating how you can string
# together multiple operations, but also how piping can make code readable. You
# can think of this as taking the vector, recording its length (which will
# return an integer), then taking the square root of that number.
# The following code does the same thing, but might be more difficult to read:
sqrt(length(mtcars$cyl))

# Piping works well in the tidyverse because the first argument in most/all
# tidyverse functions is data (often a data frame):
# For example, the function mutate() will add new columns (or over-write
# pre-existing columns):
mutate(cars, speed.sq = speed^2)
# you can use the pipe as follows:
cars %>% mutate(speed.sq = speed^2)

# (to actually save the new column you made, you'll want to assign your modified
# data frame to a variable name using = or <-)

# You can select a subset of columns using the select() function:
mtcars %>% select(mpg, wt, vs, am)
# the resulting data frame will have only these four columns

# One nice thing you may notice here is that within the tidyverse functions, you
# don't need to use quotes to call your columns - you can call columns without
# quotes as if they were variables!

# Here is an example that combines these two functions and the pipe:
mtcars %>%
  # make a new column with weight in kilograms
  mutate(wt.kg = wg * 907.185) %>%
  select(mpg, wt.kg)

# We can subset rows using logical statements with filter():
cars %>% filter(speed > 20)
mtcars %>% filter(am == 1)

# We can also rename columns using rename():
mtcars %>% rename(transmission = am, engine = vs)
# the old column names go on the right side of the =, new names we want to set
# go on the left of the =

# The functions here have done operations on the whole data frame, but we can
# actually use tidyverse/dplyr functions to do operations separately on
# different groups within the data frame!
# The group_by() function will let you group by unique elements of a column and
# perform operations separately on each group of elements that have the same
# value.
# For example, we have two different transmission types (am = 0 or 1) and two
# different engine shape (vs = 0 or 1) in the mtcars dataset, so we can
# calculate some summary statistics for each of the four possible
# transmission-engine combinations

mtcars %>%
  group_by(am, vs) %>%
  # The lines below will make three columns in your data frame
  summarise(
    mean.mpg = mean(mpg),
    sample.size = n(),
    standard.error = sd(mpg) / sample.size
  )

# A couple of things to note here:
# First is that you can use summarise() (and related functions like mutate()) to
# make multiple columns with one call to the function.
# Another neat thing is that you can declare a variable and then use that
# variable later in the call to the same function - see how we made a column
# `sample.size` and were able to use it to make another column in the next line.

##### Plots with ggplot

# Base R does have functions for making plots (e.g., plot(), hist())
# E.g.,
plot(x = cars$speed, y = cars$dist)
# same thing, but written slightly differently
plot(dist ~ speed, data = cars)
plot(dist ~ speed, data = cars, col = 'blue')


# But, while it is possible to customize these plots with additional 
# features, it can be involved and vary from function to function.

# ggplot2 is a library with a consistent set of rules and features
# that are very flexible and can make publication-quality figures

# All ggplots start with a call to the ggplot() function.
# As with much of the rest of the tidyverse, the first argument is data
# (i.e., the data frame that you want to generate the plot from)

# Both of these will work:
ggplot(data = climateArt)
climateArt %>% ggplot()

# As you will notice from running these, this won't actually plot your data though!
# Most of the features of your plot that you are interested are 
# "geometric" features, e.g., lines, points, shapes
# Functions to make these features will start with geom_, e.g.,
# geom_point(), geom_line(), geom_tile()

# These functions use the function aes() - short for "aesthetics"
# The rule of thumb for when things go into aes() is: use aes() for any features
# *that you want to come from a column in your data frame*.
# E.g., if you want the x and y coordinates of points on a plot to come from a
# data frame, you'll set those in aes().

ggplot(data = climateArt) + # add features to a ggplot with +
  geom_point(aes(x = Number.of.Pages, y = Cited.Reference.Count))
# Very nice!

# We can use the colour aesthetic to put different colored points corresponding
# to different article types.

ggplot(data = climateArt) +
  geom_point(
    aes(x = Number.of.Pages, y = Cited.Reference.Count, colour = Publication.Type)
  )
# Note that colour is still inside aes() because 
# it's using a column from the climateArt data frame!

# These plots are good, but the points overlap a lot, possibly obscuring trends.
# We can maybe highlight trends by modifying the point transparency with alpha
# an alpha of 0 is totally transparent and an alpha of 1 is totally opaque

# Let's make all of our points the same transparent - alpha of 0.1
# This transparency value will *not* come from a column in our data frame!
# We want it to apply the same value to all of our points.
# We can do this by setting alpha *outside* of aes, but still within geom_point()

ggplot(data = climateArt) +
  geom_point(
    aes(x = Number.of.Pages, y = Cited.Reference.Count, colour = Publication.Type),
    alpha = 0.1 # note - outside of aes(), because it's not using the data frame
  )
# The darker areas correspond to where there's a higher density of points.

# Finally, if we wanted to break this out according to year, we can do that
# with facet_wrap(), which will make separate subplots or 
# each distinct value of a variable.

ggplot(data = climateArt) +
  geom_point(
    aes(x = Number.of.Pages, y = Cited.Reference.Count, colour = Publication.Type)
  ) +
  facet_wrap(~ Publication.Year)

# There are a ton of other modifications we can make to our plots as well to 
# improve readability or clarity. You can read about these on the ggplot website:
# https://ggplot2.tidyverse.org/

# You can read about other tidyverse functions in general at this address:
# https://www.tidyverse.org/


