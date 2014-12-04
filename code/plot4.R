## Plot 2

## Read the data, convert to Dates, and filter on the applicable days
data <- read.csv("household_power_consumption.txt", colClasses = "character", nrows = 100000, sep = ";")
data[,1] <- dmy(data[,1])
d <- data %>% filter(Date > ymd(20070131) & Date < ymd(20070203))

## Combine date and time 
x <- ymd_hms(paste(d[,1], d[,2]))


## constrain 'Global_active_power' to be numeric, Plot 1
d[,3] <- as.numeric(d[,3])

## constrain 'Voltage' to be numeric, Plot 2
d[,5] <- as.numeric(d[,5])

## constrain 'Sub_metering_1', 'Sub_metering_2', and 'Sub_metering_3' to be numeric, Plot 3
d[,7] <- as.numeric(d[,7])
d[,8] <- as.numeric(d[,8])
d[,9] <- as.numeric(d[,9])

## constrain 'Global_reactive_power' to be numeric, Plot 4
d[,4] <- as.numeric(d[,4])


## Open png, create plot, and close png
png("plots/plot4.png", width = 480, height = 480)

## Fix the margins
par(mfrow=c(2,2), mar = c(4,2,2,2))

## Plot 1
plot(x, d[,3], ylab = "Global Active Power (kilowatts)", xlab = "", col = "black", type = "l", pch = ".")

## Plot 2
plot(x, d[,5], ylab = "Voltage", xlab = "datetime", col = "black", type = "l", pch = ".")

## Plot 3
plot(x, d[,7], ylab = "Energy sub metering", xlab = "", col = "black", type = "l", pch = ".")
lines(x, d[,8], col = "red")
lines(x, d[,9], col = "blue")
legend("topright", lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n", col = c("black", "red", "blue"), cex = 0.65)

## Plot 4
plot(x, d[,4], ylab = "Voltage", xlab = "datetime", col = "black", type = "l", pch = ".")

dev.off()
