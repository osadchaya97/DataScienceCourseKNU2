url = "https://dcc.ligo.org/public/0146/P1700337/001/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5"
filename = "lab2.hdf5"
download.file(url, filename, mode = "wb")

source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")

library(rhdf5)

data = h5ls(filename)

strain = h5read(filename, "strain/Strain")
st = h5readAttributes(filename, "/strain/Strain")$Xspacing
print(st)

gpsStart = h5read(filename, "meta/GPSstart")
duration = h5read(filename, "meta/Duration")

gpsEnd = gpsStart + duration

myTime = seq(gpsStart, gpsEnd, st)

numSamples = 10^6
plot(myTime[0:numSamples], strain[0:numSamples], type = "l", xlab = "GPS Time (s)", ylab = "H1 Strain")