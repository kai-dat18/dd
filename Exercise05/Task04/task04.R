
library(httr)

token <- "g5iXbRzmtJ-6_mvfnZpL"

r <- GET("https://gitlab.com/api/v4/users/kbergmann/projects?private_token=g5iXbRzmtJ-6_mvfnZpL",)
r
content(r)

r <- GET("https://gitlab.com/api/v4/users/kbergmann/projects",
         add_headers("Private-Token" = "g5iXbRzmtJ-6_mvfnZpL"))
r
content(r)
