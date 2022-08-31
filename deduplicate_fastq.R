
#setwd("~/Documents/shiyi")


library(data.table)
library(dplyr)

args = commandArgs(trailingOnly=TRUE)

f<-read.table(args[1])

f2<-as.data.frame(matrix(f$V1, ncol = 4, byrow = TRUE))

f3<-f2%>%
  distinct(V1,.keep_all = T)

df<-NULL
for (i in 1:length(f3$V1)) {
  tmp<-rbind(f3$V1[i],f3$V2[i],f3$V3[i],f3$V4[i])
  df<-rbind(df,tmp)
}
write.table(df,"df.txt",quote = F,col.names = F,row.names =F )
