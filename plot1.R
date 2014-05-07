# read in data:
system.time(df <- read.table("household_power_consumption.txt",
                             colClasses=c("character","character",rep("numeric",7)),
                             header=T,
                             sep=";",na.strings="?",
                             comment.char=""))

df$AsDate <- as.Date(df$Date, format="%d/%m/%Y")
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
df <- df[(df$AsDate >= startDate) & (df$AsDate <= endDate),] # filter to 2007-02-01 and 2007-02-02

# make plot as png
png(filename="plot1.png")
hist(df$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     ylab="Frequency", main="Global Active Power")
dev.off()

## Unsuccessful and annoying way of reading in data
## (trying not to read in lines with unneeded dates):
# 
# m <- matrix(nrow=0, ncol=9)
# 
# con <- file("household_power_consumption.txt", open="r")
# readLines(con, 1)
# 
# startDate <- as.Date("2007-02-01")
# endDate <- as.Date("2007-02-02")
# 
# i <- 1
# while (length(oneLine <- readLines(con, n=1, warn=F)) > 0) {
#   fields <- strsplit(oneLine, ";")[[1]]
#   date <- as.Date(fields[1], format="%d/%m/%Y")
#   if (date >= startDate & date <= endDate)
#     m <- rbind(m, fields)
#   if (i %% 50000 == 0) print(i)
#   i <- i + 1
# }
# close(con)
# 
# df <- as.data.frame(m, stringsAsFactors=F)
# m <- matrix(nrow=0, ncol=9)
# 
# con <- file("household_power_consumption.txt", open="r")
# readLines(con, 1)
# 
# startDate <- as.Date("2007-02-01")
# endDate <- as.Date("2007-02-02")
# 
# i <- 1
# while (length(oneLine <- readLines(con, n=1, warn=F)) > 0) {
#   fields <- strsplit(oneLine, ";")[[1]]
#   date <- as.Date(fields[1], format="%d/%m/%Y")
#   if (date >= startDate & date <= endDate)
#     m <- rbind(m, fields)
#   if (i %% 50000 == 0) print(i)
#   i <- i + 1
# }
# close(con)
# 
# df <- as.data.frame(m, stringsAsFactors=F)
