tieba.data = read.table("sample_data_utf8.txt",sep = "\t",fill = TRUE,quote = "");

data.file = file("sample_data_utf8.txt",open = "r");
data.lines = readLines(data.file);
length(data.lines)
data.lines[1]
close(data.file);
split.data = strsplit(data.lines,"\t");
split.data[1]
unlist.data = unlist(split.data);
col.num = length(unlist.data)/length(data.lines);
num.line = length(data.lines);
data.mat = matrix(unlist.data,nrow = num.line,ncol = col.num,byrow = TRUE);
tieba.df = as.data.frame(data.mat);

# data.file = file("sample_data_utf8.txt",open = "r");
# 
# ;
# matrix(unlist(strsplit(readLines(data.file),"\t")))
# close(data.file);

tieba.dataframe = as.data.frame(id=tieba.df$V1,ctreatetime=tieba.df$V2)
colnames(tieba.df) = c("id","create_time","c_id","c_level","c_topic","c_content","read_num","resp_num","r_id","r_level","r_content","r_time","r_lou","like","dislike");
colnames(tieba.data) = c("id","create_time","c_id","c_level","c_topic","c_content","read_num","resp_num","r_id","r_level","r_content","r_time","r_lou","like","dislike");
summary(tieba.data)
tieba.data$
unduplicate.data = tieba.data[!duplicated(tieba.data$id),];
summary(unduplicate.data$resp_num)
unduplicate.data[unduplicate.data$resp_num>=373600,];
#find user write many times
sort(table(unduplicate.data$c_id),decreasing = TRUE)
creator.totalresp = xtabs(formula = resp_num~c_id,data = unduplicate.data);
head(sort(creator.totalresp,decreasing = TRUE))
head(sort(unduplicate.data$resp_num,decreasing = TRUE))

reponse.mean = aggregate(formula=resp_num~c_id,data = unduplicate.data,FUN = sd)
reponse.sum = aggregate(formula=resp_num~c_id,data = unduplicate.data,FUN = sum)
reponse.mean[reponse.mean$c_id=="白杨学长",]
reponse.sum[reponse.mean$c_id=="白杨学长",]


respose.read.sum = aggregate(formula=.~c_id,FUN = sum,data = unduplicate.data[,c("resp_num","read_num","c_id")])
head(respose.read.sum)

library("sna")
install.packages("sna")
tieba.data$c_id = as.character(tieba.data$c_id);
tieba.data$r_id = as.character(tieba.data$r_id);
all.users = unique(c(tieba.data$c_id,tieba.data$r_id));
head(all.users)
user.num = length(all.users);
user.matrix = matrix(rep(0,user.num*user.num),nrow = user.num,ncol = user.num);
colnames(user.matrix) = all.users;
rownames(user.matrix) = all.users;
for(i in 1:nrow(tieba.data))
{
  c_id.i = tieba.data[i,]$c_id;
  r_id.i = tieba.data[i,]$r_id;
  tmp = user.matrix[which(all.users==c_id.i),which(all.users==r_id.i)];
  user.matrix[which(all.users==c_id.i),which(all.users==r_id.i)] = tmp+1;
  #which
}
gplot(user.matrix)



