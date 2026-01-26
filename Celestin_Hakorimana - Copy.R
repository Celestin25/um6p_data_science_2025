################################################################################
# Student Name: Celestin Hakorimana
# Course: Data Science 1 - Contest Entry
# Date: Jan 4th, 2026
# File Name: Celestin_Hakorimana.R
# Description: Analysis of Class Promo06 Demographics (Nationality & Gender)
################################################################################
# Load necessary library
install.packages("tidyverse")
library(tidyverse)
install.packages("dplyr")
library(dplyr)
# Dataframe based on the provided class composition
# Counts:
# Morocco: 7 F, 1 M
# Nigeria: 2 F, 11 M
# Rwanda: 2 F, 1 M
# Ghana: 0 F, 1 M
# Ivory Coast: 0 F, 1 M
# creating the vectors for each country.
morocco <- data.frame(
    Nationality = rep("Morocco", 8),
    Gender = c(rep("Female", 7), "Male")
)
nigeria <- data.frame(
    Nationality = rep("Nigeria", 13),
    Gender = c(rep("Female", 2), rep("Male", 11))
)
rwanda <- data.frame(
    Nationality = rep("Rwanda", 3),
    Gender = c(rep("Female", 2), "Male")
)
ghana <- data.frame(Nationality = rep("Ghana", 1), Gender = "Male")
ivory <- data.frame(Nationality = rep("Ivory Coast", 1), Gender = "Male")
# combining data into one dataframe
class_data <- bind_rows(morocco, nigeria, rwanda, ghana, ivory)


# adding Student IDs with three digits  (S001 to S026)
class_data$Student_ID <- sprintf("S%03d", 1:nrow(class_data))

# putting the columns on a specific order
class_data <- class_data %>% select(Student_ID, Nationality, Gender)

# displaying the data structure using str() function.
structure <- str(class_data)
# ##########################################################
# 1. CLASS COMPOSITION
# Question: "How is the class distributed across nationalities,
#            and what is the gender volume within these groups?"
# #########################################################
p1 <- class_data %>%
    count(Nationality, Gender) %>%
    group_by(Nationality) %>%
    mutate(Total = sum(n)) %>%
    ungroup() %>%
    mutate(Nationality = reorder(Nationality, Total)) %>%
    ggplot(aes(x = n, y = Nationality, Total, fill = Gender)) +
    geom_bar(stat = "identity", position = "stack", width = 0.7) +
    geom_text(
        aes(label = n),
        position = position_stack(vjust = 0.5),
        color = "white",
        size = 3,
        fontface = "bold"
    ) +

    # customizing colors for both female and male and giving a titles and captions.
    scale_fill_manual(values = c("Female" = "#008080", "Male" = "#2F4F4F")) +
    labs(
        title = "Class Demographics: Nationality & Gender Breakdown",
        subtitle = "Nigeria and Morocco represent the largest student cohorts with opposing gender dominance",
        x = "Number of Students",
        y = "",
        caption = "Data Source: Class Promo06 Records"
    ) +
    theme_minimal() +
    theme(
        plot.title = element_text(face = "bold", size = 14),
        panel.grid.major.y = element_blank(),
        legend.position = "top"
    )
# saving the graph in png format
ggsave(
    "Graph1_Class_Composition.png",
    plot = p1,
    width = 8,
    height = 5,
    dpi = 300
)
#############################################################
## GRAPH 2: GENDER BALANCE INDEX
## Question: "Which nationalities are driving Female representation
##            in the cohort?" Percentage of Females per Nationality.
#############################################################
p2 <- class_data %>%
    group_by(Nationality) %>%
    summarise(
        Total = n(),
        Female_Count = sum(Gender == "Female"),
        P_Female = (Female_Count / Total) * 100
    ) %>%
    # putting Nationality on the x-axis and the percentage on the y-axis.
    mutate(Nationality = reorder(Nationality, P_Female)) %>%
    ggplot(aes(x = Nationality, y = P_Female)) +
    geom_segment(
        aes(x = Nationality, xend = Nationality, y = 0, yend = P_Female),
        color = "gray50",
        size = 1
    ) +
    geom_point(aes(size = Total, color = P_Female), show.legend = F) +
    # adding the a Line to the graph at 50%  to check which country has passed the parity line.
    geom_hline(
        yintercept = 50,
        linetype = "dashed",
        color = "red",
        alpha = 0.5
    ) +
    annotate(
        "text",
        x = 1,
        y = 52,
        label = "Gender Parity (50%)",
        color = "red",
        size = 3,
        hjust = 0
    ) +
    # adding labels on top of points on every country
    geom_text(
        aes(label = paste0(round(P_Female, 0), "%")),
        vjust = -1.2,
        size = 3.5,
        fontface = "bold"
    ) +
    scale_y_continuous(limits = c(0, 100), labels = function(x) {
        paste0(x, "%")
    }) +
    scale_color_gradient(low = "#2F4F4F", high = "#008080") +
    labs(
        title = "The 'Female-Drive' Index",
        subtitle = "Percentage of Female students per Nationality (Size of bubble = Total Students)",
        x = "",
        y = "Percentage Female",
        caption = "Note: Rwanda and Morocco are the only female-majority cohorts"
    ) +
    theme_classic() +
    theme(
        plot.title = element_text(face = "bold", size = 14),
        axis.line.y = element_blank(),
        axis.ticks.y = element_blank()
    )
# Save the graph as a png file
ggsave(
    "Graph2_Gender_Balance_Index.png",
    plot = p2,
    width = 8,
    height = 5,
    dpi = 300
)
