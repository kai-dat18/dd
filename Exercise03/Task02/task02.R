library(openxlsx)


wb <- createWorkbook()
addWorksheet(wb, "setosa")

writeData(wb, sheet = 1, startCol = 1, startRow = 1,
          "setosa")
mergeCells(wb, sheet = 1, cols = 1:5, rows = 1)

topstyle <- createStyle(fontSize = 22, fontName = "Calibri",
                        halign = "center", fgFill = "#00ff00", fontColour = "red", border= "TopBottomLeftRight")
addStyle(wb, sheet = 1, rows = 1, cols = 1,
         style = topstyle)
headerStyle <- createStyle(fontSize = 11, fontName = "Calibri",
                          halign = "left", fgFill = "black", fontColour = "white", border= "TopBottomLeftRight", textDecoration = "bold")
writeDataTable(wb, sheet = 1, iris[iris$Species == "setosa",], startRow=2, headerStyle = headerStyle, tableStyle = "TableStyleMedium1")


addWorksheet(wb, "versicolor")
writeData(wb, sheet = 2, startCol = 1, startRow = 1,
          "versicolor")
mergeCells(wb, sheet = 2, cols = 1:5, rows = 1)

#style <- createStyle(fontSize = 22, fontName = "Calibri",
#                     textDecoration = "bold", halign = "left", fgFill = "#ff0000", border= "TopBottomLeftRight")
addStyle(wb, sheet = 2, rows = 1, cols = 1,
         style = topstyle)
writeDataTable(wb, sheet = 2, iris[iris$Species == "versicolor",], startRow=2, headerStyle = headerStyle, tableStyle = "TableStyleMedium1")


addWorksheet(wb, "virginica")
writeData(wb, sheet = 3, startCol = 1, startRow = 1,
          "virginica")
mergeCells(wb, sheet = 3, cols = 1:5, rows = 1)

#style <- createStyle(fontSize = 22, fontName = "Calibri",
#                     textDecoration = "bold", halign = "left", fgFill = "#ff0000", border= "TopBottomLeftRight")
addStyle(wb, sheet = 3, rows = 1, cols = 1,
         style = topstyle)
writeDataTable(wb, sheet = 3, iris[iris$Species == "virginica",], startRow=2, headerStyle = headerStyle, tableStyle = "TableStyleMedium1")

saveWorkbook(wb, "my_iris.xlsx")
