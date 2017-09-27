shinyServer(function(input, output, session) {
  library(ShinyApp)
  library(ggplot2)
  library(datasets)

  output$dataGraphOuput = renderPlot({
    data.to.plot = getTimeSeriesToPlot(datasets::AirPassengers)
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
          size = input$fontSize
        ),
        axis.text.y = element_text(
          family = 'Arial',
          face = 'bold',
          colour = 'black',
          size = input$fontSize
        ),
        axis.title.x = element_text(
          family = 'Arial',
          face = 'bold',
          colour = 'black',
          size = input$fontSize + 8
        ),
        axis.title.y = element_text(
          family = 'Arial',
          face = 'bold',
          colour = 'black',
          size = input$fontSize + 8
        ),
        plot.title = element_text(
          family = 'Arial',
          face = 'bold',
          colour = 'black',
          size = input$fontSize + 12,
          hjust = .5
        ),
        plot.subtitle = element_text(
          family = 'Arial',
          face = 'bold',
          colour = 'black',
          size = input$fontSize + 8,
          hjust = .5
        ),
        legend.position = "none",
        panel.grid.major = element_line(color = 'grey'),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank()
      )
    print(graph.temp)
  })

  output$dataTimeSeriesTableOutput = renderDataTable({
    data.to.output = turnTimeSeriesToDataFrame(datasets::AirPassengers)
  })

  output$plotCondGraph = renderPlot({
    months = input$monthsToGraph
    condition = input$conditionToGraph
    plotConditionalGraph(datasets::AirPassengers,
                         months = months,
                         condition = condition)
  })
})
