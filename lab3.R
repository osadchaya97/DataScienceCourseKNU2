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
#Result
[1] "Зоряні війни: Епізод 8 - Останні Джедаї" "Джуманджі: Поклик джунглів"             
[3] "Тор: Рагнарок"                           "Воно"                                   
[5] "Той, хто біжить по лезу 2049"            "Найвеличнiший шоумен"   


# 2) Всі назви фільмів з тривалістю більше 120 хв
movies[movies$runtime_data>120, 2]
#Result
[1] "Зоряні війни: Епізод 8 - Останні Джедаї"  "Тор: Рагнарок"                           
 [3] "Воно"                                     "Той, хто біжить по лезу 2049"            
 [5] "Пострiл в безодню"                        "Call Me by Your Name"                    
 [7] "Вартові Галактики 2"                      "Король Артур: Легенда меча"              
 [9] "Логан: Росомаха"                          "Форма води"                              
[11] "Красуня i Чудовисько"                     "Kingsman: Золоте кiльце"                 
[13] "Людина-павук: Повернення додому"          "Чужий: Заповiт"                          
[15] "Диво-Жiнка"                               "Джон Уiк 2"                              
[17] "Усi грошi свiту"                          "Пірати Карибського моря: Помста Салазара"
[19] "Валерiан i мiсто тисячi планет"           "Гра Моллi"                               
[21] "Трансформери: Останнiй лицар"             "Мати!"                                   
[23] "Зменшення"                                "Примарна нитка"                          
[25] "Saban's Могутнi рейнджери"                "Форсаж 8"                                
[27] "Темнi часи"                               "Вiйна за планету мавп"                   
[29] "Вбивство священного оленя"                "Only the Brave"                          
[31] "1+1: Нова iсторiя"                        "Сiм сестер"                              
[33] "Вороги"                                   "Метелик"                                 
[35] "Brawl in Cell Block 99"                  

# 3) Скільки фільмів мають тривалість менше 100 хв?
nrow(movies[movies$runtime_data<100,])
#Result
[1] 13
