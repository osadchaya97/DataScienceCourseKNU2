NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

install.packages("ggplot2")
install.packages("ggpubr")

library(ggplot2)
library(ggpubr)

df = NEI[NEI[,"fips"] == "24510",]
em = aggregate(Emissions ~ year + type, df, sum)

em_new = em[em[,"type"] == "NON-ROAD",]
p1 = ggplot(em_new, aes(year, Emissions)) + 
  geom_line(data = em_new, aes(year, Emissions))

em_new = em[em[,"type"] == "NONPOINT",]
p2 = ggplot(em_new, aes(year, Emissions)) + 
  geom_line(data = em_new, aes(year, Emissions))

em_new = em[em[,"type"] == "ON-ROAD",]
p3 = ggplot(em_new, aes(year, Emissions)) + 
  geom_line(data = em_new, aes(year, Emissions))

em_new = em[em[,"type"] == "POINT",]
p4 = ggplot(em_new, aes(year, Emissions)) + 
  geom_line(data = em_new, aes(year, Emissions))

ggarrange(p1,p2,p3,p4, ncol = 2, nrow = 2,
          labels = c("NON-ROAD", "NOPOINT", "ON-ROAD", "POINT"))