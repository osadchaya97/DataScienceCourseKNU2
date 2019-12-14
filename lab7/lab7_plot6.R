NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(data.table)

LA = NEI[NEI[,"fips"] == "06037",]
vehicle_scc = SCC[grep("vehicle", tolower(SCC$EI.Sector)), "SCC"]
LA = LA[LA[,"SCC"] %in% vehicle_scc,]
em = aggregate(Emissions ~ year, LA, sum)

plot(em[,"year"], em[,"Emissions"], type = "l", col = "green", ylim = c(0, max(em[,"Emissions"])),
      xlab = "year", ylab = "Emissions", main = "Total emissions (vehicle) green - Baltimore, black - LA")

balti = NEI[NEI[,"fips"] == "24510",]
vehicle_scc = SCC[grep("vehicle", tolower(SCC$EI.Sector)), "SCC"]
balti = balti[balti[,"SCC"] %in% vehicle_scc,]
em = aggregate(Emissions ~ year, balti, sum)

lines(em[,"year"], em[,"Emissions"], type = "l", 
     xlab = "year", ylab = "Emissions", main = "Total emissions (vehicle) green - Baltimore, black - LA")

