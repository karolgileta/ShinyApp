shinyServer(function(input, output, session) {
  library(ShinyApp)
  library(ggplot2)
  library(datasets)

  getDataForGraphOutput = eventReactive(input$updateData, {
    data.to.output = getTimeSeriesToPlot(datasets::AirPassengers)
    return(data.to.output)
  })
  output$dataGraphOuput = renderPlot({
    plot(getDataForGraphOutput())
  })

  getDataForDataTableOutput = eventReactive(input$updateData, {
    data.to.output = turnTimeSeriesToDataFrame(datasets::AirPassengers)
    return(data.to.output)
  })
  output$dataTimeSeriesTableOutput = renderDataTable({
    getDataForDataTableOutput()
  })
})
