#-------------------------------------------------------------------------------------#
# Project: ShinyNAPv2
# Purpose: Test Module
# Author: Artemio Sison III
# R Version: 4.0.1 "See Things Now"
#-------------------------------------------------------------------------------------#

#-------------------------------------------------------------------------------------#
# Load Dependencies
#-------------------------------------------------------------------------------------#
source("01_UI_module.R")
source("02_server_module.R")
source("03_proteinUI_module.R")
#-------------------------------------------------------------------------------------#
# Calling UI and server modules
#-------------------------------------------------------------------------------------#
# Module server function
library(shiny)

ui <- navbarPage("ShinyNAPv2 (Neoantigen Portal version 2.0)",
                 tabPanel("Custom Neoantigen",
                          fluidPage(
                            titlePanel(title = "Custom Neoantigen"),
                            sidebarLayout(
                              sidebarPanel(
                                csvFileUI("datafile", "User data (.csv format)")
                              ),
                              mainPanel(
                                dataTableOutput("table")
                              )
                            )
                          )
                 ),
                 tabPanel("Protein HLA Presentation",
                          fluidPage(
                            titlePanel("Run netMHC on Protein"),
                            sidebarLayout(
                              sidebarPanel(
                                proteinSubmitUI("proteindatafile", "Select Protein")
                              ),
                              mainPanel("Protein Tab Panel",
                                textOutput("proteindata_out")
                              )
                            )
                          )
                 )
)



server <- function(input, output, session) {
  # Testing UI Module
  datafile <- csvFileServer("datafile", stringsAsFactors = FALSE)
  
  output$table <- renderDataTable({
    datafile()
  })
  
  # Protein UI module
  proteindatatext <- proteinSubmitServer("proteindatafile")
  
  output$proteindata_out <- renderText({
    proteindatatext()
  })
  
}

shinyApp(ui, server)