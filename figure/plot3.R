# Load data File
household_power_consumption <- read.csv("C:/programming/r Course Lab 1/household_power_consumption.txt", sep=";")
# convert the Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() functions.
household_power_consumption$DateTime = strptime(paste(household_power_consumption$Date,household_power_consumption$Time),"%d/%m/%Y %H:%M:%S")
household_power_consumption$Date <- as.Date(as.character(household_power_consumption$Date),format = "%d/%m/%Y")

# Convert to Numeric
household_power_consumption$Global_active_power<-as.numeric(household_power_consumption$Global_active_power)
household_power_consumption$Global_reactive_power<-as.numeric(household_power_consumption$Global_reactive_power)
household_power_consumption$Voltage <-as.numeric(household_power_consumption$Voltage)
household_power_consumption$Global_intensity<-as.numeric(household_power_consumption$Global_intensity)
household_power_consumption$Sub_metering_1<-as.numeric(household_power_consumption$Sub_metering_1)
household_power_consumption$Sub_metering_2<-as.numeric(household_power_consumption$Sub_metering_2)
household_power_consumption$Sub_metering_3<-as.numeric(household_power_consumption$Sub_metering_3)




# Subset for 2007-02-01 and 2007-02-02. 
household_pwr_feb1 <- subset(household_power_consumption,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
household_pwr_feb1$Dayofweek <- weekdays(household_pwr_feb1$Date)

# build Histagram
png(file="C:/programming/r Course Lab 1/Plot3.png")
plot(x=household_pwr_feb1$DateTime,y=household_pwr_feb1$Sub_metering_1,type = "l",ylab="Energy Sub metering",xlab="")
points(x=household_pwr_feb1$DateTime,y=household_pwr_feb1$Sub_metering_2,col="red",type="l")
points(x=household_pwr_feb1$DateTime,y=household_pwr_feb1$Sub_metering_3,col="blue",type="l")
legend("topright",legend=c("Sub_metering_1","Sub_Metering_2","Sub_Metering_3"), col=c("black","red","black"),lty=c(1,1,1), ncol=1)
dev.off()
