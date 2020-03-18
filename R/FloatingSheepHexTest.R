# # install.packages("sp")
# # install.packages("data.table")
library(sp)
library(data.table)
csvv = "C:/Users/acc-s/Documents/School/_UTK_Masters/_Thesis/scratch/playerspointstotable.csv"
tweets <- read.csv(csvv, colClasses=c("Lat"="numeric", "Lon"="numeric"))
coordinates(tweets) <- c("Lon", "Lat")
proj4string(tweets) <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"
hex <- HexPoints2SpatialPolygons(spsample(tweets, n=3000, "hexagonal"))

tweets$hex <- over(tweets, hex)["id"]#$id

tweets.dt <- as.data.table(tweets)#data.table(tweets)
#BEGIN INSERT#
u_id = tweets["OID"]
#END INSERT#
tweets.dt[,sample(.I, if(.N > 5) 5 else .N), by=list(u_id, hex)]#u_id, hex)]

tweets.dt[,tweets=.N, by=list(hex)]
sh