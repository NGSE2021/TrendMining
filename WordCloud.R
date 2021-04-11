#install.packages("text2vec")
#install.packages("tm")
#install.packages("magrittr")
#install.packages("wordcloud")
#install.packages("stopwords", dependencies = TRUE)
library("stopwords")
library(text2vec)
library(tm)
library(magrittr)
library(wordcloud)

#EDIT this row
#my_file <- "my_Scopus_www_articles_clean_data.RData"
my_file <- "my_STO_www_data_clean.RData"

#draw_myWordCloud = function(my_file){
  
  my_temp_file = paste(my_data_dir, "/", sep="")
  my_temp_file = paste(my_temp_file, my_file, sep="")
  load(my_temp_file)
  
  print(paste("Creating Word cloud, my_file: ", my_file))
  
  my_text <- paste(my_articles$Title, my_articles$Abstract_clean)
  my_text = tolower(my_text)
  
  #remove more words that we do not care about 
  my_stopwords = c(stopwords::stopwords(language = "en", source = "snowball"),"one","like","need","want","tried","trying","know", "show","present","online","using","use","used","study","different","propose","web","two","also","new","paper","large","can","however")
  
  
  my_text = removeWords(my_text, my_stopwords)
  
  wordcloud(my_text, max.words=50, min.freq=5, random.order=FALSE, rot.per=0)
  
  rm(my_text)
  print("Finished Word cloud")
#}
