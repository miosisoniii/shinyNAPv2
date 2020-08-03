#-------------------------------------------------------------------------------------#
# Project: ShinyNAPv2 
# Purpose: UI Dashboard Module
# Author: Artemio Sison III
# R Version: 4.0.1 "See Things Now"
#-------------------------------------------------------------------------------------#

#-------------------------------------------------------------------------------------#
# Load Depencies
#-------------------------------------------------------------------------------------#
library(shiny)


#-------------------------------------------------------------------------------------#
# Create navbar page
#-------------------------------------------------------------------------------------#


# Module UI function
csvFileUI <- function(id, label = "CSV file") {
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    fileInput(ns("file"), label),
    checkboxInput(ns("heading"), "Has heading"),
    selectInput(ns("quote"), "Quote", c(
      "None" = "",
      "Double quote" = "\"",
      "Single quote" = "'"
    ))
  )
}

