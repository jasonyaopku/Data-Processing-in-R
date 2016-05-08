#define own function
names = c("likemeng","liwanrong","sunxingyu","duwei","zhangwanyue","chenshiming");
length(names);
nchar(names);
names1 = c(8 , 9 , 9 , 5 ,11, 10);
get_max_len_name = function(arg1)
{
  lens = nchar(arg1);
  max_len = max(lens);
  for(i in 1:length(arg1))
  {
    if(lens[i]==max_len)
    {
      return(arg1[i]);
    }
  }
}

max_name = get_max_len_name(names)
get_max_len_name(names1)
#get the min max median and mean of lengths of names
get_mmmm = function(ns)
{
  lens = nchar(ns);
  name_min = min(lens);
  name_max = max(lens);
  name_median = median(lens);
  name_mean = mean(lens);
  re = c(name_min,name_max,name_median,name_mean);
  return(re);
}

result = get_mmmm(names);

#operations in dataframe
names = c("zhangsan","lisi","wangwu");
scores = c(80,60,90);
DF = data.frame(names,scores);
#add operation
names2 = c("wuyi","chenyan","huxiangyu");
scores2 = c(90,95,100);
DF2 = data.frame(names=names2,scores=scores2);
DF_new = rbind(DF,DF2);
DF_new = rbind(DF,data.frame(names=names2,scores=scores2));
ages = c(18,19,20,19,18,20);
DF_new2 = cbind(DF_new,ages);

DF_new2[-1,]
DF_new2[c(-1,-2,-3),]

DF_new2[1,2] = 85;

nchar(DF_new2$names)

DF_new2$names = as.character(DF_new2$names);
nchar(DF_new2$names)
DF_new2$scores[1] = 80;

#search in data frame
DF_new2[c(1,2),c(2,3)]
DF_new2[DF_new2$scores<80,]
DF_new2[DF_new2$scores>90,]
DF_new2[DF_new2$scores>80&DF_new2$ages<19,]
DF_save = DF_new2[DF_new2$scores>=80,];

get_max_len_names = function(arg1)
{
  lens = nchar(arg1);
  max_len = max(lens);
  df = data.frame(arg1,lens);
  df$arg1 = as.character(df$arg1);
  
  return(df[df$lens==max_len,]$arg1)
}
get_max_len_names(names)


#data analysis steps
daily_show = read.csv("daily_show_guests.csv") ;
#1 overview
summary(daily_show);
missing_data = daily_show[is.na(daily_show$GoogleKnowlege_Occupation)|is.na(daily_show$Group),];
daily_show_save = daily_show[!(is.na(daily_show$GoogleKnowlege_Occupation)|is.na(daily_show$Group)),];
summary(daily_show_save);
table(daily_show_save$GoogleKnowlege_Occupation)
daily_show_save$GoogleKnowlege_Occupation = tolower(daily_show_save$GoogleKnowlege_Occupation);
occupation_times = table(daily_show_save$GoogleKnowlege_Occupation);
daily_show_save[daily_show_save$GoogleKnowlege_Occupation=="telvision actor",]$GoogleKnowlege_Occupation = "televison actor";
sort(occupation_times);

sort(table(daily_show_save$Group));

guest_times = table(daily_show_save$Raw_Guest_List);
sort(guest_times);
plot(guest_times);
plot(sort(guest_times))
plot(sort(guest_times),main = "Guest times",xlab = "guest",ylab = "times");
hist(guest_times)
