data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   na.strings="?")

data$Date <- as.Date(data$Date, "%d/%m/%Y") #converting date to propar class
subdata <- data[(data$Date=="2007-02-01" | data$Date=="2007-02-02"),] #subsetting
                                                                #the two days

png(filename="plot1.png", width=480, height=480, bg="white") #creating the
                                                #png file in the properties
                                                #asked for by the instructions
hist(subdata$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (Kilowatts)") #creating the plot
dev.off() #closing the png device so file will be created