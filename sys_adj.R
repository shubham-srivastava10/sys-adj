prob <- as.factor(prob)
s <- vector()
svg <- vector()
sc <- vector()
for (i in 1:nlevels(prob)){
  idx <- which(prob == i)
  s[i] = sum(tot[idx])
  sc[i] = sum(s_avg[idx])/length(idx)
  svg[i] = s[i]/length(idx)
}
x <- mean(svg)
#idx1 <- which(svg > x & sc < 40)
count <- vector()
for (i in 1:nlevels(prob)) {
  idx <- which(prob == i)
  idx1 <- which(tot[idx] > x & s_avg[idx] < 40)
  count[i] = length(idx1)
  
}
print(which(count >= 3))
