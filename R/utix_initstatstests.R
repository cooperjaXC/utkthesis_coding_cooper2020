eighteenpsqlcsvpath = "C:\\Users\\acc-s\\Documents\\School\\_UTK_Masters\\__Thesis\\scratch\\data_eighteenonly_frompsql.csv"
psqlread = read.csv(eighteenpsqlcsvpath)

## !! At the zip code and game unit of analysis !! ##
# Total ghg emitted per zip per game with milestoutk and ntix info

# t.test(sapply(psqlread$totco2eq, "numeric"), sapply(psqlread$miles_to_utk, "numeric"))
t.test((psqlread$totco2eq), psqlread$miles_to_utk)
summary(lm(psqlread$totco2eq~psqlread$ntix + log(psqlread$miles_to_utk)))

# opponent 
sql <- within(psqlread, "opponent" <- relevel(factor(unlist(psqlread["opponent"])), ref = "Kentucky"))  # Set KY as base

summary(lm(sql$totco2eq ~ sql$ntix + log(sql$miles_to_utk)+sql$opponent))

glmrez = glm(formula=sql$totco2eq ~ sql$ntix + log(sql$miles_to_utk)+sql$opponent, family = poisson())


# Old mcfprs formula. Close to the right results but  a bit off. New one will do the trick. pscl lib
# Define function to calculate McFadden's Psuedo R^2
mcfprs = function(glmresult){
  prs = 1-(glmresult[["deviance"]])/glmresult[["null.deviance"]]
  return(prs)
}

# Technically correct mcfprs that is about .03 lower than function above, 
#   but it doesn't work well in functions.
newmcfprs = function(glmresult){
  require("pscl")
  prs = pR2(glmresult)[["McFadden"]]
  return(prs)
}

summcfprs = function(glmresult){
  roundprs = round(mcfprs(glmresult), digits = 4)
  prspct = roundprs * 100
  sumprs = paste("McFadden's Pseudo-R Squared =", roundprs)
  return(sumprs)
}



# Start working with ACS data. Tests with 2014 pop data
flt2csv="C:\\Users\\acc-s\\Documents\\School\\_UTK_Masters\\__Thesis\\scratch\\skratch.florida18_test2.csv"
flt2read=read.csv(flt2csv)
# Init sig tests
t.test(flt2read$totalpop,flt2read$ntix)
plot(flt2read$totalpop,log(flt2read$miles_to_utk))
# Regressions
#relevel
fl2_relev <- within(flt2read, "zipfromstate" <- relevel(factor(unlist(flt2read["zipfromstate"])), ref = "CO"))  # Set Colorado as base
#lmz
summary(lm(fl2_relev$totco2eq~fl2_relev$ntix + log(fl2_relev$miles_to_utk)+fl2_relev$totalpop))
summary(lm(fl2_relev$totco2eq~fl2_relev$ntix + (fl2_relev$zipfromstate)+fl2_relev$totalpop)) ## state makes R2 go up slightly and shows benefit of local tourism
#glmz
# tstglm<-(glm(fl2_relev$ntix ~ fl2_relev$totalpop+log(fl2_relev$miles_to_utk)+fl2_relev$pct_male             , family = 'poisson', na.action = na.omit))
tstglm<-(glm(fl2_relev$ntix ~ fl2_relev$totalpop+log(fl2_relev$miles_to_utk)+fl2_relev$pct_male             , family = 'poisson', na.action = na.omit))

summary(tstglm)
summcfprs(tstglm)
