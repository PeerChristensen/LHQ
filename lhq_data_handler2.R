# LHQ data handler 2
library(plyr)
lhq =read.csv2("pts.csv",sep=',' ,stringsAsFactors=T,dec=",")
lhq <- strsplit(as.character(lhq[,1]), ',')

#basic participant data
base=lhq[-1]
basic=NULL
for (i in 1:length(base)){
        Participant=base[i][[1]][1] 
        Age=as.numeric(base[i][[1]][2])
        Gender=base[i][[1]][3]
        d=data.frame(Participant,Age,Gender)
        basic=rbind(basic,d)
}
basic$Language = as.factor(ifelse(grepl("t",basic$Participant), "Turkish","Swedish"))

#age
age=ddply(basic,~Language,summarise,
      median=median(Age),mean=mean(Age),sd=sd(Age))
#gender
gender=table(basic$Gender,basic$Language)

#Language skills and knowledge
language=NULL
for (i in 1:length(lang)){
        part=lang[i][[1]][1]
        L1=lang[i][[1]][6]
        L1_listAge=as.numeric(lang[i][[1]][7])
        L1_listPrf=as.numeric(lang[i][[1]][47])
        L1_speakAge=as.numeric(lang[i][[1]][8])
        L1_speakPrf=as.numeric(lang[i][[1]][48])
        L1_years=as.numeric(lang[i][[1]][11])
        L2=lang[i][[1]][12]
        L2_listAge=as.numeric(lang[i][[1]][13])
        L2_listPrf=as.numeric(lang[i][[1]][52])
        L2_speakAge=as.numeric(lang[i][[1]][14])
        L2_speakPrf=as.numeric(lang[i][[1]][53])
        L2_years=as.numeric(lang[i][[1]][17])
        d=data.frame(part,L1,L1_listAge,L1_listPrf,L1_speakAge,L1_speakPrf,L1_years,
                     L2,L2_listAge,L2_listPrf,L2_speakAge,L2_speakPrf,L2_years)
        language=rbind(language,d)
}


#multicultural?
lhqm=lhq[-1]
for (i in 1:length(lhqm)){
        part[i]=unlist(lhqm[i])[1]
        mult[i]=unlist(lhqm[i])[114]
        cult[i]=unlist(lhqm[i])[115]
        comm[i]=unlist(lhqm[i])[143]
        multicultural=t(rbind(part,mult,cult,comm))
}
multicultural=data.frame(multicultural)
