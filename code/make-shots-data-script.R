# title: make-shorts-data-script
# description: this script includes the code for data preparation which is to eventually create the shots-data.csv file
# input(s): 
## andre-iguodala.csv(data/) draymond-green.csv(data/) kevin-durant.csv(data/) klay-thompson.csv(data/) stephen-curry.csv(data/)
# output(s): the outputs includes: 
## make-shots-data-script.R (code/) 
## shots-data.csv(data/) 
## andre-iguodala-summary.txt(output/) draymon-green-summary.txt (output/) kevin-durant-summary.txt (output/) klay-thompson-summary.txt(output/) stephen-curry-summary.txt(output/) shots-data-summary.txt (output/)


# Data Importing
andre_iguodala <-  read.csv("../data/andre-iguodala.csv", 
                            stringsAsFactors = FALSE, 
                            colClasses = c("character", "character", "integer", "integer", "integer", "integer", "character", "factor", "factor", "integer", "character", "integer","integer"))

draymond_green <-  read.csv("../data/draymond-green.csv", 
                            stringsAsFactors = FALSE, 
                            colClasses = c("character", "character", "integer", "integer", "integer", "integer", "character", "factor", "factor", "integer", "character", "integer","integer"))

kevin_durant <-  read.csv("../data/kevin-durant.csv", 
                          stringsAsFactors = FALSE, 
                          colClasses = c("character", "character", "integer", "integer", "integer", "integer", "character", "factor", "factor", "integer", "character", "integer","integer"))

klay_thompson <-  read.csv("../data/klay-thompson.csv", 
                           stringsAsFactors = FALSE, 
                           colClasses = c("character", "character", "integer", "integer", "integer", "integer", "character", "factor", "factor", "integer", "character", "integer","integer"))

stephen_curry <-  read.csv("../data/stephen-curry.csv", 
                           stringsAsFactors = FALSE, 
                           colClasses = c("character", "character", "integer", "integer", "integer", "integer", "character", "factor", "factor", "integer", "character", "integer","integer"))



# Data Modifications
# modifications for andre
andre_iguodala <- cbind(name = "Andre Iguodala", andre_iguodala)  # add column "name"

n_andre <- andre_iguodala$shot_made_flag == "n"       
andre_iguodala$shot_made_flag[n_andre] <- "shot_no"     # modify "n"

y_andre <- andre_iguodala$shot_made_flag == "y"
andre_iguodala$shot_made_flag[y_andre] <- "shot_yes"    # modify "y"

andre_iguodala$minute <- 12 * andre_iguodala$period - andre_iguodala$minutes_remaining   # add column "minute"


# modifications for draymond
draymond_green <- cbind(name = "Draymond Green", draymond_green)

n_draymond <- draymond_green$shot_made_flag == "n"
draymond_green$shot_made_flag[n_draymond] <- "shot_no"

y_draymond <- draymond_green$shot_made_flag == "y"
draymond_green$shot_made_flag[y_draymond] <- "shot_yes"

draymond_green$minute <- 12 * draymond_green$period - draymond_green$minutes_remaining


# modifications for kevin
kevin_durant <- cbind(name = "Kevin Durant", kevin_durant)

n_kevin <- kevin_durant$shot_made_flag == "n"
kevin_durant$shot_made_flag[n_kevin] <- "shot_no"

y_kevin <- kevin_durant$shot_made_flag == "y"
kevin_durant$shot_made_flag[y_kevin] <- "shot_yes"

kevin_durant$minute <- 12 * kevin_durant$period - kevin_durant$minutes_remaining


# modifications for klay
klay_thompson <- cbind(name = "Klay Thompson", klay_thompson)

n_klay <- klay_thompson$shot_made_flag == "n"
klay_thompson$shot_made_flag[n_klay] <- "shot_no"

y_klay <- klay_thompson$shot_made_flag == "y"
klay_thompson$shot_made_flag[y_klay] <- "shot_yes"

klay_thompson$minute <- 12 * klay_thompson$period - klay_thompson$minutes_remaining


# modifications for stephen
stephen_curry <- cbind(name = "Stephen Curry", stephen_curry)
n_stephen <- stephen_curry$shot_made_flag == "n"
stephen_curry$shot_made_flag[n_stephen] <- "shot_no"

y_stephen <- stephen_curry$shot_made_flag == "y"
stephen_curry$shot_made_flag[y_stephen] <- "shot_yes"

stephen_curry$minute <- 12 * stephen_curry$period - stephen_curry$minutes_remaining



# Summaries
# summary for andre
sink("../output/andre-iguodala-summary.txt")
summary(andre_iguodala)
sink()
# summary for draymond
sink("../output/draymond-green-summary.txt")
summary(graymond_green)
sink()
# summary for kevin
sink("../output/kevin-durant-summary.txt")
summary(kevin_durant)
sink()
# summary for klay
sink("../output/klay-thompson-summary.txt")
summary(klay_thompson)
sink()
# summary for stephen
sink("../output/stephen-curry-summary.txt")
summary(stephen_curry)
sink()


# Binding Data
shots_data <- rbind(andre_iguodala, draymond_green, kevin_durant, klay_thompson, stephen_curry)
write.csv(shots_data, "../data/shots-data.csv")


# Summary of shots-datas
sink("../output/shots-data-summary.txt")
summary(shots_data)
sink()

