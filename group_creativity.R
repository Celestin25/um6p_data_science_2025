################################################################################
# Research Study: Educational Diversity & Divergent Thinking
# Author: Celestin Hakorimana
# Date: Jan 4th, 2026
# Context: FGSES UM6P Data Analysis Simulation
################################################################################

# 1. Load necessary libraries
if (!require("tidyverse")) {
  install.packages("tidyverse")
}
if (!require("ggpubr")) {
  install.packages("ggpubr")
}
library(tidyverse)
library(ggpubr)

# We are creating dataset based on the simulation description
group_data <- data.frame(
  Group_ID = factor(c("G1", "G2", "G3", "G4", "G5", "G6")),
  Condition = factor(c(
    "Homogeneous",
    "Homogeneous",
    "Diverse",
    "Diverse",
    "Diverse",
    "Diverse"
  )),
  Blau_Index = c(0.00, 0.00, 0.48, 0.56, 0.75, 0.80),

  # Baseline Creativity (ICI) - Should be roughly equal to prove fair start
  Mean_ICI = c(3.45, 3.50, 3.40, 3.55, 3.42, 3.48),

  # Fluency (Total Ideas) - Homogeneous groups work faster -> Higher scores
  Fluency = c(52, 49, 42, 39, 34, 31),

  # Originality (CAT Score 1-7) - Diverse groups have friction -> Better ideas
  Originality = c(3.1, 2.9, 4.3, 4.8, 5.9, 6.2)
)

# View the data
print("Raw Data Table:")
print(group_data)

# we must prove that Diverse groups didn't just start with "smarter" students.

# T-Test: Difference in Baseline Creativity (ICI)
t_test_validity <- t.test(Mean_ICI ~ Condition, data = group_data)
print(t_test_validity)

# Interpretation Logic
if (t_test_validity$p.value > 0.05) {
  print(
    "Result is Non-Significant (p > 0.05). Groups started equal."
  )
} else {
  print("Groups were not equal at the start.")
}
# does Diversity affect Originality?

# Run One-Way ANOVA
anova_orig <- aov(Originality ~ Condition, data = group_data)
summary(anova_orig)

# Boxplot Visualization 
plot_orig <- ggboxplot(
  group_data,
  x = "Condition",
  y = "Originality",
  color = "Condition",
  palette = c("#00AFBB", "#E7B800"),
  add = "jitter",
  title = "Impact of Diversity on Group Originality (CAT Score)"
) +
  stat_compare_means(method = "anova", label.y = 7)

print(plot_orig)

# Linear Regression Model
lm_model <- lm(Originality ~ Blau_Index, data = group_data)
summary(lm_model)

# Regression Visualization
plot_reg <- ggplot(group_data, aes(x = Blau_Index, y = Originality)) +
  geom_point(aes(color = Condition), size = 4) +
  geom_smooth(method = "lm", se = TRUE, color = "black", alpha = 0.2) +
  labs(
    title = "Predicting Innovation: Blau Index vs Originality",
    subtitle = "Strong positive correlation: Diversity drives quality",
    x = "Diversity Score (Blau Index)",
    y = "Originality (1-7)"
  ) +
  theme_minimal()

print(plot_reg)

# show that Homogeneous groups produced MORE ideas (even if less original)

# T-Test for Fluency
t_test_fluency <- t.test(Fluency ~ Condition, data = group_data)


print(t_test_fluency)

# Visualization of Fluency differences
plot_fluency <- ggboxplot(
  group_data,
  x = "Condition",
  y = "Fluency",
  color = "Condition",
  palette = c("#00AFBB", "#E7B800"),
  add = "jitter",
  title = "The 'Efficiency' of Homogeneity (Higher Fluency)"
)

print(plot_fluency)
# Multiple Linear Regression Model
# Predict Originality using: Diversity (Blau) AND Speed (Fluency) AND Baseline Talent (Mean_ICI)

multi_model <- lm(Originality ~ Blau_Index + Fluency + Mean_ICI, data = group_data)

# View the results
summary(multi_model)