install.packages("rvest")
# Load required libraries
library(rvest)

# URL of the subreddit page to scrape
url <- "https://www.reddit.com/r/rprogramming/"

# Send a GET request to the URL and read the content
page <- read_html(url)

# Extract post titles and links
post_titles <- page %>%
  html_nodes(".scrollerItem") %>%  # Class name of the post containers on the page
  html_text()

post_links <- page %>%
  html_nodes(".scrollerItem") %>%  # Class name of the post containers on the page
  html_attr("href")  # Extract the 'href' attribute, which contains the links

# Create a dataframe to store the data
reddit_posts <- data.frame(
  Title = post_titles,
  Link = paste0("https://www.reddit.com", post_links)
)

# Display the dataframe
print(reddit_posts)
