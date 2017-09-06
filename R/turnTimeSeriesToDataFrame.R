turnTimeSeriesToDataFrame = function(time.series) {
  #' @title Convert time series to data frame
  #' @name turnTimeSeriesToDataFrame
  #' @aliases turnTimeSeriesToDataFrame
  #'
  #' @description
  #' \code{turnTimeSeriesToDataFrame} converts time series to data frame
  #'
  #' @param time.series a time series with data
  #'
  #' @usage turnTimeSeriesToDataFrame(time.series)
  #'
  #' @return data frame with transformed time series
  #' @examples turnTimeSeriesToDataFrame(datasets::AirPassengers)
  #'
  #' @export turnTimeSeriesToDataFrame
  #' @import stats
  requireNamespace('stats')

  stopifnot(is.ts(time.series))
  month.names = list(month.abb, unique(floor(time(time.series))))
  row.number = length(month.names[[1]])
  final.data.frame = as.data.frame(t(matrix(time.series, row.number, dimnames = month.names)))
  return(final.data.frame)
}
