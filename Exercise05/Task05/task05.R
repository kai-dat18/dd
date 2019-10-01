
library(httr)

myapp <- oauth_app("dd_task05",
                   key = "4970b033ed1be34ea8bba8cb5a2c92a07682a9b9330279fccc9d8b73379c9036",
                   secret = "af8765654b2d60c21e9a2617b694d7057eecbdd5e68fdab2f463a38b08de4d45")

gitlab_endpoint <- oauth_endpoint(base_url = "https://gitlab.com",
                                  access = "oauth/token",
                                  authorize = "oauth/authorize")

gitlab_token <- oauth2.0_token(gitlab_endpoint, myapp)

r <- GET("https://gitlab.com/api/v4/users/kbergmann/projects",
          config(token = gitlab_token))
content(r)
?oauth_endpoint
