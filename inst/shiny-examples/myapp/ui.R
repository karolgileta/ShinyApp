library(shinydashboard)
dashboardPage(
  # Application title
  dashboardHeader(title = "My Shiny App"),

  # Sidebar
  dashboardSidebar(
    sidebarMenu(
      menuItem("Data table", tabName = "dataTimeSeriesTable", icon = icon("area-chart")),
      menuItem("Graph", tabName = "dataGraph", icon = icon("bar-chart"))
    ),
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
