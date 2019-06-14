library(XML)
library(dplyr)
library(plyr)
ituneslib <- readKeyValueDB("iTunes Music Library.xml")
tracksxml <- ituneslib$Tracks
tracksxml1 <- lapply(tracksxml, data.frame)
tracks <- ldply(tracksxml1)
extracted <- data.frame(tracks$Artist,tracks$Genre,tracks$Name,tracks$Play.Count)
songs <- subset(extracted, tracks.Genre!="Podcast"& tracks.Genre!="northkoreabestkorea" & tracks.Genre!="Teckno Reeemix!"&tracks.Genre!="Polka"&tracks.Genre!="Holiday"&tracks.Genre!="Comedy" )
songs$tracks.Genre[songs$tracks.Genre == "Hip-Hop"] <- "Hip-Hop/Rap"
songs$tracks.Genre[songs$tracks.Genre == "Hip Hop/Rap"] <- "Hip-Hop/Rap"
songs <- subset(songs, tracks.Genre!="Country")
print(summary(songs$tracks.Genre)) # 17 genres
levels(songs$tracks.Genre)
mycolors = c('red','yellow','blue','green','orange','violet','cadetblue1', 'darkgoldenrod1', 'darkgreen', 'darkmagenta', 'midnightblue', 'lightsalmon1', 'ivory4', 'hotpink', 'lavender', 'darkturquoise', 'aquamarine2')
songplot <- with(songs,plot(songs$tracks.Genre, songs$tracks.Play.Count))


                