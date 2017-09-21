library(shinydashboard)
dashboardPage(
  # Application title
  dashboardHeader(title = "My Shiny App"),

  # Sidebar
  dashboardSidebar(
    sidebarMenu(
      menuItem("Graph", tabName = "dataGraph", icon = icon("bar-chart")),
      menuItem("Data table", tabName = "dataTimeSeriesTable", icon = icon("area-chart")),
      menuItem("Conditional graph", tabName="condGraph", icon = icon("line-chart"))
    )
  ),
  # Body of the app
  dashboardBody(
    tabItems(
      tabItem(tabName = "dataGraph", h2("Graph"),
              sliderInput(inputId = "fontSize",
                          label = "Font Size",
                          min = 10, max = 30, step = 2, value = 16),
              box(plotOutput("dataGraphOuput"), width = 10)),
      tabItem(tabName = "dataTimeSeriesTable", h2("Data table"),
              box(div(dataTableOutput("dataTimeSeriesTableOutput"),
                      style = "font-size:60%"))),
      tabItem(tabName = "condGraph", h2("Conditional graph"),
              numericInput("monthsToGraph", "Months to compare:", 12),
              numericInput("conditionToGraph", "Growth rate:", 0.15),
              box(title = "Points indicating growth/decrease to previous months",
                  plotOutput("plotCondGraph"), width=10))
    )
  )
)
