NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

em = aggregate(Emissions ~ year, NEI, sum)
plot(em[,"year"], em[,"Emissions"], type = "l", 
     xlab = "year", ylab = "Emissions", main = "Total emissions by year")