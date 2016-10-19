# Exploratory Data Analysis
# Peer Review Project 1: Plot 2
# Harold Simeon 

#************************************************************************
# Delete any previous local variables
rm(list = ls())

# Read data from the text file 
consumption_data <- read.table("household_power_consumption.txt", sep = ";", header = T)

# Convert Date column to Date object 
consumption_data$Date <- as.Date(consumption_data$Date, format = "%d/%m/%Y")

consumption_data$datetime <- strptime(paste(consumption_data$Date, consumption_data$Time), "%Y-%m-%d %H:%M:%S")

consumption_data$datetime <- as.POSIXct(consumption_data$datetime)

# Createing the final data varialbe 
final_data <- subset(consumption_data, (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting data from text to numeric
final_data$Sub_metering_1 <- as.numeric(as.character(final_data$Sub_metering_1))
final_data$Sub_metering_2 <- as.numeric(as.character(final_data$Sub_metering_2))
final_data$Sub_metering_3 <- as.numeric(as.character(final_data$Sub_metering_3))

# Create plot 3
yrange <- range(c(final_data$Sub_metering_1, final_data$Sub_metering_2, final_data$Sub_metering_3))

with(final_data, plot(Sub_metering_1 ~ datetime, ylim = yrange, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

lines(final_data$Sub_metering_2 ~ final_data$datetime, type = "l", col = "red")

lines(final_data$Sub_metering_3 ~ final_data$datetime, type = "l", col = "blue")

legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1))

# Creating the graph file 
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
