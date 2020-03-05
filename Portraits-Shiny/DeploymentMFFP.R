require(shiny)
folder_address = 'C:\Users\lopma1\Documents\GitHub\PortraitsClimMFFP\Portraits-Shiny'

x <- system("ipconfig", intern=TRUE)
z <- x[grep("IPv4", x)]
ip <- gsub(".*? ([[:digit:]])", "\\1", z)
print(paste0("the Shiny Web application runs on: http://", ip, ":80/"))

runApp(folder_address, launch.browser=FALSE, port = 80, host = ip)