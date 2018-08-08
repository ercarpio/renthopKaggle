library(jsonlite)
library(data.table)

rawTrainData <- fromJSON("data/train.json")

printEntryFromRawData <- function(index) {
  c(sprintf("Index %d", index),
    rawTrainData$bathrooms[index],
    rawTrainData$bedrooms[index],
    rawTrainData$building_id[index],
    rawTrainData$created[index],
    rawTrainData$description[index],
    rawTrainData$display_address[index],
    rawTrainData$features[index],
    rawTrainData$latitude[index],
    rawTrainData$listing_id[index],
    rawTrainData$longitude[index],
    rawTrainData$manager_id[index],
    rawTrainData$photos[index],
    rawTrainData$price[index],
    rawTrainData$street_address[index],
    rawTrainData$interest_level[index]
    )
}

trainTable <- data.table(bathrooms = unlist(rawTrainData$bathrooms),
                         bedrooms = unlist(rawTrainData$bedrooms),
                         building_id = unlist(rawTrainData$building_id),
                         created = unlist(rawTrainData$created),
                         #description = unlist(rawTrainData$description), #cleanup, word analysis
                         #display_address = unlist(rawTrainData$display_address), #needs to be cleaned and word analysis performed
                         #features = unlist(rawTrainData$features), #analyze important features, count
                         latitude = unlist(rawTrainData$latitude),
                         listing_id = unlist(rawTrainData$listing_id),
                         longitude = unlist(rawTrainData$longitude),
                         manager_id = unlist(rawTrainData$manager_id),
                         #photos = unlist(rawTrainData$photos), #include count for now, maybe size, resolution, lighting analysis in the future
                         price = unlist(rawTrainData$price),
                         #street_address = unlist(rawTrainData$street_address), #find difference with display address, needs to be cleaned and word analysis performed
                         interest_level = unlist(rawTrainData$interest_level)
                         )

pairs(~ bathrooms + bedrooms + latitude + listing_id + longitude + price, trainTable)
