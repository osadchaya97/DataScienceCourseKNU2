# 1 
url_uran<-"https://data.gov.ua/dataset/64579ef8-633c-4752-8f21-75231b3bdbc5/resource/2d4b578f-866e-4133-9fe2-213eb2aaa261/download/nuclear_production_07_2019.xlsx"
dest_uran<-"C:/Users/KaterynaOsadcha/Downloads/Uran.xlsx"
download.file (url_uran, dest_uran, mode = "wb")
library(readxl)
uran<-read_xlsx(dest_uran)
head(uran)
# Result
year month     code enterprise       activity    product  amount    cost
<dbl> <dbl>    <dbl> <chr>            <chr>       <chr>     <dbl>   <dbl>
1  2018     1 14309787 "ДП \"СхідГЗК\"" видобуток   УР      60095       NA 
2  2018     1 14309787 "ДП \"СхідГЗК\"" виробництво УОК       139.  429966.
3  2018     2 14309787 "ДП \"СхідГЗК\"" видобуток   УР      57140       NA 
4  2018     2 14309787 "ДП \"СхідГЗК\"" виробництво УОК       162.  504702.
5  2018     3 14309787 "ДП \"СхідГЗК\"" видобуток   УР      61277       NA 
6  2018     3 14309787 "ДП \"СхідГЗК\"" виробництво УОК        93.2 285268.

# 2 
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
filename = "lab1_2.csv"
download.file(url = url, destfile = filename)
data = read.csv(filename, sep= ",")
property = data[data$VAL == 24, ]$VAL
property = property[!is.na(property)]
print(length(property))
# Result
[1] 53

# 3
url = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
install.packages("XML")
require(XML)
data <- xmlParse(url)
xml_data <- xmlToDataFrame(getNodeSet(data, "//zipcode"))
print(length(xml_data[xml_data == 21231]))
# Result
[1] 127
