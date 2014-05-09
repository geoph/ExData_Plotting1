data=read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")

sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

sub_data$Date <- as.Date(sub_data$Date, "%d/%m/%Y")
sub_data$Time <- paste(sub_data$Date, sub_data$Time, sep=" ")
sub_data$Time <- strptime(sub_data$Time, "%Y-%m-%d %H:%M:%S")

plot(sub_data$Time, as.numeric(sub_data$Global_active_power),
     type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")

dev.copy(png,file="plot2.png", width = 480, height = 480)

dev.off()
