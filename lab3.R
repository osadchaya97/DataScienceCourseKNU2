install.packages("rvest")
library(rvest)

data <- read_html('http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature')

rank <- html_nodes(data, ".text-primary")
rank_data <- as.numeric(html_text(rank))

title <- html_nodes(data, ".lister-item-header a")
title_data <- html_text(title)

runtime <- html_nodes(data, '.text-muted .runtime')
runtime_data <- as.numeric(gsub(" min", "", html_text(runtime)))

movies <- data.frame(rank_data, title_data, runtime_data, stringsAsFactors = FALSE)

# 1) перші 6 фільмів
movies[c(1:6),2]

# 2) Всі назви фільмів з тривалістю більше 120 хв
movies[movies$runtime_data>120, 2]

# 3) Скільки фільмів мають тривалість менше 100 хв?
nrow(movies[movies$runtime_data<100,])