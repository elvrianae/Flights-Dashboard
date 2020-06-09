# Flight-Dashboard using Shiny. 
# Written by : Elvriana Elvani
# Department of Business statistics, Matana University (Tangerang)
# Notes: Please don't share this code anywhere (It's just for you)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

source("global.R", local = TRUE)

ui <- dashboardPage(title = "www.elvrianaelvani.com",
                    
      # Header
      dashboardHeader(title = "Flights-Dashboard",titleWidth = 200,
                      tags$li(class = "dropdown", 
                              tags$img(src = 'Matana.png', height = 40, width = 40, 
                                       type = "image/png", style = "margin-top: 5px; margin-right: 5px;"))),
                    
      # Side bar of the Dashboard
      dashboardSidebar(
        selectInput(
          inputId = "airline",
          label = "Airline:",
          choices = airline_list,
          selected = "DL",
          selectize = FALSE),
        
      # Side menu of the Dashboard  
      sidebarMenu(
        selectInput(
          inputId = "month",
          label = "Month:",
          choices = month_list,
          selected = 99,
          selectize = FALSE),
        actionLink("remove", icon = icon("sync-alt"),"Remove detail tabs"),
        menuItem("Source Code", icon = icon("github"), href = "https://github.com/elvrianae/Flights-Dashboard"),
        menuItem("About Me", icon = icon("linkedin"), href = "https://www.linkedin.com/in/elvriana-elvani-0481511a3/"),
        menuItem("Video", icon = icon("youtube"), href = "https://youtu.be/b23VoekjcrU")
        )
      ),
      
      # The body of the dashboard
      dashboardBody(
        tabsetPanel(id = "tabs",
          tabPanel(title = "Main Dashboard",
          value = "page1",
        fluidRow(valueBoxOutput("total_flights"),
                 valueBoxOutput("per_day"),
                 valueBoxOutput("percent_delayed")),
        fluidRow(column(width = 6,d3Output("group_totals")),
                 column(width = 6,d3Output("top_airports")))
      )
    )
  )
)
