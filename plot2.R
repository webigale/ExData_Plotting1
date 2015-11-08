##Unzip the Electric power consumption dataset
##from the UC Irvine Machine Learning Repository.
unzip("exdata-data-household_power_consumption.zip")

##Read the dataset into R.
hpc <- read.table("household_power_consumption.txt", sep = ";",
                    na.strings = "?", header = TRUE, colClasses =
                    c("character", "character", "numeric",
                      "numeric", "numeric", "numeric",
                      "numeric", "numeric", "numeric"))

##Convert the Date column to Date format.
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

##Subset out only the required 2 days of data.
hpcdt <- subset(hpc, Date %in% as.Date(c('2007-02-01', '2007-02-02')))

##Add a datetime field that concatenates the Date & Time fields.
hpcdt$datetime <- as.POSIXct(paste(hpcdt$Date, hpcdt$Time),
                             format="%Y-%m-%d %H:%M:%S")

##Create a histogram of Global Active Power (kilowatts) by Frequency
##and output to a png file.
png(file = "plot2.png", height = 480, width = 480, bg = "white")
with(hpcdt, plot(datetime, Global_active_power, xlab = "",
                 ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()
