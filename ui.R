library(shiny)

description = 'matrix with 50 rows and 8 columns giving the following statistics in the respective columns. Population:
population estimate as of July 1, 1975 Income: per capita income (1974) Illiteracy:
illiteracy (1970, percent of population) Life Exp: life expectancy in years (1969-71) 
Murder: murder and non-negligent manslaughter rate per 100,000 population (1976) 
HS Grad: percent high-school graduates (1970) Frost: mean number of days with minimum 
temperature below freezing (1931-1960) in capital or large city'

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Exploratory Analysis of the USA"),
    p('The project aims at performing an exploratory analysis on the dataset state.x77
      which comes as a part of internal datasets in R. The dataset has columns Population,
      Income, Illiteracy, Life Espectancy, Murder Rate, High School Graduation Rate,
      Frost and Area. The user will select the metric for performing exploratory analysis
      from the drop down menu. The plot is the map of the USA specifying the data according
      to each state. The data table at the bottom shows the actual values for the states.'),
    
    # Show a plot of the generated distribution
    mainPanel(
        tabsetPanel(
            tabPanel('Data Description', description),
            tabPanel('Analysis', fluidRow(
                selectInput('columns', label = 'Select Criterion', choices = colnames(state.x77)[colnames(state.x77)!= 'Area'],
                            multiple = FALSE, selected = 'Population')),
                fluidRow(
                    column(6,
                           plotOutput("plot")),
                    column(6, dataTableOutput('table'))
                )))
    )
))
