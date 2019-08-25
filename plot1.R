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

png("plot1.png", width=480, height=480)
hist(as.numeric(data1$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
