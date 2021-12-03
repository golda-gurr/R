## Метод Монте-Карло
a<-c(1,1,1,1,1,0,0,0)
a
b<-c(1,1,1,1,1,0,0,0,0,0,0,0)
b
sam.a<-sample(a,2)
sam.b<-sample(b,4)

sam.a
#[1] 1 1

sam.b
#[1] 1 0 1 0

c(sam.a,sam.b)
#[1] 1 1 1 0 1 0

s<-sum(c(sam.a,sam.b))
s
#[1] 4

#построим этот вектор очень много раз, 
#посчитаем сумму и затем вычислим долю тех 
#значений, которые равны трем.
#Эта пропорция и будет вероятность того, 
#что мы вытащим ровно три белых мяча.

mc<-function(m,n){sam.a<-sample(a,m)
sam.b<-sample(b,n)
s<-sum(c(sam.a,sam.b))
}

m<-replicate(100,mc(2,4))
m
mean(m==3)
#[1] 0.34

m.1<-replicate(10000,mc(2,4))
mean(m.1==3)
#[1] 0.3663

m.1<-replicate(100000,mc(2,4))
mean(m.1==3)
#[1] 0.3689

m.1<-replicate(1000000,mc(2,4))
mean(m.1==3)
#[1] 0.368422


## Пакет “dplyr”

# оператор pipe : %>%
iris %>% dim 
#[1] 150   5

iris %>%  filter(Species=="versicolor")

iris %>%  filter(Species=="versicolor")%>% select(Petal.Length)

iris %>%  filter(Species=="versicolor")%>% select(Petal.Length)%>% unlist

vc<-as.numeric(iris %>%  filter(Species=="versicolor")%>% select(Petal.Length)%>% unlist)
vc

#с помощью оператора %in% посмотрим, 
#сколько совпадений в длине лепестков 
#двух разных видов цветка

vg<-as.numeric(iris %>%  filter(Species=="virginica")%>% select(Petal.Length)%>% unlist)
vg

# ищем совпадения значений
vc %in% vg

sum( vc %in% vg )


## Чтение данных из интернет

install.packages("rvest")
library(rvest)

url1<-paste0("https://biometry.nci.nih.gov/cdas/datasets/nlst/")
url1

htl<-read_html(url1)
htl
tabl <- htl %>% html_nodes("table")
tabl

tabl <- tabl[[1]] %>% html_table # загружаем нужную таблицу
head(tabl)

class(tabl)

tabl <- tabl %>% setNames(c("data", "discription"))
head(tabl)

# Рассмотрим первый столбец  датафрэйма

tabl$data
class(tabl$data)

t1 <- sub(pattern = "\n            \n            ", replacement=" ",tabl$data)
t1

# Предположим, что нам нужно оставить только “Dictionary”
t1[1]
strsplit(t1[1],split = NULL)

class(strsplit(t1[1],split = NULL))
#[1] "list"

length(strsplit(t1[1],split = NULL))
#[1] 1

vec <- unlist(strsplit(t1[1],split = NULL))
vec
class(vec)
#[1] "character"

length(vec)
#[1] 32

vec[1:10]
vec[1:15]

substr(t1[1], start=6, stop=15)
#[1] "Dictionary"

Dictionary_number <- substr(t1, 6, 15)
Dictionary_number

Dictionary_final <- paste0(Dictionary_number, set="_",1:15)
Dictionary_final

# Рассмотрим второй столбец  датафрэйма
tabl$discription

discription <- tabl$discription
discription[1]

discription_new <- sub(".\n                \n                    ", replacement="", discription)
discription_new

discription_new <- substr(discription_new, start=3, stop=nchar(discription_new))
discription_new

discription <- paste0("T",discription_new[1:9])
New_Discription2 <- c(discription, discription_new[10:15])
New_Discription2

# Новые обработанные переменные объединим в датафрэйм

# изменим на строчную букву левый столбец
data.frame(tolower(Dictionary_final), New_Discription2)

# Воспользуемся функцией data_frame из пакета dplyr
# Эта функция делает данные читаемыми, легкими для восприятия

library(dplyr)
data_frame(tolower(Dictionary_final), New_Discription2)
