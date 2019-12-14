NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(data.table)

coal_scc = SCC[grep("coal", tolower(SCC$EI.Sector)), "SCC"]
df = NEI[NEI[,"SCC"] %in% coal_scc,]
em = aggregate(Emissions ~ year, df, sum)

plot(em[,"year"], em[,"Emissions"], type = "l", 
     xlab = "year", ylab = "Emissions", main = "Total emissions by year (coal)")