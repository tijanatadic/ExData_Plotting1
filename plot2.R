#Plot 2
#Read subset of the data, only for dates 1/2/2007 and 1/2/2007

fileName<-"./C4/household_power_consumption.txt"
data<-read.table(fileName, na.strings=c("?", "NA"), sep=";", skip=grep("1/2/2007", readLines(fileName, ok=TRUE)), nrow=2879)
data<-na.omit(data)

#assign coumn names for data frame
names<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colnames(data)<-names


day<-strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("./C4/plot2.png",  width=480, height=480)
plot(day, data$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

