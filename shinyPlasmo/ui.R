# load shiny functions
library(shiny)
# Load libraries
source("functions.R")
load_essentials()
theme_set(theme_cowplot())

# Load data
abund <- readRDS("abund.rds")
annot <- readRDS("annotations.rds")

# Define UI for application
shinyUI(
    
    fluidPage(

        # Application title
        titlePanel("Transcriptomes from three strains of Plasmodium falciparum"),
        
        hr(),
    
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

            # Show plots and annotation table
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
