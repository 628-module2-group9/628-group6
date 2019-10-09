library(shiny)
library(ggplot2)
bodyfat = read.csv("BodyFat.csv", header = T)
model = lm(BODYFAT ~ ABDOMEN + WEIGHT + WRIST, data = bodyfat[-c(39, 86, 221, 96, 48, 76, 182, 216),])
shinyServer(function(input, output) {
    output$distPlot <- renderPlot({
        if (input$metric == "kg") {
            abd = input$abdomen
            wei = input$weight * 2.20462
            wri = input$wrist
        } else{
            abd = input$abdomen
            wei = input$weight
            wri = input$wrist
        }
        result = 0.87320 * abd - 0.08140 *
            wei -1.33584 * wri -22.90319
        if (result >= 100 || result <= 0) {
            ggplot(bodyfat[-c(39, 86, 221, 96, 48, 76, 182, 216),],
                   aes(
                       x = BODYFAT,
                       y = ..density..,
                       fill = ..x..
                   )) +
                geom_histogram(bins = 30) +
                geom_vline(
                    aes(xintercept = result),
                    color = "darkblue",
                    linetype = "dashed",
                    size = 1
                ) +
                labs(
                    title = "Histogram of People and Where are you?",
                    x = "BodyFat%",
                    y = "Count",
                    size = 6
                ) +
                theme_grey() +
                scale_fill_gradient(low = "slategray1", high = "steelblue4") +
                geom_density(alpha = 0.2,
                             fill = "grey",
                             col = "grey") +
                geom_text(
                    aes(
                        x = result + 3,
                        label = ("ERROR!"),
                        y = 0.065
                    ),
                    colour = "red",
                    size = 6,
                    check_overlap = TRUE
                )
        } else if (result >= 40 || result <= 5) {
            ggplot(bodyfat[-c(39, 86, 221, 96, 48, 76, 182, 216),],
                   aes(
                       x = BODYFAT,
                       y = ..density..,
                       fill = ..x..
                   )) +
                geom_histogram(bins = 30) +
                geom_vline(
                    aes(xintercept = result),
                    color = "darkblue",
                    linetype = "dashed",
                    size = 1
                ) +
                labs(
                    title = "Histogram of People and Where are you?",
                    x = "BodyFat%",
                    y = "Count",
                    size = 6
                ) +
                theme_grey() +
                scale_fill_gradient(low = "slategray1", high = "steelblue4") +
                geom_density(alpha = 0.2,
                             fill = "grey",
                             col = "grey") +
                geom_text(
                    aes(
                        x = result + 3,
                        label = paste0(round(result, 2), "%"),
                        y = 0.065
                    ),
                    colour = "darkblue",
                    size = 6
                ) +
                geom_text(
                    aes(
                        x = result - 1.5,
                        label = paste0("Double Check Your Input"),
                        y = 0.02
                    ),
                    colour = "red",
                    size = 5,
                    angle = 90
                )
        } else{
            ggplot(bodyfat[-c(39, 86, 221, 96, 48, 76, 182, 216),],
                   aes(
                       x = BODYFAT,
                       y = ..density..,
                       fill = ..x..
                   )) +
                geom_histogram(bins = 30) +
                geom_vline(
                    aes(xintercept = result),
                    color = "darkblue",
                    linetype = "dashed",
                    size = 1
                ) +
                labs(
                    title = "Histogram of People and Where are you?",
                    x = "BodyFat%",
                    y = "Count",
                    size = 6
                ) +
                theme_grey() +
                scale_fill_gradient(low = "slategray1", high = "steelblue4") +
                geom_density(alpha = 0.2,
                             fill = "grey",
                             col = "grey") +
                geom_text(
                    aes(
                        x = result + 3,
                        label = paste0(round(result, 2), "%"),
                        y = 0.065
                    ),
                    colour = "darkblue",
                    size = 6,
                    check_overlap = TRUE
                )
            
        }
    })
})
