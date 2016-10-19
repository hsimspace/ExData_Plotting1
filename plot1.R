# Exploratory Data Analysis
# Peer Review Project 1: Plot 1
# Harold Simeon 

#************************************************************************
# Read data from the text file 
consumption_data <- read.table("household_power_consumption.txt", sep = ";", header = T)

# Create a new column with date and time 
consumption_data$Date <- as.Date(consumption_data$Date, format = "%d/%m/%Y")

consumption_data$datetime <- strptime(paste(consumption_data$Date, consumption_data$Time), "%Y-%m-%d %H:%M:%S")

# Convert the columns from text to numeric 
final_data <- subset(consumption_data, (Date >= "2001-02-01" & Date <= "2001-02-02"))

# Creating the final data variable 
final_data <- subset(consumption_data, (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting data from text to numeric
final_data$Global_active_power <- as.numeric(as.character(final_data$Global_active_power))

# Creating plot1
hist(final_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Creating the graph file 
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
