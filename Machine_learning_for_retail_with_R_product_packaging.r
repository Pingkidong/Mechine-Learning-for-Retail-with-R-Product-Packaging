library(arules)
transaksi <- read.transactions(file="bootcamp_data_science/transaksi_dqlab_retail.tsv", format = "single", sep = "\t", cols = c(1,2), skip=1)

#Sort 10 item dengan penjualan paling sedikit 
bottom_10 <- itemFrequency(transaksi, "absolute")
bottom_10 <- sort(bottom_10, decreasing = FALSE) [1:10]
bottom_10 <- data.frame("Nama.Produk" = names(bottom_10), "Jumlah" = bottom_10, row.names = NULL)
bottom_10

#Sort 10 item dengan penjualan paling banyak 
Top10_item <- itemFrequency(transaksi, type = "absolute")
Top10_item <- sort(Top10_item, decreasing = TRUE)[1:10]
Top10_item <- data.frame("Nama Produk" = names(Top10_item), "Jumlah" = (Top10_item), row.names = NULL)
Top10_item

#Mencari kombinasi item terkuat
rules <- apriori(transaksi, parameter = list(supp = 10/length(transaksi), conf = 0.5, minlen = 2, maxlen = 3))

#Menampilkan 10 kombinasi terkuat
top10_rules <- head(sort(rules, by = "lift", decreasing = TRUE), 10)
inspect(top10_rules)