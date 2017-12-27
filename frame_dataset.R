df1 <- read.csv("HMM_sample_v2_1.csv")
col <- c("Anon.Student.Id", "Problem.Name", "Step.Duration..sec.", "score")
df1 <- df1[ , col]
id <- df1[, "Anon.Student.Id"]
topic <- df1[, "Problem.Name"]
time <- df1[, "Step.Duration..sec."]
score <- df1[, "score"]
id <- as.numeric(id)
topic <- as.numeric(topic)
df2 <- data.frame(id, topic, time, score)
c = topic[1]
d = id[1]
prob <-vector()
roll <- vector()
k = 1
tot = vector()
s_tot = vector()
s_avg = vector()
tot[1] = 0
s_tot[1] = 0
j = 1
a = 0
for (i in 1:length(topic)){
  if (topic[i] != c | id[i] != d){
    k = k+1
    prob[k] = topic[i]
    roll[k] = id[i]
    c = topic[i]
    d = id[i]
    tot[k] = time[j]
    s_tot[k] = score[j]
    s_avg[k] = s_tot[k]
    j = j+1
    a = 1
  }
  else{
    a = a+1
    tot[k] = tot[k] + time[j]
    s_tot[k] = s_tot[k] + score[j]
    s_avg[k] = s_tot[k]/a
    j = j+1
    prob[k] = topic[i]
    roll[k] = id[i]
  }
}
df3 <- data.frame(roll, prob, tot, s_avg)
write.csv(df3, file = "sys_adj.csv")
