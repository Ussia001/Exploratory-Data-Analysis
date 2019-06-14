# Plot 3

# Reading in the file
power_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Subsets data for specified dates
power <- subset(power_data, Date %in% c("1/2/2007","2/2/2007"))
power$Date <- as.Date(power$Date, format="%d/%m/%Y")


#Data column changed to Date Type
datetime <- paste(as.Date(power$Date), power$Time)
power$Datetime <- as.POSIXct(datetime)

# Graph construction
with(power, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Printing to PNG file
dev.copy(png, file="plot3.png", height=480, width=480)

# Ends printing operation
dev.off()
