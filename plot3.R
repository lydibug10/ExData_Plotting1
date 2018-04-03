# Load data
dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")

# Cull dataset to 2/1/2007-2/2/2007
extracted_dataset <- dataset[dataset$Date=="1/2/2007" | dataset$Date=="2/2/2007", ]

# Build the plot
extracted_dataset$Date <- as.Date(extracted_dataset$Date, format="%d/%m/%Y")
extracted_dataset$format_datetime <- as.POSIXct(strptime(
  paste(extracted_dataset$Date, extracted_dataset$Time, sep = " "),
  format = "%Y-%m-%d %H:%M:%S"))
with(extracted_dataset,
     {
       plot(Sub_metering_1~format_datetime, type="l", xlab="", ylab="Energy sub metering")
       lines(Sub_metering_2~format_datetime, col="red")
       lines(Sub_metering_3~format_datetime, col="blue")
     })
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1)

# Export
dev.copy(png, width=480, height=480, filename="plot3.png")
dev.off()
