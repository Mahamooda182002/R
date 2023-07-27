install.packages("tm")
install.packages("proxy")
# Load required libraries
library(tm)
library(proxy)

# Sample movie data (you can replace this with your own dataset)
movies <- data.frame(
  Movie = c("Movie 1", "Movie 2", "Movie 3", "Movie 4", "Movie 5"),
  Genre = c("Action, Adventure", "Action, Comedy", "Drama, Romance", "Action", "Comedy")
)

# Function to preprocess the genres and create a document-term matrix
preprocess_genres <- function(genres) {
  genres <- tolower(genres)                  # Convert to lowercase
  genres <- gsub("[[:punct:]]", "", genres)  # Remove punctuation
  Corpus(VectorSource(genres))
}

# Function to recommend movies based on input genre(s)
recommend_movies <- function(input_genre, data) {
  # Preprocess input genre(s) and movie genres
  input_genre_corpus <- preprocess_genres(input_genre)
  movie_genres_corpus <- preprocess_genres(data$Genre)
  
  # Create a document-term matrix for input and movie genres
  dtm_input_genre <- DocumentTermMatrix(input_genre_corpus)
  dtm_movie_genres <- DocumentTermMatrix(movie_genres_corpus)
  
  # Calculate cosine similarity between input genre and movie genres
  similarity_scores <- proxy::similarity(dtm_input_genre, dtm_movie_genres, method = "cosine")
  
  # Get the index of the movie with the highest similarity score
  recommended_movie_index <- which.max(similarity_scores)
  
  # Return the recommended movie
  data$Movie[recommended_movie_index]
}

# Example usage:
# Enter the input genre(s) as a string, e.g., "Action, Adventure"
input_genre <- "Action, Adventure"
recommended_movie <- recommend_movies(input_genre, movies)

# Print the recommended movie
cat("Recommended Movie:", recommended_movie, "\n")


