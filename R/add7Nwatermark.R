add7NWatermark = function(file.name,
                          file.width,
                          file.height,
                          watermark.path = "inst/7nlogo.png",
                          x.coordinate = 0.84,
                          y.coordinate = 0.17,
                          width = 0.2,
                          plot.unit = 'npc') {
  #' @title Add 7N watermark to graph
  #' @name add7NWatermark
  #'
  #' @description
  #' \code{add7NWatermark} adds 7N watermark to given graph
  #'
  #' @param file.name name of the file
  #' @param file.width name of the graph PNG file
  #' @param file.height directory to which the graph should be saved to
  #' @param watermark.path directory to the watermark logo
  #' @param x.coordinate x coordinates of the position of watermark
  #' @param y.coordinate y coordinates of the position of watermark
  #' @param width width of the watermark
  #' @param plot.unit unit used in function
  #'
  #' @usage add7NWatermark(file.name, file.width, file.height,
  #'  watermark.path, x.coordinate, y.coordinate, width, plot.unit)
  #'
  #' @return png with added watermark
  #' @examples
  #' test = system.file("extdata", "test.png", package = "ShinyApp")
  #' logo = system.file("extdata", "logo.png", package = "ShinyApp")
  #' add7NWatermark(test, 1200, 800, logo, 0.84, 0.17, 0.02, 'npc')
  #' @export add7NWatermark
  #' @import png
  #' @import grDevices
  #' @import grid
  requireNamespace('grDevices')
  requireNamespace('grid')
  m = readPNG(file.name)
  png(file.name, file.width, file.height)
  grid.newpage()
  grid.raster(m)
  m2 = readPNG(watermark.path)
  grid.raster(
    m2,
    x = unit(x.coordinate, plot.unit),
    y = unit(y.coordinate, plot.unit),
    width = unit(width, plot.unit)
  )
  dev.off()
}
