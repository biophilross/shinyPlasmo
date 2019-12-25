#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

source("functions.R")
load_essentials()
theme_set(theme_cowplot())

abund <- readRDS("abund.rds")
annot <- readRDS("annotations.rds")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$abund_plot <- renderPlot({
        
        plot_strain_abundances(df=abund,gid=input$gene)

    })
    
    output$profile_plot <- renderPlot({
        
        plot_strain_profiles(df=abund,gid=input$gene)
        
    })
    
    output$annot_table <- DT::renderDataTable(DT::datatable(
        dplyr::filter(annot,ID==input$gene),rownames = FALSE))

})
