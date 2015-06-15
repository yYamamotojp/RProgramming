# complete.R
complete <- function(directory, id = 1:332) {
    ids <- c()
    nobs <- c()
    csv.files = list.files(directory, pattern="csv", full.names=T)
    for(i in id) {
        data <- read.csv(csv.files[i], header=TRUE)
        data <- !is.na(data[c("sulfate", "nitrate")])
        data <- apply(data, 1, all)
        ids <- append(ids, i)
        nobs <- append(nobs, sum(data))
    }
    data.frame(id=ids, nobs=nobs)
}