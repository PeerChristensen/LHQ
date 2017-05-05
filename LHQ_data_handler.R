# Preparing LHQ data
setwd("/Users/peerchristensen/Desktop/LHQ files")

#e.g.
dat= read.csv("first.csv", sep = ",",header=F,quote=",")
dat= t(dat)
dat=dat[,3:ncol(dat)] # row numbers for "first" file remember to set length to right amount of colums (length() also possible)
dat <- gsub('\"', '', dat)

###BASIC PARTICIPANT INFO###
#mean age and sd
mean_age <- mean(as.numeric(dat[2,2:ncol(dat)]))
sd_age <- sd(as.numeric(dat[2,2:length(dat[2,])]))
#gender table
gender_table <- table(dat[3,2:length(dat[3,])])

#First foreign language learned
table(dat[12,2:length(dat[12,])])
#years of use
mean(as.numeric(dat[17,2:length(dat[17,])]))

#second foreign language learned
table(dat[18,2:length(dat[18,])])
#years of use
mean(as.numeric(dat[23,2:length(dat[23,])]))

#+3-month stays in another country #needs update
table(dat[33,2:length(dat[33,])])
