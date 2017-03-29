# Get original data set
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Get subset for date range
date_subset <- power_consumption[power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]

#Convert Date/Time to Date/Time classes and save in one variable
sub_date_time <- strptime(paste(date_subset$Date, date_subset$Time),  "%d/%m/%Y %H:%M:%S")

#Plot 4
par(mfrow = c(2, 2))

#upper left plot
plot(sub_date_time, date_subset$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n" )
lines(sub_date_time, date_subset$Global_active_power)

#upper right plot
plot(sub_date_time, date_subset$Voltage, xlab = "datetime", ylab = "Voltage", type = "n" )
lines(sub_date_time, date_subset$Voltage)	

#lower left plot
plot(sub_date_time, date_subset$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(sub_date_time, date_subset$Sub_metering_1, col = "black")
lines(sub_date_time, date_subset$Sub_metering_2, col = "red")
lines(sub_date_time, date_subset$Sub_metering_3, col = "blue")
legend ("topright", col = c("Black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", cex=0.8,lwd=1)

#lower right plot
plot(sub_date_time, date_subset$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n" )
lines(sub_date_time, date_subset$Global_reactive_power)

# create the plot as PNG file
dev.copy(png, file = "plot4.png")

# close png device
dev.off()