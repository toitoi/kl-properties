navbarPage(
  
  # Application title
  "Kuala Lumpur Properties Price",
  
  tabPanel(
    "Interactive Map",
    div(
      class = "outer",
      tags$head(
        includeCSS("styles.css")
      ),
      absolutePanel(
        id = "controls",
        class = "panel panel-default",
        fixed = TRUE,
        draggable = FALSE,
        top = 55,
        left = "auto",
        right = 10,
        bottom = "auto",
        width = "30%",
        height = "100%",
        
        h2("Choose something:"),
        selectInput("selected_view", "Select view", g_option_view)
      ),
      
      # If not using custom CSS, set height of leafletOutput to a number instead of percent
      leafletOutput("map", width = "70%", height = "100%")
      
  
    )
  ), 
  tabPanel(
    "Raw Data",
    class = "outer",
    bootstrapPage(
      div(DT::dataTableOutput("rawDataTable"),
          style = "height: 100%; padding: 15px; overflow-y: auto;"
      )
    )
  ), 
  tabPanel(
    "Processed Data",
    class = "outer",
    bootstrapPage(
      div(DT::dataTableOutput("processedDataTable"),
          style = "height: 100%; padding: 15px; overflow-y: auto;"
      )
    )
  ),
  tabPanel(
    "Forum Post Analysis",
    class = "outer",
    bootstrapPage(
      div(
        style = "height: 100%; padding: 15px; overflow-y: auto",
        
        # Input wrapper
        div(
          textInput("topicUrl", 'Topic URL (lowyat.net) only : ', value = 'https://forum.lowyat.net/topic/4001664', width = NULL,
                    placeholder = NULL),
          
          numericInput("lastPost", 'Last Post # : ', 100, min = 10, max = 1000, step = 20,
                       width = NULL),
          submitButton('Submit')
        ),

        # Output wrapper
        div(
          style = "margin-top: 30px;",
          
          # display the Topic Title here.
          h2(textOutput("topicTitle"), style = "text-align: center; margin-bottom: 15px;"),
          
          # render the wordcloud2 here.
          wordcloud2::wordcloud2Output('wc2')
        )
      )
    )
  )
  
)