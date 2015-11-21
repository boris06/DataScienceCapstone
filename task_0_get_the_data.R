library(jsonlite)

setwd('C:/Users/petelin/Documents/Coursera/Data Science Specialization/Data Science Capstone')

datadir <- './yelp_dataset_challenge_academic_dataset'
RDatafile1 <- 'yelp_dataset_challenge_academic_dataset_1.RData'
RDatafile2 <- 'yelp_dataset_challenge_academic_dataset_2.RData'

ptm <- proc.time()

if (file.exists(RDatafile1)) {
        print("Reading from RData(1)...")
        load(RDatafile1)
} else {
        print("Reading from JSON(1)...")
        business_data <- stream_in(file(paste0(datadir,"/yelp_academic_dataset_business.json")))         
        review_data <- stream_in(file(paste0(datadir,"/yelp_academic_dataset_review.json")))        
        checkin_data <- stream_in(file(paste0(datadir,"/yelp_academic_dataset_checkin.json")))         
        tip_data <- stream_in(file(paste0(datadir,"/yelp_academic_dataset_tip.json")))
        save.image(RDatafile1)
}

proc.time() - ptm

ptm <- proc.time()

if (file.exists(RDatafile2)) {
        print("Reading from RData(2)...")
        load(RDatafile2)
} else {
        print("Reading from JSON(2)...")
        user_data <- stream_in(file(paste0(datadir,"/yelp_academic_dataset_user.json")))         
        save.image(RDatafile2)
}

proc.time() - ptm

business_flat <- flatten(business_data)
rm(business_data)
save(business_flat, file="business_flat.RData")
rm(business_flat)

user_flat <- flatten(user_data)
rm(user_data)
save(user_flat, file="user_flat.RData")
rm(user_flat)

checkin_flat <- flatten(checkin_data)
rm(checkin_data)
save(checkin_flat, file="checkin_flat.RData")
rm(checkin_flat)

tip_flat <- flatten(tip_data)
rm(tip_data)
save(tip_flat, file="tip_flat.RData")
rm(tip_flat)

review_flat <- flatten(review_data)
rm(review_data)
save(review_flat, file="review_flat.RData")
rm(review_flat)

