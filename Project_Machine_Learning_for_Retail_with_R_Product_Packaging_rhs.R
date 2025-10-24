library(arules)
transaksi <- read.transactions(file="bootcamp_data_science/transaksi_dqlab_retail.tsv", format = "single", sep = "\t", cols = c(1,2), skip = 1)

#kombinasi kuat
rules <- apriori(transaksi, parameter = list(supp = 10/length(transaksi), conf = .1, minlen = 2, maxlen = 3))

#dari kombinasi kuat -> ambil 3 kombinasi terkuat dengan rhs "Tas Makeup"
rules_tas <- subset(rules, rhs %in% "Tas Makeup")
top3_tas <- head(sort(rules_tas, by = "lift", decreasing = TRUE), 3)
inspect(top3_tas)

#dari kombinasi kuat -> ambil 3 kombinasi terkuat dengan rhs "Tas Makeup"
rules_baju <- subset(rules, rhs %in% "Baju Renang Pria Anak-anak")
top3_baju <- head(sort(rules_baju, by = "lift", decreasing = TRUE), 3)
inspect(top3_baju)


#daftar item slow moving rhs "Tas Makeup" dan rhs "Tas Makeup"
rules_slow_moving <- c(top3_tas, top3_baju)
inspect(rules_slow_moving)
