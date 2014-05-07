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

# make plot
# par(mfcol=c(2,2), mar=c(4,4,1,1))
png(filename="plot4.png")
par(mfcol=c(2,2))

# Make top-left plot
plot(df$posix,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Make bottom-left plot
plot(df$posix, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$posix, df$Sub_metering_2, col="red")
lines(df$posix, df$Sub_metering_3, col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=c(1,1,1),
       col=c("black", "red", "blue"),
       bty="n")

# Make top-right plot
plot(df$posix, df$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Make bottom-right plot
plot(df$posix, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()