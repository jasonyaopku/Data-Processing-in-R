#notice the directory
setwd("~/百度云同步盘/Classes/Data-Processing-in-R/Student HW/class 1")
#vector calculation
a=c(1,2,3,4,5,6);
b=2;
a/b;
c=c(2,4);
a/c
d=c(1,2,3,4)
a/d

#multi condition
age=17;
gender="male"
(age>17)&(gender=="male")
(age>=17)|(age>10)&(age<9)

#multi loops
for(var1 in c(1,2,3))
{
  for(var2 in c(2,4,6,8,10))
  {
    print(var1*var2);
  }
  print("one loop end!");
}

#dataframe element
names = c("zhangsan","lisi");
ages = c(18,19);
df.test = data.frame(names,ages);
names = c(names,"shenyufeng")
names=c(1,2);


#question 11,12
names = c("zhangsan","lisi","wangwu");
heights = c(165,175,170);
weights = c(55,65,70);
user.data = data.frame(names,heights);
student.num = length(names);
user.data$names = as.character(user.data$names);
for(i in 1:student.num)
{
  print(user.data[i,1]);
  if(user.data[i,2]>=170)
  {
    print(user.data[i,1])
  }
}

user.data = cbind(user.data,weights);

#set wd
#setwd("~/百度云同步盘/Classes/Data-Processing-in-R/Student HW/class 1");

#read data
user.data = read.table(file = "datatest.txt");
user.data = read.table(file = "datatest.txt",sep = ',');
user.data = read.table(file = "datatest.txt",sep = ',',header = TRUE);
user.data = read.table(file = "datatest.txt",sep = ' ',header = TRUE);
user.data = read.csv("datatest.csv");

#write data
write.table(user.data);
write.table(user.data,"output.data.txt");
write.table(user.data,"output.data.txt",row.names = FALSE);
write.table(user.data,"output.data.txt",row.names = FALSE,col.names = FALSE);

write.table(user.data,"output.data.txt",row.names = FALSE,sep = "++++");
write.csv(user.data,"output.data.csv");

#homework analysis 
HW.Filenames = dir();
head(HW.Filenames);
student.names = read.table(file="names.txt",header = TRUE)
analysis.result = data.frame(student.names);
analysis.result$is_submit = rep(FALSE,length(student.names));
analysis.result$times = rep(0,length(student.names));
analysis.result$is_normal = rep(FALSE,length(student.names));
student.names$name = as.character(student.names$name)
for(i in 1:nrow(student.names))
{
  
#   for(j in 1:length(HW.Filenames))
#   {
    namei=student.names[i,1];
    print(namei);
    indexi = grep(namei,HW.Filenames);
    analysis.result[i,2] = length(indexi)>0;
    analysis.result[i,3] = length(indexi);
    namei.files = HW.Filenames[indexi];
    is_normali = length(grep("DSJJYB",namei.files))>0;
    analysis.result[i,4] = is_normali;
 # }
}

#probability of submitting
mean(analysis.result$is_submit)
mean(analysis.result$times[analysis.result$times>0])
max(analysis.result$times)
mean(analysis.result$is_normal)


