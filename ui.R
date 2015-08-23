shinyUI(pageWithSidebar(
  headerPanel(
    list("Prediction of car mileage",
    h5("This is a prediction algorithm for car mileage, based on a linear regression model, trained on the mtcars dataset in R. The model is mpg ~ am + wt + am*wt, where wt is the weight of the car in thousands of pounds and am shows the type of transmission. The graph shows the training dataset and the slopes of the linear model for manual (green) and automatic (blue) transmission. You can enter the data for your car via the slider (for mpg) and checkbox (for transmission) and readout the predicted mileage on the right. The large red dot on the graph reflects the data for your cat."))
    ),
  sidebarPanel(
    sliderInput('wt', 'Weight of the car, short tons',value = 3.0, min = 1.0, max = 5.0, step = 0.05),
    checkboxInput('am', 'Automatic transmission')
    ),
  mainPanel(
    h3('The predicted mileage for your car (MPG): '),
    textOutput('newmpg'),
    plotOutput('graph')
  )
))