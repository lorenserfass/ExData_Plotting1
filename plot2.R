# read in data:
system.time(df <- read.table("household_power_consumption.txt",
                             colClasses=c("character","character",rep("numeric",7)),
                             header=T,
                             sep=";",na.strings="?",
                             comment.char=""))

# make a true date-time column (POSIXlt format)
df$posix <- strptime(paste(df$Date, df$Time), tz="", format="%d/%m/%Y %H:%M:%S")

startDate <- as.POSIXlt("2007-02-01")
endDate <- as.POSIXlt("2007-02-03")

# filter data to the two requested days
df <- df[(df$posix >= startDate) & (df$posix < endDate),]

# make line plot of df$Global_active_power
png(filename="plot2.png")
plot(df$posix,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
