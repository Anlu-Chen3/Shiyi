
setwd("~/Documents/shiyi")


library(data.table)
library(dplyr)


f<-read.table("A9161.fastq.out.fq")

f2<-NULL
tmp<-NULL
for (i in 1:(length(f$V1)/4)) {
  a<-f$V1[4*(i-1)+1]
  b<-f$V1[4*(i-1)+2]
  c<-f$V1[4*(i-1)+3]
  d<-f$V1[4*(i-1)+4]
  tmp<-as.data.frame(cbind(a,b,c,d))
  f2<-rbind(f2,tmp)
}


# f2<-as.data.frame(matrix(f$V1, ncol = 4, byrow = TRUE))

f3<-f2%>%
  distinct(V1,.keep_all = T)

df<-NULL
for (i in 1:length(f3$V1)) {
  tmp<-rbind(f3$V1[i],f3$V2[i],f3$V3[i],f3$V4[i])
  df<-rbind(df,tmp)
}
write.table(df,"df.txt",quote = F,col.names = F,row.names = )

nchar(df)
nchar(f)