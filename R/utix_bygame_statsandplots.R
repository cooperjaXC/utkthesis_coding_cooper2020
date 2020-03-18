ftnntnpath="C:\\Users\\acc-s\\Documents\\School\\_UTK_Masters\\__Thesis\\scratch\\data_frompsql_bygame_14to19.csv"
fortnineread = read.csv(ftnntnpath)
## !! Per game level of analysis !! ## 

relevel <- within(fortnineread, "opponent" <- relevel(factor(unlist(fortnineread["opponent"])), ref = "South Carolina"))  # Set KY as base
# colnames(relevel)

tixlm = lm(data = relevel, formula = tixsum ~ opponent  + log(totmilesdrivn))#+ avglon + avglat)
summary(tixlm)

# I think I should use this one. totalmilesdrivn is a function (dependent var) of tixsum.
  # Total miles per person takes the ntix val out of that to give a better distance measurement. 
tixavmilm=lm(data = relevel, formula = tixsum ~ opponent  + totalmilespp)# log(totmilesdrivn))#+ avglon + avglat)
summary(tixavmilm)

# Distance stats testing testing
distlm <- lm(data = relevel, formula = totmilesdrivn~tixsum)
summary(distlm)  # The total number of miles driven is not that dependent on # tix sold. Interesting...
distopplm <- lm(data = relevel, formula = totmilesdrivn~opponent+tixsum)
summary(distopplm)  ## Dist varies much more upon opponent than ntix.
  # in fact, ntix drops here. When you account for whom UTK is playing, average miles pp increases as ntix decreases

# GHG stats testing
basicco2lm = lm(data = relevel, formula=sumtotco2eq~tixsum+log(totmilesdrivn))#+opponent+avglat+avglon)
summary(basicco2lm)  # Basically the same R2 here as if you use totalmilespp b/c the regression controls for ntix.
  # so the same dist val comes into play in both models. 

co2lm = lm(data = relevel, formula=sumtotco2eq~opponent+tixsum+log(totmilesdrivn))#+avglat+avglon)
summary(co2lm)

ghgpplm = lm(data = relevel, formula=totcfpppn~opponent+tixsum+totalmilespp)#+avglat+avglon)
summary(ghgpplm)  # Of course ntix isn't sig here. ghgpp is normalized per person. 

# Understanding the GHGpp increase and the ntix decrease
plot(relevel$tixsum, xlab = 'Game', ylab = 'Tickets Sold', pch = 19)#, breaks=7)
title("Total Tickets Sold per Game")
lines(lowess(relevel$tixsum), lwd=3)

plot(relevel$totcfpppn, xlab = 'Game', ylab = 'CO2eq / Tourist', pch = 19)
title("Average GHGs Emitted per Ticketholder")
lines(lowess(relevel$totcfpppn), lwd=3)

plot(relevel$totalmilespp, xlab = 'Game', ylab = 'Miles Driven / Tourist', pch = 19)
title("Average Miles Driven per Ticketholder")
lines(lowess(relevel$totalmilespp), lwd=3)

# Tackling student attendance
##studattend=c(11022, 	9595, 	11215, 	8614, 	11111, 	9543, 	8647, 	11050, 	8890, 	10763, 	10383, 	9010, 	6487, 	3673, 	11301, 	9226, 	11121, 	10999, 	6882, 	6814, 	6496, 	12212, 	7981, 	10990, 	7231, 	4859, 	7435, 	1483, 	10989, 	5497, 	11011, 	8568, 	5086, 	6350, 	5838, 	8974, 	9481, 	5371, 	8375, 	4738, 	6512, 	6989, 	2525)
plot(relevel$studenttix, xlab = 'Game', ylab = 'Tickets Sold', pch = 19)#, breaks=7)
title("Total Student Tickets Sold per Game")
lines(lowess(relevel$studenttix), lwd=3)

# Student vs regular attendance 
summary(lm(relevel$tixsum~relevel$studenttix))
plot(relevel$studenttix~relevel$tixsum)
lines(lowess(relevel$studenttix~relevel$tixsum))
# Stud attend ~ which game # it is in the season.
studgamelm=(lm(relevel$studenttix~relevel$gamenum))
summary(studgamelm)  # Stud attend goes up as game # goes down. IE Students come more @ beginning of season. 
studlm = lm(data = relevel, formula=studenttix~opponent+tixsum)#no log(totmilesdrivn); this is for everyone.
summary(studlm)  # pos = Alabama, App St, Ark, BYU, ETSU, Florida, Georgia, Georgia St., Indiana St.
                # neg = Southern Miss, Vandy (big time)
stud_wgame_lm = lm(data = relevel, formula=studenttix~opponent+tixsum+gamenum)#no log(totmilesdrivn); this is for everyone.
summary(stud_wgame_lm)  # pos = same as studlm + Oklahoma . neg = same as studlm + N. Texas
studglm = glm(data = relevel, formula=studenttix~opponent+tixsum, family = poisson())
summary(studglm)  # Suddenly everything is significant...
