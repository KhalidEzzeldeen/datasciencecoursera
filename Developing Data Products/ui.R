shinyUI(
  pageWithSidebar(
    headerPanel("States Comparision"),
    sidebarPanel(
      helpText("This page is making a comparison between USA states based on several carterias, first select one or more states then select the comparison carteria(Population,Income,..)"),
             checkboxGroupInput("States",h4("Select State"),choices = c("New York"="New York","Washington"="Washington","California"="California","Florida"="Florida","Colorado"="Colorado","Virginia"="Virginia"),inline = T),
             radioButtons("Compare", h4("Compare :"), choices = c("Population","Income","Illiteracy","LifeExp","Murder","Frost","Area"), selected = NULL)
    ),
    mainPanel(
      h3("outputs"),
      h4("States"),
      verbatimTextOutput("oid1"),
      h4("compare :"),
      verbatimTextOutput("oid2"),
      plotOutput("plot")
    )
  )
)