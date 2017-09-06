saveToCsv = function(time.series, name, directory) {
  #' @title Saves data to csv
  #' @name saveToCsv
  #'
  #' @description
  #' \code{saveToCsv} saves time series data to CSV
  #'
  #' @param time.series a time series with data
  #' @param name name of the file
  #' @param directory directory to save the file
  #'
  #' @return csv file
  #' @examples
  #' saveToCsv(datasets::AirPassengers, name = 'fanpage2', directory = 'files')
  #' @export saveToCsv
  #' @importFrom assertthat is.writeable
  #' @importFrom  utils write.csv

  data = turnTimeSeriesToDataFrame(time.series)

  if (!(dir.exists(directory))) {
    dir.create(directory)
  }
  file.directory = paste0(directory, name, '.csv')
  try(if(!(is.writeable(file.directory))) stop("Wrong file path"))
  try(write.csv(data, file.directory))
  print(paste0('File ', name, ' saved in ', file.directory))
  return(data)
}
