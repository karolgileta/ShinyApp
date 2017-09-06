shinyServer(function(input, output, session) {
  library(ShinyApp)
  library(ggplot2)
  library(datasets)

  getDataForGraphOutput = eventReactive(input$updateData, {
    raw.date.from = input$time.range[1]
    raw.date.to = input$time.range[2]
    #dates = datesToWeeks(raw.date.from, raw.date.to)
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
