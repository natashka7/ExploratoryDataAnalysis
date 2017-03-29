# Get original data set
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Get subset for date range
date_subset <- power_consumption[power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]

#Convert Date/Time to Date/Time classes and save in one variable
sub_date_time <- strptime(paste(date_subset$Date, date_subset$Time),  "%d/%m/%Y %H:%M:%S")

#Plot 2
plot(sub_date_time, date_subset$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n" )

lines(sub_date_time, date_subset$Global_active_power)

# create the plot as PNG file
dev.copy(png, file = "plot2.png")

# close png device
dev.off()