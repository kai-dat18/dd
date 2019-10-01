src <- list.files('/src')
src <- paste('/src', src, sep="")
file.copy(src, '/dest')

