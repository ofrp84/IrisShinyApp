Iris Shiny App Presentation
========================================================
author: Oty Rosario
date: January 23, 2021
autosize: true

Description of the Iris Shiny App
========================================================

This presentation is the second part of the course project for the Developing Data Products course on Coursera.

The app I created uses the Edgar Anderson's Iris Data. This data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of Iris.

- Link to the app: https://otyfrank.shinyapps.io/IrisShinyApp/
- Link to the github repository: https://github.com/otyfrank/IrisShinyApp
- Link to the presentation: https://rpubs.com/Otyfrank/irisshinyapp

The Iris Shiny App has 4 tabs
========================================================

- Documentation: This tab shows the supporting documentation associated with the app. Here you will find everything you need to get started using the app.
- Scatter Plot: This tab shows a scatter plot of the data. You get to choose the attribute to plot (Sepal or Petal). You also get to choose the color for each species of Iris.
- Histogram: This tab shows a histogram plot of the data. You get to choose the attribute to plot (Sepal Length, Sepal Width, Petal Length or Petal Width). You also get to choose the number of suggested breaks for the histogram. Finally you can also choose the color of the histogram.
- Prediction: This tab predicts the species of Iris based on your inputs. The model behind this prediction is a classification tree. You get to choose the Sepal Length, Sepal Width, Petal Length and Petal Width, and the app will give you a prediction.

Classification Tree Model
========================================================

This is the code that was used for the classification tree model.


```r
library(rpart)
data("iris")
treemodel <- rpart(Species ~ ., data = iris, method = "class")
```

Classification Tree Model
========================================================

![plot of chunk unnamed-chunk-2](Presentation-figure/unnamed-chunk-2-1.png)
