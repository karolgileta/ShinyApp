plotConditionalGraph = function(time.series, months, condition) {
  #' @title Plots conditional graph
  #' @name plotConditionalGraph
  #'
  #' @description
  #' \code{plotConditionalGraph} plots conditional graph
  #'
  #' @param time.series a time series with data
  #' @param months number of months before date to compare
  #' @param condition percent of growth/decrease comparing to months before
  #'
  #' @usage plotConditionalGraph(time.series, months, condition)
  #'
  #' @return points to add on graph plot
  #' @examples
  #' plotConditionalGraph(datasets::AirPassengers, 12, 0.15)
  #' @export plotConditionalGraph
  #' @import graphics
  data = as.data.frame(time.series)
  data$nextprevious = c(rep(0, months), data$x[1:(nrow(data)-months)])
  data$diff = NA
  data$diff = data$x/data$nextprevious-1
  data$diff[1:months] = 0
  x = which(data$diff >= condition)
  ind = as.numeric(time(time.series)[1]) + c((x-1)/12)
  plot(time.series)
  points(ind, time.series[x])
}
