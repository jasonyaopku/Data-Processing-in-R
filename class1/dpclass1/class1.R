#numeric
name = "zhangsan";
is.numeric(name);is.character(name);

student_num = 80;
student_num = numeric(4);
student_num
i=0;

#character
student1_name = 'wangwu';
student_names = character(80);

#logical
student1_is_male = TRUE;

n<-5
n<(-5)

#vector
names1 = c("shenyufeng","zhaoyue","liushijia");
names2 = c(names1,"liushaosi");
names3 = c("kebotian",names2);

#indexing
names3[1]
names3[5]
names3[6]
for(i in 1:5)
{
  print(names3[i])
}

#revise
names3[5] = "liushaoshi";

#dataframe
ages = c(18,19,19,18,19);
df.name.age = data.frame(names3,ages);
df.name.age = data.frame(names2,ages);

#mode and attributes
mode(df.name.age);
attributes(df.name.age)

#change attributes
df.name.age$names4 = as.character(df.name.age$names3)

#dataframe indexing and revise
df.name.age[1,3]
df.name.age[5,3] = "liushaosi";

#delete
df.name.age$names3 = NULL;

#matrix
matrix1 = matrix(c(1,2,3,4,5,6),nrow = 2,ncol = 3);
matrix2 = matrix(c(1,2,3,4,5,6),nrow = 2,ncol = 3,byrow = TRUE);
matrix1[2,2]
matrix2[2,2]
matrix1[2,2] = 100;

#basic function 
ls.str()
rm(names1)
print(names3)
seq(1,100,1);
seq(1,100,2);
rep(1,10)
seq1 = seq(1,100,2);

#condition
if(names3[1]=="kebotian")
{
  print(names3[1]);
}else
{
  print("data error!");
}

#loop
for(namei in names3)
{
  print(namei);
  print(namei);
}



