#Plot 4
#Read subset of the data, only for dates 1/2/2007 and 1/2/2007

fileName<-"./C4/household_power_consumption.txt"
data<-read.table(fileName, na.strings=c("?", "NA"), sep=";", skip=grep("1/2/2007", readLines(fileName, ok=TRUE)), nrow=2879)
data<-na.omit(data)

#assign coumn names for data frame
names<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colnames(data)<-names

#convert date/time
day<-strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("./C4/plot4.png",  width=480, height=480)

#set the parameters; we want to have two rows with two plots in each row
par(mfrow=c(2,2), mar=c(5,4,2,1))

plot(day, data$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

plot(day, data$Voltage, type = "l", xlab="datetime", ylab="Voltage")

plot(day, data$Sub_metering_1, type = "l", xlab="", ylab="Energy submetering")
lines(day, data$Sub_metering_2, type = "l", col = "red")
lines(day, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1:2, cex=0.8)

plot(day, data$Global_reactive_power, type = "l", xlab="datetime", ylab = "Global_reactive_power")

dev.off()
