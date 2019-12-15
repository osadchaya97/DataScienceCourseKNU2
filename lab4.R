filename = "lab4.sqlite"

install.packages("RSQLite")
library(RSQLite)

# 1
library(RSQLite)
library(DBI)
conn <- dbConnect(RSQLite::SQLite(), "C:/Users/KaterynaOsadcha/Downloads/database.sqlite")
res <- dbSendQuery(conn, "SELECT Name as Author 
                          FROM Authors 
                          ORDER BY Name")
df <- dbFetch(res, n=10)
dbClearResult(res)
dbDisconnect(conn)
df
#Result
> df
               Author
1       ABHISEK KUNDU
2      Aaditya Ramdas
3  Aaron C. Courville
4         Aaron Klein
5          Aaron Roth
6         Aarti Singh
7   Abbas Abdolmaleki
8  Abhradeep Thakurta
9          Adam Smith
10      Adarsh Prasad

# 2
conn2 <- dbConnect(RSQLite::SQLite(), "C:/Users/KaterynaOsadcha/Downloads/database.sqlite")
res2 <- dbSendQuery(conn2, "SELECT Name, Title
                            FROM Authors INNER JOIN PaperAuthors ON Authors.Id = PaperAuthors.AuthorID 
                            INNER JOIN Papers ON PaperAuthors.PaperId = Papers.Id
                            WHERE Name = 'Josh Tenenbaum'
                            ORDER BY Title")
df2 <- dbFetch(res2, n=10)
dbClearResult(res2)
dbDisconnect(conn2)
df2

#Result
            Name                                                                                             Title
1 Josh Tenenbaum                                                       Deep Convolutional Inverse Graphics Network
2 Josh Tenenbaum Galileo: Perceiving Physical Object Properties by Integrating a Physics Engine with Deep Learning
3 Josh Tenenbaum                                                Softstar: Heuristic-Guided Probabilistic Inference
4 Josh Tenenbaum                                                        Unsupervised Learning by Program Synthesis

# 3
conn3 <- dbConnect(RSQLite::SQLite(), "C:/Users/KaterynaOsadcha/Downloads/database.sqlite")
res3 <- dbSendQuery(conn3, "SELECT Title 
                            FROM Papers
                            WHERE Title LIKE '%statistical%'
                            ORDER BY Title")
df3 <- dbFetch(res3, n=10)
dbClearResult(res3)
dbDisconnect(conn3)
df3

#Result
                                                                                 Title
1 Adaptive Primal-Dual Splitting Methods for Statistical Learning and Image Processing
2                                Evaluating the statistical significance of biclusters
3                  Fast Randomized Kernel Ridge Regression with Statistical Guarantees
4     High Dimensional EM Algorithm: Statistical Optimization and Asymptotic Normality
5                Non-convex Statistical Optimization for Sparse Tensor Graphical Model
6            Regularized EM Algorithms: A Unified Framework and Statistical Guarantees
7                            Statistical Model Criticism using Kernel Two Sample Tests
8                         Statistical Topological Data Analysis - A Kernel Perspective

# 4
conn <- dbConnect(RSQLite::SQLite(), filename)
res = dbSendQuery(conn, "SELECT Name, COUNT(PaperId) AS PaperCount FROM 
                  PaperAuthors LEFT JOIN Authors on PaperAuthors.AuthorId == Authors.Id
                  GROUP BY Name
                  ORDER BY  COUNT(PaperId) DESC")
data = dbFetch(res, n = 10)
print(data)
dbClearResult(res)
#Result
                   Name NumPapers
1  Pradeep K. Ravikumar         7
2               Han Liu         6
3        Lawrence Carin         6
4   Inderjit S. Dhillon         5
5               Le Song         5
6     Zoubin Ghahramani         5
7        Christopher Ré         4
8      Csaba Szepesvari         4
9           Honglak Lee         4
10       Josh Tenenbaum         4
