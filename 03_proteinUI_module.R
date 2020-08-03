#-------------------------------------------------------------------------------------#
# Project: ShinyNAPv2
# Purpose: Select Protein Module
# Author: Artemio Sison III
# R Version: 4.0.1 "See Things Now"
#-------------------------------------------------------------------------------------#

#-------------------------------------------------------------------------------------#
# Load Dependencies
#-------------------------------------------------------------------------------------#
source("04_netMHC_module.R")

#-------------------------------------------------------------------------------------#
# Protein - UI
#-------------------------------------------------------------------------------------#
proteinSubmitUI <- function(id, protein_test = "Select Protein - Test") {
  ns <- NS(id)
  
  tagList(
    textInput(ns("protein_testtextinput"), protein_test)
  )
}


#-------------------------------------------------------------------------------------#
# Protein - Server
#-------------------------------------------------------------------------------------#

proteinSubmitServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      proteintext <- reactive({
        input$protein_testtextinput
      })
      
      # Return the reactive that yields user input text
      return(proteintext)
    }
  )    
}
