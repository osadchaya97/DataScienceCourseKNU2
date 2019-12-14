filename = "lab4.sqlite"

install.packages("RSQLite")
library(RSQLite)

# 1
conn <- dbConnect(RSQLite::SQLite(), filename)
res = dbSendQuery(conn, "SELECT Title, EventType FROM Papers 
                  WHERE EventType == 'Spotlight' ORDER BY Title")
data = dbFetch(res, n = 10)
print(data)
dbClearResult(res)
dbDisconnect(conn)

# 2
conn <- dbConnect(RSQLite::SQLite(), filename)
res = dbSendQuery(conn, "SELECT Name, Title FROM 
                  (Papers LEFT JOIN PaperAuthors on Papers.Id == PaperId) LEFT JOIN 
                  Authors on PaperAuthors.AuthorId = Authors.Id WHERE
                  Name == 'Josh Tenenbaum' ORDER BY Title"
                  )
data = dbFetch(res, n = 10)
print(data)
dbClearResult(res)

# 3
conn <- dbConnect(RSQLite::SQLite(), filename)
res = dbSendQuery(conn, "SELECT Title FROM Papers 
                  WHERE Title LIKE '%statistical%' ORDER BY Title")
data = dbFetch(res, n = 10)
print(data)
dbClearResult(res)

# 4
conn <- dbConnect(RSQLite::SQLite(), filename)
res = dbSendQuery(conn, "SELECT Name, COUNT(PaperId) AS PaperCount FROM 
                  PaperAuthors LEFT JOIN Authors on PaperAuthors.AuthorId == Authors.Id
                  GROUP BY Name
                  ORDER BY  COUNT(PaperId) DESC")
data = dbFetch(res, n = 10)
print(data)
dbClearResult(res)

