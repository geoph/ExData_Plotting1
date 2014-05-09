data=read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")

sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

sub_data$Date <- as.Date(sub_data$Date, "%d/%m/%Y")
sub_data$Time <- paste(sub_data$Date, sub_data$Time, sep=" ")
sub_data$Time <- strptime(sub_data$Time, "%Y-%m-%d %H:%M:%S")

plot(sub_data$Time, 
     as.numeric(sub_data$Sub_metering_1), 
     type="l",
     ylab="Energy Submetering", xlab="")

lines(sub_data$Time, 
      as.numeric(sub_data$Sub_metering_2), 
      type="l", 
      col="red")

lines(sub_data$Time, 
      as.numeric(sub_data$Sub_metering_3), 
      type="l", 
      col="blue")

legend("topright" , 
       lty=1,
       cex=0.6, 
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,
         file="plot3.png", 
         width = 480, 
         height = 480)

dev.off()
