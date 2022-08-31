
#setwd("~/Documents/shiyi")


library(data.table)
library(dplyr)
library("microseq")
# install.packages("microseq")
# https://rdrr.io/cran/microseq/man/readFastq.html
args = commandArgs(trailingOnly=TRUE)

f<-read.table(args[1])
# f<-readFastq("A9161.fastq.out.fq")

df<-f%>%
  distinct(Header,.keep_all = T)

writeFastq(df, "A9161.fastq.out_dedup.fq")
