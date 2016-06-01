#import the data
boxmojodata = read.csv("boxmojodata.csv");
imdbdata = read.csv("imdbdata.csv");

#extract the year information and month, maybe you can use it later
boxmojodata$release_date = as.character(boxmojodata$release_date);
boxmojodata$release_date2 = as.Date(boxmojodata$release_date);
boxmojodata$year = format(boxmojodata$release_date2,"%Y"); 
boxmojodata$month = format(boxmojodata$release_date2,"%m");
boxmojodata$day = format(boxmojodata$release_date2,"%d");

#count how many weeks of each movie and find some outliers
movie.weeks = table(boxmojodata$title);
summary(as.numeric(movie.weeks))
hist(movie.weeks)
movie.weeks[movie.weeks>200]
#boxmojodata[boxmojodata$title=="Hubble 3D",]

#only keep one week data of boxmojo
boxmojodata = boxmojodata[!duplicated(boxmojodata[,c("title","total_gross")]),];
imdbdata = imdbdata[!duplicated(imdbdata$title),];  #this is for simplicity, some different movie do have same name

#keep the same movie 
boxtitles = unique(boxmojodata$title);
imdbtitles = unique(imdbdata$title);
table(boxtitles%in%imdbtitles); # %in% means whether set A has elements of set B
#get the same titles
sametitles = boxtitles[boxtitles%in%imdbtitles];
#only keep the same title movie
length(sametitles)
boxmojodata.same = boxmojodata[boxmojodata$title%in%sametitles,]
imdbdata.same = imdbdata[imdbdata$title%in%sametitles,]
nrow(boxmojodata.same)
nrow(imdbdata.same)
#in imdbdata.same, some movies have same titles, so we should be careful when we combine the two dataset
#remove some movies that have same name, but they are different movies in different year
imdb.remove.rows = NULL;
for(i in 1:nrow(imdbdata.same))
{
  imdb.moviei.data = imdbdata.same[i,];
  boxmojo.moviei.data = boxmojodata.same[boxmojodata.same$title%in%imdb.moviei.data$title,];
  if(boxmojo.moviei.data$year[1]!=imdb.moviei.data$year[1])
  {
    imdb.remove.rows = c(imdb.remove.rows,i);
  }
}

length(imdb.remove.rows)
#find out reason why remove so many movies??
imdbdata.same2 = imdbdata.same[-imdb.remove.rows,];
nrow(imdbdata.same2)

#keep the same number of movies in box mojo
boxmojodata.same2 = boxmojodata.same[boxmojodata.same$title%in%imdbdata.same2$title,]
nrow(boxmojodata.same2)


#sort the two datasets for combine them
library(taRifx) #install this library if you don't have it
imdbdata.same2.sort = sort.data.frame(imdbdata.same2,formula=~title+year);
boxmojodata.same2.sort = sort.data.frame(boxmojodata.same2,formula=~title+year);
final.dataset = cbind(imdbdata.same2.sort,boxmojodata.same2.sort);
final.dataset$director = as.character(final.dataset$director);
final.dataset$distributor = as.factor(final.dataset$distributor);
#use xtabs for description
xtabs(total_gross~director,final.dataset)

#use aggregate for description
director.average = aggregate(total_gross~director,data=final.dataset,mean);
head(director.average)
