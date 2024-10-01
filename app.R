
library(shiny)
library(ggplot2)
library(dplyr)


personal_info <- data.frame(
  Name = "Lahcen Assmira",
  Background = "Student in Economics and Management, Web Development Enthusiast",
  Interests = c("Web Development", "SaaS", "AI", "Finance")
)

education <- data.frame(
  Degree = c("Bachelor's in Management", "Finance Courses"),
  Institution = c("Faculté des Sciences Juridiques, Économiques et Sociales de Ain Chock", "Online"),
  Year = c(2023, 2024)
)

projects <- data.frame(
  Project = c("URL Shortener", "Online Marketplace", "SaaS Expense Tracker"),
  Technologies = c("Node.js, Express, MongoDB", "HTML, CSS, JavaScript", "MERN Stack"),
  Status = c("Completed", "Ongoing", "Completed")
)

skills <- data.frame(
  Skill = c("HTML", "CSS", "JavaScript", "Node.js", "React", "MongoDB"),
  Proficiency = c(85, 80, 75, 70, 65, 60)  # Percentage completion
)


ui <- fluidPage(
  titlePanel("Lahcen Assmira's Portfolio Dashboard"),
  
  tabsetPanel(
    tabPanel("Personal Info", 
             h3("Personal Information"),
             tableOutput("personalInfo")),
    
    tabPanel("Education", 
             h3("Educational Background"),
             tableOutput("educationTable")),
    
    tabPanel("Projects", 
             h3("Web Development Projects"),
             tableOutput("projectsTable")),
    
    tabPanel("Skills Progress", 
             h3("Skills and Progress"),
             plotOutput("skillsPlot"))
  )
)

server <- function(input, output) {

  output$personalInfo <- renderTable({
    personal_info
  })
  
 
  output$educationTable <- renderTable({
    education
  })
  

  output$projectsTable <- renderTable({
    projects
  })
  

  output$skillsPlot <- renderPlot({
    ggplot(skills, aes(x = Skill, y = Proficiency, fill = Skill)) +
      geom_bar(stat = "identity") +
      ylim(0, 100) +
      labs(title = "Skills Proficiency", x = "Skill", y = "Proficiency (%)") +
      theme_minimal()
  })
}


shinyApp(ui = ui, server = server)
