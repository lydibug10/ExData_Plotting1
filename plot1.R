# Load data
dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")

# Cull dataset to 2/1/2007-2/2/2007
extracted_dataset <- dataset[dataset$Date=="1/2/2007" | dataset$Date=="2/2/2007", ]

# Build the plot
hist(extracted_dataset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

# Export
dev.copy(png, width=480, height=480, filename="plot1.png")
dev.off()
