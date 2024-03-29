# Plot 2

# Reading in the file
power_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Subsets data for specified dates 
power <- subset(power_data, Date %in% c("1/2/2007","2/2/2007"))

#Data column changed to Date Type
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(power$Date), power$Time)

power$Datetime <- as.POSIXct(datetime)

# Graph construction
with(power, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

# Printing to PNG file
dev.copy(png, file="plot2.png", height=480, width=480)

# Ends printing operation
dev.off()
