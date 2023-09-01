getwd() 
setwd("C:/Users/fbths/Desktop/중앙_미니 프로젝트")

#install.packages('foreign')
library(foreign)
library(dplyr)

### sav 문서 불러오기
library(foreign)
real14 <- read.spss("외래 관광객 실태조사 원자료/2014년 외래관광객 실태조사 원자료.sav", to.data.frame=T, reencode='utf-8')
real15 <- read.spss("외래 관광객 실태조사 원자료/2015년 외래관광객 실태조사 원자료.sav", to.data.frame=T, reencode='cp949')
real16 <- read.spss("외래 관광객 실태조사 원자료/2016년 외래관광객 실태조사 원자료.sav", to.data.frame=T, reencode='cp949')
real17 <- read.spss("외래 관광객 실태조사 원자료/2017년 외래관광객 실태조사 원자료.sav", to.data.frame=T, reencode='cp949')
real18 <- read.spss("외래 관광객 실태조사 원자료/2018년 외래관광객 실태조사 원자료.sav", to.data.frame=T, reencode='cp949')
real19 <- read.spss("외래 관광객 실태조사 원자료/2019년 외래관광객 실태조사 원자료.sav", to.data.frame=T, reencode='utf-8')

### year 컬럼 추가
real14$year <- 2014
real15$year <- 2015
real16$year <- 2016
real17$year <- 2017
real18$year <- 2018
real19$year <- 2019

### 태국인 데이터만 추출
real14 <- real14 %>% select(nat,q5,q8b,q11a1,q11a2,q11a3,q12a1,q12a2,q12a3,q12b1,q12b2,q12b3,mtzq19,sex,age,year) %>% filter(nat=='    태          국')
real15 <- real15 %>% select(nat,q5,q8b,q11a1,q11a2,q11a3,q12a1,q12a2,q12a3,q12b1,q12b2,q12b3,mtzq19,sex,age,year) %>% filter(nat=='    태          국')
real16 <- real16 %>% select(nat,q5,q8b,q11a1,q11a2,q11a3,q12a1,q12a2,q12a3,q12b1,q12b2,q12b3,mtzq19,sex,age,year) %>% filter(nat=='    태          국')
real17<- real17 %>% select(nat,q5,q8b,q11a1,q11a2,q11a3,q12a1,q12a2,q12a3,q12b1,q12b2,q12b3,mtzq19_1 ,sex,age,year)%>% filter(nat=='태국')
real18 <- real18 %>% select(D_COU,Q5_1,Q9_2A1,Q11A1,Q11A2,Q11A3,Q12_1A1,Q12_1A2,Q12_1A3,Q12_2A1,Q12_2A2,Q12_2A3,MQ14_1T,D_GEN,D_AGE,year) %>% filter(D_COU=='    태              국')
real19 <- real19 %>% select(D_COU1,Q5_1, Q9_2A1, Q10_2A1, Q10_2A2, Q10_2A3, Q11_1A1, Q11_1A2, Q11_1A3, Q11_2A1, Q11_2A2, Q11_2A3, MQ14_1T, D_GEN, D_AGE,year) %>% filter(D_COU1=='태              국')

### 컬럼명 바꾸기
colnames(real14) <- c('country', 'purpose', 'favact','favplace1', 'favplace2', 'favplace3', 'sitem1', 'sitem2', 'sitem3', 'splace1', 'splace2', 'splace3','expense', 'sex', 'age' , 'year')
colnames(real15) <- c('country', 'purpose', 'favact','favplace1', 'favplace2', 'favplace3', 'sitem1', 'sitem2', 'sitem3', 'splace1', 'splace2', 'splace3','expense', 'sex', 'age' , 'year')
colnames(real16) <- c('country', 'purpose', 'favact','favplace1', 'favplace2', 'favplace3', 'sitem1', 'sitem2', 'sitem3', 'splace1', 'splace2', 'splace3','expense', 'sex', 'age' , 'year')
colnames(real17) <- c('country', 'purpose', 'favact','favplace1', 'favplace2', 'favplace3', 'sitem1', 'sitem2', 'sitem3', 'splace1', 'splace2', 'splace3','expense', 'sex', 'age' , 'year')
colnames(real18) <- c('country', 'purpose', 'favact','favplace1', 'favplace2', 'favplace3', 'sitem1', 'sitem2', 'sitem3', 'splace1', 'splace2', 'splace3','expense', 'sex', 'age' , 'year')
colnames(real19) <- c('country', 'purpose', 'favact','favplace1', 'favplace2', 'favplace3', 'sitem1', 'sitem2', 'sitem3', 'splace1', 'splace2', 'splace3','expense', 'sex', 'age' , 'year')

####공백 모두 제거
library(stringr)
real14$country <- str_replace_all(real14$country, " ", "")
real14$sex<- str_replace_all(real14$sex, " ", "")
real14$age<- str_replace_all(real14$age, " ", "")
real15$country <- str_replace_all(real15$country, " ", "")
real15$sex<- str_replace_all(real15$sex, " ", "")
real15$age<- str_replace_all(real15$age, " ", "")
real16$country <- str_replace_all(real16$country, " ", "")
real16$sex<- str_replace_all(real16$sex, " ", "")
real16$age<- str_replace_all(real16$age, " ", "")
real17$country <- str_replace_all(real17$country, " ", "")
real17$sex<- str_replace_all(real17$sex, " ", "")
real17$age<- str_replace_all(real17$age, " ", "")
real18$country <- str_replace_all(real18$country, " ", "")
real18$sex<- str_replace_all(real18$sex, " ", "")
real18$age<- str_replace_all(real18$age, " ", "")
real19$country <- str_replace_all(real19$country, " ", "")
real19$sex<- str_replace_all(real19$sex, " ", "")
real19$age<- str_replace_all(real19$age, " ", "")

real <- bind_rows(real14, real15, real16, real17, real18, real19)

write.csv(real, 'real1419.csv')



