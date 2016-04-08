#common data structure
num1 = numeric(1);
num1 = 2;

ch1 = character(1);
ch1 = "big data";

l1 = logical(1);
l1 = TRUE;

#complex data structure
vec1 = vector(mode="character",length = 10);
vec2 = c(1,2,3);
vec3 = numeric(10);

fac1 = factor(c("1","a","c"));  
fac2 = factor(c("1","a","c","a","c"));

df1 = data.frame(c("zhangsan","lisi","wangwu"),c(1,2,3));
name = c("zhangsan","lisi","wangwu");
grade = c(1,2,3);
df1 = data.frame(name,grade);

mat1 = matrix(c(1,2,3,4,5,6),nrow = 3,ncol = 2);
mat2 = matrix(c(1,2,3,4,5,6),nrow = 3,ncol = 2, byrow = TRUE);

arr1 = array(c(1,2,3,4,5,6,7,8,9,10,11,12),dim = c(2,6));
arr2 = array(c(1,2,3,4,5,6,7,8,9,10,11,12),dim = c(2,2,3),dimnames = list("x","y","day"));

l1 = list(vec2,mat1)

#mode and attributes
mode(num1)
mode(mat1)
attributes(df1)
mode(l1)


#index
vec2 = c(1,2,3);
vec2[2]
mat1 = matrix(c(1,2,3,4,5,6),nrow = 3,ncol = 2);

#assignment
vec2 = c(1,2,3);
vec2 = 1;
vec2="bd"
vec2 = c(1,2,3);
vec2[1]="a"
vec2[2]="b";
vec2[1]=2;

mat1 = matrix(c(1,2,3,4,5,6),nrow = 3,ncol = 2);
mat1[1,1] = 2;


name = c("zhangsan","lisi","wangwu");
grade = c(1,2,3);
df1 = data.frame(name,grade);
df1[1,1] = "ff"


#basic function
ls.str();
rm(df1);
print(df1);
message(vec2)

#conditional execution 
score = 80;
if(score>90)
{
  print("Score is greater than 90!!");
}else
{
  print("Score is not greater than 90!!");
}

print(ifelse(score>90,"Score is greater than 90!!","Score is not greater than 90!!"))



#loop

for(i in 1:13)
{
  print(i);
}

mat1 = matrix(c(1,2,3,4,5,6),nrow = 3,ncol = 2);
for(row in 1:3)
{
  for(col in 1:2)
  {
    print(mat1[row,col]);
  }
}