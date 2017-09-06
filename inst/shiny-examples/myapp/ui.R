library(shinydashboard)
dashboardPage(
  # Application title
  dashboardHeader(title = "My Shiny App"),

  # Sidebar with a input of dates
  dashboardSidebar(
    sidebarMenu(
      menuItem("Data table", tabName = "dataTimeSeriesTable", icon = icon("area-chart")),
      menuItem("Graph", tabName = "dataGraph", icon = icon("bar-chart"))
    ),
    dateRangeInput("time.range",
                   "Select the time range",
                   start = '1949-01-01',
                   end = '1960-12-31',
                   weekstart = 1),
    actionButton('updateData', 'Update data')
  ),
  # Body of the app
  dashboardBody(
    tabItems(
      tabItem(tabName = "dataTimeSeriesTable", h2("Data table"),
              box(dataTableOutput("dataTimeSeriesTableOutput"))),
      tabItem(tabName = "dataGraph", h2("Graph"),
              box(plotOutput("dataGraphOuput")))
    )
  )
)
