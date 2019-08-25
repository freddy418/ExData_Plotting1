if (!file.exists("household_power_consumption.txt")) {
  filename <- "household_power_consumption.zip"
  if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL, filename, method="curl")
  }
  unzip(filename) 
}

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(datetime, data1$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(datetime, data1$Sub_metering_2, type="l", col="red")
lines(datetime, data1$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
