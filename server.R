
library(shiny)
library(rpart)
data("iris")

treemodel <- rpart(Species ~ ., data = iris, method = "class")
yourdata <- NULL

shinyServer(function(input, output) {
    output$scatterplot <- renderPlot({
        comparison = as.numeric(input$comparison)
        color_set = input$color_set
        color_ver = input$color_ver
        color_vir = input$color_vir
        if(comparison == 1){
            plot(iris$Sepal.Length, 
                 iris$Sepal.Width,
                 pch = 21, 
                 bg = c(color_set,color_ver,color_vir)[unclass(iris$Species)], 
                 main = "Scatter Plot",
                 xlab = "Sepal Length (cm)",
                 ylab = "Sepal Width (cm)")  
            legend(x="topleft",
                   legend = c("Setosa","Versicolor","Virginica"),
                   col = c(color_set,color_ver,color_vir),
                   pch = c(21,21,21))
        } else {
            plot(iris$Petal.Length, 
                 iris$Petal.Width,
                 pch = 21, 
                 bg = c(color_set,color_ver,color_vir)[unclass(iris$Species)], 
                 main = "Scatter Plot",
                 xlab = "Petal Length (cm)",
                 ylab = "Petal Width (cm)")
            legend(x="topleft",
                   legend = c("Setosa","Versicolor","Virginica"),
                   col = c(color_set,color_ver,color_vir),
                   pch = c(21,21,21))
        }
    })
    output$histogram <- renderPlot({
        attribute = as.numeric(input$attribute)
        color = input$color
        breaks = input$bin
        xlab = gsub(".", " ", names(iris[attribute]), fixed=TRUE)
        hist(
            iris[, attribute],
            col = color,
            xlab = xlab,
            main = "Histogram",
            breaks = breaks
        )
    })
    youriris <- reactive({
        yourdata <- data.frame(
            Petal.Length = input$PL,
            Petal.Width = input$PW,
            Sepal.Length = input$SL,
            Sepal.Width = input$SW
            )
            pred <- predict(object = treemodel, 
                            type = "class", 
                            newdata = yourdata)
            toupper(as.character(pred))
    })
    output$youriris <- renderText({
        youriris()
    })
    output$image <- renderUI({
        fileimage <- if (youriris() == 'SETOSA'){
            'Iris_setosa.jpg'
        } else
            if (youriris() == 'VERSICOLOR'){
                'Iris_versicolor.jpg'
            } else 'Iris_Virginica.jpg'
        
        tags$img(src = fileimage)
    })
})