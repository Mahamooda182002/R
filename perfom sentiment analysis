# Load sentiment lexicon (AFINN lexicon in this example)
library(tidytext)
data("get_sentiments")
sentiment_lexicon <- get_sentiments("afinn")

# Calculate sentiment scores for each document
sentiment_scores <- inner_join(dtm_df, sentiment_lexicon, by = "row.names") %>%
  select(-row.names) %>%
  group_by(Sentiment) %>%
  summarise(sentiment_score = sum(score))

# Visualize sentiment scores
ggplot(sentiment_scores, aes(x = Sentiment, y = sentiment_score, fill = Sentiment)) +
  geom_bar(stat = "identity") +
  labs(title = "Sentiment Analysis", x = "Sentiment", y = "Sentiment Score") +
  theme_minimal()
