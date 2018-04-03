# Load data
dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")

# Cull dataset to 2/1/2007-2/2/2007
extracted_dataset <- dataset[dataset$Date=="1/2/2007" | dataset$Date=="2/2/2007", ]

# Build the plot
extracted_dataset$Date <- as.Date(extracted_dataset$Date, format="%d/%m/%Y")
extracted_dataset$format_datetime <- as.POSIXct(strptime(
  paste(extracted_dataset$Date, extracted_dataset$Time, sep = " "),
  format = "%Y-%m-%d %H:%M:%S"))
plot(extracted_dataset$Global_active_power~extracted_dataset$format_datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Export
dev.copy(png, width=480, height=480, filename="plot2.png")
dev.off()
