# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

strNFLfile <- "data-raw/NFL.csv"

NFL <- readr::read_csv(strNFLfile)
NFL = subset(NFL, Home==TRUE)
NFL <- subset(NFL, GameDate >= as.Date("1995-01-01"))

save(NFL, file = "./data/NFL.rdata", compress = "xz")
