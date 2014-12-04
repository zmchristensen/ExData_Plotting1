## Plot 2

## Read the data, convert to Dates, and filter on the applicable days
data <- read.csv("household_power_consumption.txt", colClasses = "character", nrows = 100000, sep = ";")
data[,1] <- dmy(data[,1])
d <- data %>% filter(Date > ymd(20070131) & Date < ymd(20070203))

## Combine date and time 
x <- ymd_hms(paste(d[,1], d[,2]))

## constrain 'Sub_metering_1', 'Sub_metering_2', and 'Sub_metering_3' to be numeric
d[,7] <- as.numeric(d[,7])
d[,8] <- as.numeric(d[,8])
d[,9] <- as.numeric(d[,9])

## Open png, create plot, and close png
png("plots/plot3.png", width = 480, height = 480)
plot(x, d[,7], ylab = "Energy sub metering", xlab = "", col = "black", type = "l", pch = ".")
lines(x, d[,8], col = "red")
lines(x, d[,9], col = "blue")
legend("topright", lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
dev.off()
