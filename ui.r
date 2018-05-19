getwd()
setwd("C:/Users/yogesh/Desktop/R-shiny")
library(promises)
library(shiny)
shinyUI(fluidPage(
  titlePanel("Probability calculation for a Normal Distribution"),
  sidebarLayout(
    sidebarPanel((""),
              selectInput("c","select from the following:",choices = c("calculate the probability of X less than"='a',
                                                                          "calculate the probability of X greater than"='b',
                                                                         "calculate the probability inbetween"='z'),selected = F),
              
              conditionalPanel(condition=c("input.c=='a'||input.c=='b'"), 
           numericInput("n","Enter your score",""),
         numericInput("Mean","Enter the value of mean",""),
         numericInput("StandardDeviation","Enter the value of Standard deviation","")),
         
         conditionalPanel(condition="input.c=='z'",
         numericInput("r","Enter first value",""),
         numericInput("t","Enter second value",""),
         numericInput("mean","Enter the value of mean",""),
         numericInput("sd","Enter the value of Standard deviation",""))
                          #326"calculate the probability of X greater than"='b'))
  ),
         
        
    mainPanel(
               h2('your z_score is:'),
              verbatimTextOutput('z_score'),
              h3('your betwee_first_z_score is:'),
              verbatimTextOutput('between_first_z_score'),
              h4('your between_second_z_score is:'),
              verbatimTextOutput('between_second_z_score'),
              h5(' The required probability is:'),
              textOutput("choice")
            )
  )
  
))
