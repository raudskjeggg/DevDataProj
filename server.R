library(UsingR)
data(galton)

shinyServer(
  function(input, output) {
    output$newmpg <- renderText({
      predict(lm(mpg ~ am*wt, mtcars),newdata = data.frame(am=(input$am*1),wt=input$wt))
    })
    output$graph <- renderPlot({
      lmwtint<-lm(mpg ~ am*wt, mtcars)
      cf<-lmwtint$coeff
      plot(mpg ~ wt, mtcars, pch=19,xlim=c(1,6),ylim=c(0,40))
      points(mpg ~ wt, mtcars, pch=19, col = 3 + mtcars$am)
      points( predict(lmwtint,newdata = data.frame(am=(input$am*1),wt=input$wt)) ~ input$wt, pch=19, col = 'red')
      abline(c(cf[1]+cf[2],cf[3]+cf[4]),col="blue",lwd=3)
      abline(c(cf[1],cf[3]),col="green",lwd=3)
      points( predict(lmwtint,newdata = data.frame(am=(input$am*1),wt=input$wt)) ~ input$wt, pch=19, col = 'red',cex=3)
      
    })
    
  }
)