library(tidyverse)
library(lsmeans)
library(lme4)

set.seed(1234)
my_random_numbers <- rnorm(1000, 0, 1)
sample(my_random_numbers, size = 5)

factorial_data <- read_csv("https://raw.githubusercontent.com/ajstewartlang/15_mixed_models_pt1/master/data/2x2.csv")

tidied_factorial_data <- factorial_data %>%
  mutate(subject = factor(Subject), item = factor(Item), RT = RT,
         context = factor(Context), sentence = factor(Sentence))

tidied_factorial_data %>%
  filter(!is.na(RT)) %>%
  ggplot(aes(x = context:sentence, y = RT, colour = context:sentence)) +
  geom_violin() +
  geom_jitter(width = .1, alpha = .2) +
  guides(colour = FALSE) +
  labs(x = "Context X Sentence",
       y = "RT (ms.)") +
  theme_minimal() +
  coord_flip()

contrasts(tidied_factorial_data$context) <- matrix(c(.5, -.5))
contrasts(tidied_factorial_data$sentence) <- matrix(c(.5, -.5))

factorial_model <- lmer(RT ~ context * sentence + 
                          (1 + context + sentence | subject) +
                          (1 + context * sentence | item), 
                        data = tidied_factorial_data)

emmeans(factorial_model, pairwise ~ context*sentence, adjust = "none")
