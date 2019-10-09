library(shiny)
shinyUI(fluidPage(
    titlePanel("BodyFat Calculator For MEN"),
    sidebarLayout(
        sidebarPanel(selectInput("metric","Select the Metric that you use",c("kg","lbs")),
                     sliderInput("abdomen","Abdomen",min = 50,max = 150,value = 80),
                     sliderInput("weight","Net Weight",min = 30,max = 300,value = 70),
                     sliderInput("wrist","Cirsumference of Wrist",min = 10,max = 25,value = 15)),
        mainPanel(plotOutput("distPlot")))
))
