getwd()
10-6
x.1 <- 17 # переменна€
x.1
rm(x.1)
x.1
x<- 1:100
x
x[1:8]
10 -8

# основные фунцкии
1+6
1-6
10/2
10:2
10*2
sqrt(25)
log2(8)

help(log)
? sqrt

log(27, base = 3)
log(27, 3)

10^3
10**3

exp(1)

x <- 17

factorial(3)

## работа функции
sqrt(log2(16))

## доступные пакеты https://cran.r-project.org


## part 2
a<-c(0,1,2,3)
a
a[4]
b<-rep(2,3)
b
a
b.1<-rep(2,4)
?rep
b.1
a+b.1

a*3

seq(2,8,by=2) # четные
seq(1,9,by=2) # нечетные
?seq
seq(1,10,length.out = 5)
seq(1,10,by = 2.25)

s<-1:10
s

set.seed(1)
rnorm(n=50,mean=0,sd=1) # задаем нормальное распределение

rpois(100,10) # распределение пуассона
?rpois

set.seed(1)
rbinom(100,10,0.5) # биноминальное распределение

rep(c(0,2),time=2) # повторение 2 раза вектора (0, 2)
# [1] 0 2 0 2
rep(c(0,2),each=2)
# [1] 0 0 2 2

# текстовые векторы
letters
LETTERS
paste(letters,set="_",seq(1,26))
paste0(letters,set="_",seq(1,26)) # не будет пробелов

?ISOdate
format(ISOdate(2019,9,1:30), "%d") # число
format(ISOdate(2019,9,1:30), "%b") # мес€ц
format(ISOdate(2019,9,1:30), "%A") # дни недели

paste(format(ISOdate(2019,9,1:30), "%d"),set="_", format(ISOdate(2019,9,1:30), "%b"))

paste(format(ISOdate(2019,9,1:30), "%d"),set="_", rep("сен",30))

paste0(format(ISOdate(2019,9,1:30), "%d"),set="_", rep("сен",time=30))

# прочие функции

# функци€ class()
a<-c(rep(1,10))
a
class(a)
b<-letters
b
class(b)

class(2!=0)
class(factorial)

# функци€ sample()
d<- c(rep("a",4),rep("b",6),rep("c",2))
d
sample(d)

# функци€ table()
d.table<-table(d)
class(d.table)
d.table

r<- seq(10,1)
r
sum(r)
mean.1<- sum(r)/length(r)
mean.1
mean.2<- mean(r)
mean.2

# функции set.seed(), set(), round()
set.seed(1)
popul<- rnorm(100)
popul

popul.1<- round(popul,3)
popul.1

sort(popul.1)

sort(popul.1,decreasing = TRUE)

# функции sample(), data.frame(), head(), order(), $
set.seed(1)
lets<- sample(letters,100,replace = TRUE)
lets

df<- data.frame(lets,popul.1)
head(df)

# нужно разместить по возрастанию, но теперь каждому значению еще соответсвует буква
ind<- order(df$popul.1)
ind

df.new<-df[ind,]
head(df.new,10)

# действи€ с векторами
g<- seq(31,45)
g
#  [1] 31 32 33 34 35 36 37 38 39 40
#[11] 41 42 43 44 45

length(g)
# [1] 15

g[1]
# [1] 31

g[c(1,5,15)]
# [1] 31 35 45

g[-c(1,5,15)]
#  [1] 32 33 34 36 37 38 39 40 41 42
# [11] 43 44

g[1:5]
# [1] 31 32 33 34 35

h<-1:15
g+h
g*2

## прочие функции
# обучающие наборы данных
data()

# показать наборы данных во всех загруженных датасетах:
data(package = .packages(all.available = TRUE))
search()

?sample
install.packages("cluster")
library(cluster)
animals
?animals

## логические функции и операторы
5>6
61 < 100
5 > 6
2!=2
3==3
10 >= 10
12 <= 12
6 > 7 | 8 > 9
6 > 7 | 10 > 9
6 > 7 & 10 > 9
200!= 100 | 10 <= 6
((TRUE==FALSE)& (1==1)) & 100 == 100
((TRUE==FALSE)& (1==1)) | 100 == 100

# пропущенные значени€ в датасете animals
is.na(animals)
sum(is.na(animals))
animals

head(animals,3)

animals$gro # показать столбец gro

animals$gro[is.na(animals$gro)]

animals$gro[!is.na(animals[,5])] # не-NA в 5-м столбце


?iris
head(iris,10)
tail(iris) # последние строки набора iris
dim(iris) # размер набора данных
str(iris) # 150 строк

unique(iris$Species) # уникальные значени€ в столбце Species

levels(iris$Species)
iris[1,1] # значение в 1-й строке 1-м столбце
head(iris)

traindat<-iris[1:5,c(2,3,5)]
traindat
traindat[traindat$Sepal.Width>3,] # важно поставить зап€тую (т.е. по строкам)
traindat[traindat$Sepal.Width>3 & traindat$Petal.Length>1.4,]


# строим свой dataset

weight<- c(78,56,67,48,69,90)
height<- c(170,160,165,159,170,185)
sex<- c(rep("F",3),rep("M",3))
sex
class(sex)

# stringsAsFactors = F - последний вектор текстовой, не фактор
df.1<- data.frame(weight,height,sex,stringsAsFactors = F)
df.1
str(df.1)

?data.frame

# stringsAsFactors = T - последний вектор - это фактор
df.2<- data.frame(weight,height,sex,stringsAsFactors = T)
df.2
str(df.2)

unique(sex)
factor(sex)
levels(factor(sex))

## построим матрицу
# 1-й способ
m<- 1:30 # вектор из 30-и элементов
m
dim(m)

z<- c(10,3)
z

dim(m)
dim(m)<-z # из вектора задаем матрицу 10х3
m
class(m)

# 2-й способ
y<- 1:50 # вектор из 50-и элементов
y

mt<-matrix(y,10,5) # из вектора задаем матрицу 10х5
mt

imena<- LETTERS[1:10] # задаем имена
imena

cbind(imena,mt) # возникла проблема - с такой матрицей невозможно работать
class(cbind(imena,mt))

########
?rownames
rownames(mt)
colnames(mt)
rownames(mt,do.NULL = T, prefix = "row")
rownames(mt)<-imena
mt

colnames(mt,do.NULL = TRUE, prefix = "col")
colnames(mt) <- paste("day",1:5)
mt

mt[,2] # 2-й столбец

mt[2,] # 2-€ строка



