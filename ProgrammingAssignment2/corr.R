# corr.R
corr <- function(directory, threshold = 0) {
    calccorr <- function(csv.file) {
        data <- read.csv(csv.file)
        nobs <- sum(complete.cases(data))
        if (nobs > threshold) {
            return (cor(data$sulfate, data$nitrate, use="complete.obs"))
        }
    }
    csv.files = list.files(directory, pattern="csv", full.names=T)
    corrs <- sapply(csv.files, calccorr)
    corrs <- unlist(corrs[!sapply(corrs, is.null)])
    vals <- c()
    for(i in 1:length(corrs)) {
        vals <- append(vals, corrs[[i]])
    }
    vals
}