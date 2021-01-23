
library(shiny)
library(markdown)
library(shinythemes)

shinyUI(
    navbarPage(
        theme = shinytheme("superhero"),
    "Iris Shiny App",
    tabPanel("Documentation",
             mainPanel(includeMarkdown("documentation.md"))),
    tabPanel("Scatter Plot",
             sidebarLayout(
                 sidebarPanel(
                     radioButtons(
                         "comparison",
                         label = "Select the attribute",
                         choices = c(
                             "Sepal" = 1,
                             "Petal" = 2
                         ),
                         selected = 2
                     ),
                     selectInput(
                         "color_set",
                         label = "Select the color for Setosa",
                         choices = c(
                             "Black",
                             "Blue",
                             "Green",
                             "Purple",
                             "Red",
                             "White",
                             "Yellow"
                         ),
                         selected = "Red"
                     ), 
                     selectInput(
                         "color_ver",
                         label = "Select the color for Versicolor",
                         choices = c(
                             "Black",
                             "Blue",
                             "Green",
                             "Purple",
                             "Red",
                             "White",
                             "Yellow"
                         ),
                         selected = "Green"
                     ),
                     selectInput(
                         "color_vir",
                         label = "Select the color for Virginica",
                         choices = c(
                             "Black",
                             "Blue",
                             "Green",
                             "Purple",
                             "Red",
                             "White",
                             "Yellow"
                         ),
                         selected = "Yellow"
                     ),
                 ),
                 mainPanel(
                     plotOutput("scatterplot")
                 )
             )),
    tabPanel("Histogram",
             sidebarLayout(
                 sidebarPanel(
                     selectInput(
                         "attribute",
                         label = "Select the attribute",
                         choices = c(
                             "Sepal Length" = 1,
                             "Sepal Width" = 2,
                             "Petal Length" = 3,
                             "Petal Width" = 4
                         ),
                         selected = 1
                     ),
                     sliderInput(
                         "bin",
                         "Select the number of breaks",
                         min = 5,
                         max = 50,
                         value = 10
                     ),
                     selectInput(
                         "color",
                         label = "Select the color",
                         choices = c(
                             "Black",
                             "Blue",
                             "Green",
                             "Purple",
                             "Red",
                             "White",
                             "Yellow"
                         ),
                         selected = "Purple"
                     ),                  
                 ),
                 mainPanel(
                     plotOutput("histogram")
                 )
             )),
    tabPanel("Prediction",
             sidebarLayout(
                 sidebarPanel(
                     h4("Select the characteristics of your Iris:"),
                     sliderInput("PL",
                                 label = "Petal Length",
                                 min = 1, 
                                 max = 10, 
                                 value = 4),
                     sliderInput("PW",
                                 label = "Petal Width",
                                 min = 0.1, 
                                 max = 5, 
                                 value = 1),
                     sliderInput("SL",
                                 label = "Sepal Length",
                                 min = 1, 
                                 max = 10, 
                                 value = 6),
                     sliderInput("SW",
                                 label = "Sepal Width",
                                 min = 1, 
                                 max = 5, 
                                 value = 3),
                 ),
                 mainPanel(
                     h4("Based on your inputs we predict your Iris is:"),
                     h3(textOutput("youriris")),
                     uiOutput(outputId = "image")
                 )
             ))
))