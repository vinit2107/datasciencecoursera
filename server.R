library(shiny)
library(usmap)
library(ggplot2)

state = as.data.frame(state.x77)
state = cbind(state, state = state.name)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$plot <- renderPlot({
        plot_usmap(data = state, regions = c('states'), values = as.character(input$columns)) +
            scale_fill_continuous(low = 'white', high = 'red', 
                                  name = input$columns) +
            theme(legend.position = 'right', title = element_text(size = 14, hjust = 0.5)) +
            ggtitle(paste(input$columns, 'across the Country'))
    })
    
    output$table <- renderDataTable(as.data.frame(state[, c('state', input$columns)]), 
                                    options = list(pageLength = 5), escape = FALSE)
})
