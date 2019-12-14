# 1 
url = "https://data.gov.ua/dataset/424fb9c3-0dc5-4225-a3c7-60995412263d/
resource/39073299-d907-4b58-8824-376b4bd2fb44/download/perelik-dp-15-_01_-2019.xls"
filename = "lab1_1.xls"
download.file(url = url, destfile = filename, mode = "wb")
install.packages("gdata")
library(gdata)
data = read.xls(filename)
print(data[1:6, ])


# 2 
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
filename = "lab1_2.csv"
download.file(url = url, destfile = filename)
data = read.csv(filename, sep= ",")
property = data[data$VAL == 24, ]$VAL
property = property[!is.na(property)]
print(length(property))

# 3
url = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
install.packages("XML")
require(XML)
data <- xmlParse(url)
xml_data <- xmlToDataFrame(getNodeSet(data, "//zipcode"))
print(length(xml_data[xml_data == 21231]))