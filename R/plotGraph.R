plotGraph = function(time.series, name, directory) {
  #' @title Plot graph from data
  #' @name plotGraph
  #'
  #' @description
  #' \code{plotGraph} plots graph of given time series
  #'
  #' @param time.series a time series with data
  #' @param name name of the graph PNG file
  #' @param directory directory to which the graph should be saved to
  #'
  #' @usage plotGraph(time.series, name, directory)
  #'
  #' @return png with graph
  #' @examples
  #' plotGraph(datasets::AirPassengers, 'timeSeries', 'files')
  #' @export plotGraph
  #' @import ggplot2
  #' @import grDevices
  #' @importFrom assertthat is.writeable

  data.to.plot = getTimeSeriesToPlot(time.series)
  stopifnot(is.data.frame(data.to.plot))

  if (!(dir.exists(directory))) {
    dir.create(directory)
  }

  name = paste0(name, '.png')

  if (substr(directory, nchar(directory), nchar(directory)) == '/') {
    directory = substr(directory, 1, nchar(directory) - 1)
    png.directory = file.path(directory, name)
  } else {
    png.directory = file.path(directory, name)
  }
  try(if (!(is.writeable(png.directory)))
    stop("Wrong PNG path"))

  graph.temp = ggplot() +
    geom_line(
      data = data.to.plot,
      aes(x = data.to.plot$date, y = data.to.plot$values),
      size = 1.2
    ) +
    #titles
    labs(
      x = 'Date',
      y = 'Values',
      title = 'Time series graph',
      subtitle = paste0(
        substr(data.to.plot$date[1], 1, 4),
        ' - ',
        substr(data.to.plot$date[nrow(data.to.plot)], 1, 4)
      )
    ) +
    #to make sure chart is pretty
    theme(
      axis.text.x = element_text(
        family = 'Arial',
        face = 'bold',
        colour = 'black',
        size = 16
      ),
      axis.text.y = element_text(
        family = 'Arial',
        face = 'bold',
        colour = 'black',
        size = 16
      ),
      axis.title.x = element_text(
        family = 'Arial',
        face = 'bold',
        colour = 'black',
        size = 24
      ),
      axis.title.y = element_text(
        family = 'Arial',
        face = 'bold',
        colour = 'black',
        size = 24
      ),
      plot.title = element_text(
        family = 'Arial',
        face = 'bold',
        colour = 'black',
        size = 30,
        hjust = .5
      ),
      plot.subtitle = element_text(
        family = 'Arial',
        face = 'bold',
        colour = 'black',
        size = 24,
        hjust = .5
      ),
      legend.position = "none",
      panel.grid.major = element_line(color = 'grey'),
      panel.grid.minor = element_blank(),
      panel.border = element_blank(),
      panel.background = element_blank()
    )
  #save to png (resolution 1200x800)
  png(png.directory, 1200, 800)
  print(graph.temp)
  dev.off()

}
