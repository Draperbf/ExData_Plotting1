# Load data File
household_power_consumption <- read.csv("C:/programming/r Course Lab 1/household_power_consumption.txt", sep=";")
# convert the Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() functions.
household_power_consumption$Date <- as.Date(as.character(household_power_consumption$Date),format = "%d/%m/%Y")

# Convert to Numeric
household_power_consumption$Global_active_power<-as.numeric(household_power_consumption$Global_active_power)
# Subset for 2007-02-01 and 2007-02-02. 
household_pwr_feb1 <- subset(household_power_consumption,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
# build Histagram
png(file="C:/programming/r Course Lab 1/Plot1.png")
hist(household_pwr_feb1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
