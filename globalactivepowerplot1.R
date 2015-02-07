hpcfile <- read.table(
  "household_power_consumption.txt",
  sep = ";", header = TRUE)

hpc <- hpcfile[hpcfile$Date == "1/2/2007" | hpcfile$Date == "2/2/2007", ]
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$Time <- strptime(hpc$Time, format = "%H:%M:%S")

for(i in 3:ncol(hpc)){
  hpc[,i] <- as.numeric(levels(hpc[,i])[hpc[,i]])
}

hist(hpc$Global_active_power, col = "red", 
     xlab = "Global Active Power", 
     main = "Global Active Power")
dev.copy(png, file = "GlobalActivePower.png")