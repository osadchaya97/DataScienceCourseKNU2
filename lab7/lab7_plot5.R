NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(data.table)

df = NEI[NEI[,"fips"] == "24510",]
vehicle_scc = SCC[grep("vehicle", tolower(SCC$EI.Sector)), "SCC"]
df = df[df[,"SCC"] %in% vehicle_scc,]
em = aggregate(Emissions ~ year, df, sum)

plot(em[,"year"], em[,"Emissions"], type = "l", 
     xlab = "year", ylab = "Emissions", main = "Total emissions by year (vehicles, Baltimore)")