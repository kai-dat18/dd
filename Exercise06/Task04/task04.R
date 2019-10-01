library(tidyverse)
library(rvest)


s <- html_session("https://gitlab.com/users/sign_in")

login_form <- 
  (s %>% 
     html_form())[[1]]

pwd <- rstudioapi::askForPassword()

login_form <-
  login_form %>% 
  set_values("user[login]" = "kai.bergmann.goo@gmail.com",
             "user[password]" = pwd)
s <- submit_form(s, login_form)

projects <- read_html(s) %>% 
  html_nodes(".project-name") %>% 
  html_text()

projects
