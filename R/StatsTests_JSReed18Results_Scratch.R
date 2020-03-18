dscoretrial = "C:/Users/acc-s/Documents/School/_UTK_Masters/__Thesis/BusinessNames/dsscoretrial2_csv.csv"
scoresread = read.csv(dscoretrial)
colnames(scoresread)

# Relevel the state to use the median d and s score state as the base
# regressdata <- within(regressdata, "fac_STATE" <- relevel(factor(unlist(regressdata["fac_STATE"])), ref = "CO"))
# Texas sscore  # Oklahoma dscore
scoresread <- within(scoresread, "state" <- relevel(factor(unlist(scoresread["state"])), ref = "TX"))#"OK"))


ttestdscore = t.test(scoresread$dscore, scoresread$sscore)
regressdsscore = lm(scoresread$dscore~scoresread$sscore)
regressdscorestate = lm(scoresread$dscore~scoresread$state)
regresssscorestate = lm(scoresread$sscore~scoresread$state)
dvsstat = lm(scoresread$sscore~scoresread$state + scoresread$dscore)
serrorvcity = lm(scoresread$seror ~ scoresread$city)

print(summary(regressdsscore))
print(summary(regressdscorestate))
print(summary(regresssscorestate))
print(summary(dvsstat))
print("Test the python console use in pycharm with R")  # Must actually command to print if using in pycharm
print(summary(serrorvcity))
