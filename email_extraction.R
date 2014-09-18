#set working directory to appropriate folder
#you will need to change this to the path that contains your .csv
setwd("C:/Users/Desktop")
getwd()

#read in CSV data as variable "doc"
#change example_set.csv to your csv file
doc <- read.csv("example_set.csv", sep=",")


#print head to check that everything read in correctly
#make sure that the column containing your embedded e-mails is headed with "contact" in the .csv 
head(doc)

#set column names

head(doc$contact)

doc$contact_chars <- as.character(doc$contact)

emails = (regmatches(doc$contact_chars, gregexpr("([_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,4}))", doc$contact_chars)))


doc$emails <- emails

doc$emails[doc$emails=="character(0)"] <- NULL

emails_noNA <- doc$emails

email_list <- paste(unlist(subset(doc$emails, doc$emails != "NULL")), collapse = "; ")
email_list


fileConn<-file("email_list.txt")
writeLines(email_list, fileConn)
close(fileConn)

doc <- data.frame(doc)

doc_coerce <- data.frame(lapply(doc, as.character), stringsAsFactors=FALSE)

write.csv(doc_coerce, file = "example_set_cleaned.csv", na="")
