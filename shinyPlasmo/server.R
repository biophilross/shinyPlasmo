# Load libraries
source("functions.R")
load_essentials()
theme_set(theme_cowplot())

# Load data
abund <- readRDS("abund.rds")
annot <- readRDS("annotations.rds")

# Define server logic create plots
shinyServer(function(input, output) {

    # draw abundance plot
    output$abund_plot <- renderPlot({
        plot_strain_abundances(df=abund,gid=input$gene)
    })
    # draw profile plot
    output$profile_plot <- renderPlot({
        plot_strain_profiles(df=abund,gid=input$gene)
    })
    # create annotation table
    output$annot_table <- DT::renderDataTable(DT::datatable(
        dplyr::filter(annot,ID==input$gene),rownames = FALSE))
})
