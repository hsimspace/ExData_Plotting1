# Exploratory Data Analysis
# Peer Review Project 1: Plot 4
# Harold Simeon 

#************************************************************************
# Delete any previous local variables
rm(list = ls())

# Read data from the text file 
consumption_data <- read.table("household_power_consumption.txt", sep = ";", header = T)

# Create a new column with date and time 
consumption_data$Date <- as.Date(consumption_data$Date, format = "%d/%m/%Y")

consumption_data$datetime <- strptime(paste(consumption_data$Date, consumption_data$Time), "%Y-%m-%d %H:%M:%S")

consumption_data$datetime <- as.POSIXct(consumption_data$datetime)

# Convert the columns from text to numeric 
final_data <- subset(consumption_data, (Date >= "2001-02-01" & Date <= "2001-02-02"))

# Creating the final data variable 
final_data <- subset(consumption_data, (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting data from text to numeric
final_data$Global_active_power <- as.numeric(as.character(final_data$Global_active_power))
final_data$Sub_metering_1 <- as.numeric(as.character(final_data$Sub_metering_1))
final_data$Sub_metering_2 <- as.numeric(as.character(final_data$Sub_metering_2))
final_data$Sub_metering_3 <- as.numeric(as.character(final_data$Sub_metering_3))
final_data$Global_reactive_power <- as.numeric(as.character(final_data$Global_reactive_power))
final_data$Global_intensity <- as.numeric(as.character(final_data$Global_intensity))
final_data$Voltage <- as.numeric(as.character(final_data$Voltage))


# Create plot 4
png("plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

with(final_data, plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

with(final_data, plot(Voltage ~ datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

yrange <- range(c(final_data$Sub_metering_1, final_data$Sub_metering_2, final_data$Sub_metering_3))

with(final_data, plot(Sub_metering_1 ~ datetime, ylim = yrange, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

lines(final_data$Sub_metering_2 ~ final_data$datetime, type = "l", col = "red")

lines(final_data$Sub_metering_3 ~ final_data$datetime, type = "l", col = "blue")

legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1))

with(final_data, plot(Global_reactive_power ~ datetime, type = "l", ylab = "Global_reactive_power (kilowatts)", xlab = ""))

dev.off()


