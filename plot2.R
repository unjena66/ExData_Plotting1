# loading the data
elec <- read.csv("household_power_consumption.txt", header = T, stringsAsFactors = F, sep = ";")

# paste the date and time
elec$DateTime<-paste(elec$Date, elec$Time)
elec_paste<-elec[,-c(1,2)]

# then convert the datetime with strptime() function.
elec_paste$DateTime <- strptime(elec_paste$DateTime, "%d/%m/%Y %H:%M:%S")

# using data from the dates 2007-02-01 and 2007-02-02
electric <- elec_paste[format(elec_paste$DateTime, "%Y-%m-%d") %in% c('2007-02-01', '2007-02-02'),]

# convert data type of global active power
electric$Global_active_power <- as.numeric(electric$Global_active_power)

# create PNG
png("plot2.png", width = 480, height = 480)

# create plot
with(electric, plot(DateTime,Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)'))

# off
dev.off()