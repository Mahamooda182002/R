# Convert DTM to a data frame
dtm_df <- as.data.frame(as.matrix(dtm))

# Calculate word frequencies
word_freq <- colSums(dtm_df)

# Sort words by frequency in descending order
word_freq <- sort(word_freq, decreasing = TRUE)

# Display the most frequent words
top_words <- head(word_freq, 10)
print(top_words)
# Create a bar plot for top words
top_words_df <- data.frame(word = names(top_words), freq = top_words)

ggplot(top_words_df, aes(x = reorder(word, -freq), y = freq)) +
  geom_bar(stat = "identity", fill = "blue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Top 10 Most Frequent Words", x = "Word", y = "Frequency")
