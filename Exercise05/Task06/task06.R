
library(httr)
library(jsonlite)

cookie <- "0b11ddcd9261cd4b78b9422e8b4258ad"

r <- GET("https://gitlab.com/api/v4/users/kbergmann/projects",set_cookies("_gitlab_session" = cookie))
r
toJSON(content(r), pretty=TRUE)


