#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(
    
    fluidPage(

        # Application title
        titlePanel("Transcriptomes from three strains of Plasmodium falciparum"),
    
        #headerPanel(
        #    img(src = '',width = "100%")##, height = '100px', width = '100px')
        #),

        # Generate a row with a sidebar
        sidebarLayout(      
        
            # Define the sidebar with one input
            sidebarPanel(
                selectInput("gene", "Gene:", 
                            choices=unique(abund$gene_id)),
                helpText("Choose gene of interest")
            ),

            # Show a plot of the generated distribution
            mainPanel(
                fluidRow(
                    column(6,
                        plotOutput("abund_plot",height="300px")
                    ),
                    column(6,
                       plotOutput("profile_plot",height="300px")
                    )
                ),
                fluidRow(
                    column(12,
                        DT::dataTableOutput("annot_table")
                    )
                )
            )
        )
    )
)
