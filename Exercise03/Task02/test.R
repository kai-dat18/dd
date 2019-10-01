library(officer)
library(tidyverse)
library(flextable)




iris

flextable(iris)

flextable(head(iris),
          col_keys = c("Sepal.Length", "Sepal.Width"))

tbl <-
  flextable(head(iris),
            col_keys = c("Sepal.Length", "col1", "Sepal.Width"))

tbl <- theme_tron_legacy(tbl)
tbl %>% 
  empty_blanks()

head(mtcars)
flextable(head(mtcars)) %>% 
  merge_v(j = ~ cyl + am) %>% 
  fix_border_issues() %>% 
  merge_at(i = 1:3, j = 3:4)


flextable(head(mtcars)) %>% 
  color(i = 1:2, j = 4, "red") %>% 
  color(i = ~disp > 200, j = ~disp, "green") %>% 
  bg(i = ~wt > 3, j = ~mpg, "blue")

flextable(head(mtcars),
          col_keys = c("mpg", "cyl", "disp")) %>% 
  add_header(mpg = "A", cyl = "B", disp = "C") %>% 
  add_header_lines("Hier steht text")


# complex header ----------------------------------------------------------
complex_header <-
  data.frame(
    col_keys = c( "Sepal.Length", 
                  "Sepal.Width", "Petal.Length",
                  "Petal.Width", "Species" ),
    type = c("double", "double", "double", 
             "double", "factor"),
    what = c("Sepal", "Sepal", "Petal", 
             "Petal", "Species"),
    measure = c("Length", "Width", "Length", 
                "Width", "Species"),
    stringsAsFactors = FALSE )

flextable(iris) %>% 
  set_header_df(complex_header, key = "col_keys") %>% 
  merge_v(part = "header") %>% 
  merge_h(part = "header") %>% 
  theme_tron()


# gruppierte daten --------------------------------------------------------

## für gruppierte daten: as_grouped_data() + as_flextable()
##statt flextable()!
mtcars %>% 
  arrange(cyl) %>% 
  group_by(cyl) %>% 
  as_grouped_data(groups = "cyl") %>% 
  as_flextable() %>% 
  bold(i = ~ !is.na(cyl), j = 1)#


# complex content ---------------------------------------------------------

flextable(mtcars) %>% 
  flextable::compose(i = 1:nrow(mtcars), j = ~disp,
          value = as_paragraph(
            minibar(disp),
            as_chunk(as.character(disp))
          )) %>% 
  autofit()

flextable(mtcars) %>% 
  flextable::compose(i = 1, j = 2,
          value = as_paragraph(
            as_chunk("1")
          )) %>% 
  autofit()


pres <-
  read_pptx() %>% 
  add_slide(master = "Office Theme",
            layout = "Title and Content") %>% 
  ph_with_flextable(flextable(mtcars) %>% 
                      compose(i = 1:nrow(mtcars), j = ~disp,
                              value = as_paragraph(
                                minibar(disp),
                                as_chunk(as.character(disp))
                              )) %>% 
                      autofit())

