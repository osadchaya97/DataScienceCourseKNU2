NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

df = NEI[NEI[,"fips"] == "24510",]
em = aggregate(Emissions ~ year, df, sum)
plot(em[,"year"], em[,"Emissions"], type = "l", 
     xlab = "year", ylab = "Emissions", main = "Total emissions by year (24510)")