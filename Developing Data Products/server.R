library(datasets)
library(ggplot2)
library(shiny)
shinyServer(
  function(input, output) {
    
    # Data Pre-Processing
    data(state)
    statesData = as.data.frame(state.x77)
    statesData$state = rownames(statesData)
    statesData$state = as.factor(statesData$state)
    statesData$LifeExp = statesData$"Life Exp"
    
    # Reactive function
    Cplot <- reactive({
      switch(input$Compare,
             "Population" = ggplot(data=statesData[statesData$state %in% input$States,], aes(x=state, y=Population)) + geom_bar(aes(fill=state),stat="identity"),
             "Income" = ggplot(data=statesData[statesData$state %in% input$States,], aes(x=state, y=Income)) + geom_bar(aes(fill=state),stat="identity"),
             "Illiteracy" = ggplot(data=statesData[statesData$state %in% input$States,], aes(x=state, y=Illiteracy)) + geom_bar(aes(fill=state),stat="identity"),
             "LifeExp" = ggplot(data=statesData[statesData$state %in% input$States,], aes(x=state, y=LifeExp)) + geom_bar(aes(fill=state),stat="identity"),
             "Murder"=ggplot(data=statesData[statesData$state %in% input$States,], aes(x=state, y=Murder)) + geom_bar(aes(fill=state),stat="identity"),
             "Frost"=ggplot(data=statesData[statesData$state %in% input$States,], aes(x=state, y=Frost)) + geom_bar(aes(fill=state),stat="identity"),
             "Area"=ggplot(data=statesData[statesData$state %in% input$States,], aes(x=state, y=Area)) + geom_bar(aes(fill=state),stat="identity")
             )
    })
    
    # output
    output$oid1 <- renderPrint({input$States})
    output$oid2 <- renderPrint({input$Compare})
    output$plot <- renderPlot({
      Cplot()
    })
  }
)
