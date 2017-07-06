#Plot 1
#Read subset of the data, only for dates 1/2/2007 and 1/2/2007

fileName<-"./C4/household_power_consumption.txt"
data<-read.table(fileName, sep=";", skip=grep("1/2/2007", readLines(fileName, ok=TRUE)), nrow=2879)

#assign coumn names for data frame
names<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colnames(data)<-names


#create histogram
png("./C4/plot1.png",  width=480, height=480)
hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()