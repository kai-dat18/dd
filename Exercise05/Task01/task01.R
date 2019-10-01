library(jsonlite)
?toJSON


# pretty ------------------------------------------------------------------

toJSON(mtcars)
toJSON(mtcars, pretty=TRUE)


# dataframe ---------------------------------------------------------------

toJSON(mtcars, dataframe="values", pretty=TRUE)
toJSON(mtcars, dataframe="columns", pretty=TRUE)
toJSON(mtcars, dataframe="rows", pretty=TRUE)


# POSIXt ------------------------------------------------------------------

toJSON(Sys.time(), pretty=TRUE, POSIXt = "string")
toJSON(Sys.time(), pretty=TRUE, POSIXt = "ISO8601")
toJSON(Sys.time(), pretty=TRUE, POSIXt = "epoch")
toJSON(Sys.time(), pretty=TRUE, POSIXt = "mongo")


# factor ------------------------------------------------------------------

str(mtcars)
mc <- mtcars
mc$gear <- as.factor(mc$gear)
str(mc)
toJSON(mc, pretty=TRUE, factor="string")
toJSON(mc, pretty=TRUE, factor="integer")


# auto_unbox --------------------------------------------------------------

toJSON(list("abc"), pretty=TRUE)
toJSON(list("abc"), pretty=TRUE, auto_unbox = TRUE)
toJSON(list("1", "2"), pretty=TRUE)
toJSON(list("1", "2"), pretty=TRUE, auto_unbox = TRUE)



# na ----------------------------------------------------------------------

toJSON(list("abc", NA), pretty=TRUE)
toJSON(list("abc", NA), pretty=TRUE, na="string")
