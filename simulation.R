set.seed(123)
simulation_data <- data.frame(
  Group_ID = c("G1", "G2", "G3", "G4", "G5", "G6"),
  Condition = c(
    "Homogeneous",
    "Homogeneous",
    "Diverse",
    "Diverse",
    "Diverse",
    "Diverse"
  ),
  Blau_Index = c(0.00, 0.00, 0.48, 0.56, 0.75, 0.80)
)
simulation_data <- simulation_data %>%
  rowwise() %>%
  mutate(
    Mean_ICI = round(rnorm(n = 1, mean = 3.5, sd = 0.2), 2),

    Fluency = if_else(
      Condition == "Homogeneous",
      rpois(n = 1, lambda = 50),
      rpois(n = 1, lambda = 35)
    ),

    Originality_Raw = if_else(
      Condition == "Homogeneous",
      rnorm(n = 1, mean = 3.0, sd = 0.5),
      rnorm(n = 1, mean = 6.0, sd = 0.5)
    ),
    Originality = round(pmin(pmax(Originality_Raw, 1), 7), 1)
  ) %>%
  select(-Originality_Raw)

# 4. View Result
print(simulation_data)
