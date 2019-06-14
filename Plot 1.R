# Plot 1

# Reading in the file
power_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Subsets data for specified dates 
power <- subset(power_data, Date %in% c("1/2/2007","2/2/2007")) #Data from 2007-02-01 and 2007-02-02

# Data column changed to Date Type
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# Histogram construction
hist(power$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Printing to PNG file
dev.copy(png, file="plot1.png", height=480, width=480) #PNG (width of 480 pixels & height of 480)

# Ends printing operation
dev.off()

