getTimeSeriesToPlot = function(time.series) {
  #' @title Convert time series to data frame used in plotting graphs
  #' @name getTimeSeriesToPlot
  #' @aliases getTimeSeriesToPlot
  #'
  #' @description
  #' \code{getTimeSeriesToPlot} converts time series to data frame used in plotting graphs
  #'
  #' @param time.series a time series with data
  #'
  #' @usage getTimeSeriesToPlot(time.series)
  #'
  #' @return data frame with transformed time series
  #' @examples getTimeSeriesToPlot(datasets::AirPassengers)
  #'
  #' @export getTimeSeriesToPlot
  #' @import stats
  requireNamespace('stats')

  stopifnot(is.ts(time.series))
  data.frame.to.plot = data.frame(date = time(time.series),
                                  values = as.matrix(time.series))
  return(data.frame.to.plot)
}
