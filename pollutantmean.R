#  pollutantmean.R
pollutantmean <- function(directory, pollutant, id = 1:332) {
    specdata <- data.frame()
    csv.files = list.files(directory, pattern="csv", full.names=T)
    for(i in id) {
        data <- read.csv(csv.files[i], header=TRUE)
        if(length(specdata)==0) {
            specdata <- data
        }else {
            specdata <- rbind(specdata, data)
        }
    }
    val <- apply(specdata[pollutant], 2, mean, na.rm=T)
    val[pollutant][[1]]
}
