#install 
provname=c("CN-11","CN-12","CN-13","CN-14","CN-15",
           "CN-21","CN-22","CN-23","CN-31","CN-32",
           "CN-33","CN-34","CN-35","CN-36","CN-37",
           "CN-41","CN-42","CN-43","CN-44","CN-45",
           "CN-46","CN-50","CN-51","CN-52","CN-53",
           "CN-54","CN-61","CN-62","CN-63","CN-64","CN-65");
#"北京市","天津市","河北省","山西省","内蒙古自治区",
#"辽宁省","吉林省","黑龙江省","上海市","江苏省",
#"浙江省","安徽省","福建省","江西省","山东省",
#"河南省","湖北省","湖南省","广东省",
#"广西壮族自治区","海南省","重庆市","四川省","贵州省",
#"云南省","西藏自治区","陕西省","甘肃省","青海省",
#"宁夏回族自治区","新疆维吾尔自治区"

pop=c(110.56,112.51,113.43,112.52,108.45,112.83,111.23,109.71,110.64,116.51,
      113.86,127.85,117.93,114.74,112.17,118.46,128.18,126.16,130.30,
      125.55,135.64,115.13,116.01,107.03,108.71,102.73,122.10,114.82,
      110.35,108.79,106.12)
## 
install.packages("googleVis")
library(googleVis)
population.df = data.frame(provname,pop);
pop.map = gvisGeoChart(population.df, locationvar='provname', colorvar='pop',options=list(region='CN',displayMode="regions",resolution="provinces",colorAxis="{colors: ['yellow','red']}" ));
plot(pop.map);


#save RData
#type 1 save the whole environment
save.image(file = "map.wholedata.RData");
save(population.df,file = "only.onevariable.RData");
save.image();


#Date format
D1 = as.Date("2016-05-22");
D2 = as.Date("2016-06-12");
D2-D1
D2>D1




