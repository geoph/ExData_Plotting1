data=read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")

sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]



hist(as.numeric(sub_data$Global_active_power),
     col="Red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png", width = 480, height = 480)

dev.off()
