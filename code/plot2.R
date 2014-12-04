## Plot 2

## Read the data, convert to Dates, and filter on the applicable days
data <- read.csv("household_power_consumption.txt", colClasses = "character", nrows = 100000, sep = ";")
data[,1] <- dmy(data[,1])
d <- data %>% filter(Date > ymd(20070131) & Date < ymd(20070203))

## Combine date and time 
x <- ymd_hms(paste(d[,1], d[,2]))

## constrain 'Global_active_power' to be numeric
d[,3] <- as.numeric(d[,3])

## Open png, create plot, and close png
png("plots/plot2.png", width = 480, height = 480)
plot(x, d[,3], ylab = "Global Active Power (kilowatts)", xlab = "", col = "black", type = "l", pch = ".")
dev.off()
