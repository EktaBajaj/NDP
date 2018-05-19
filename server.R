library(shiny)
shinyServer(function(input,output){
     z_score<-reactive({
       my_x<-input$n
       myMean<-input$Mean
       myStandardDeviation<-input$StandardDeviation
       (my_x - myMean)/myStandardDeviation
        })
    between_first_z_score <-reactive({
       my_x1<-input$r
       mymean<-input$mean
       mysd<-input$sd
       (my_x1 - mymean)/mysd
       })
    between_second_z_score<-reactive({
      my_x2<-input$t
      mymean<-input$mean
      mysd<-input$sd
      (my_x2 - mymean)/mysd
    })
   output$z_score=renderPrint({z_score()})
   output$between_first_z_score=renderPrint({between_first_z_score()})
   output$between_second_z_score=renderPrint({between_second_z_score()})
 my_func<-reactive({
   if (input$c=='a'){
     pnorm(z_score())
   }
   else{
     if (input$c=='b'){
     1-pnorm(z_score())
     }
   else{
     1-(1-pnorm(between_second_z_score())+pnorm(between_first_z_score()))
   }}
 })
 output$choice<-renderText({
   prob=my_func()
 })
})

  
    
 
  
