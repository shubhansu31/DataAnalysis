source("complete.R");

corr<- function(directory,threshold=0){
  
  
  observations <- complete(directory);
  filter_observations <- subset(observations , observations$nobs>threshold);
  
  directory<- paste(getwd(),"/","specdata","/",sep="");
  
  file_list <- list.files(directory);
  correlation <- vector();
  
  for(i in filter_observations$id){
  
    file_dir <- paste(directory,file_list[i],sep="");
    file_data <- read.csv(file_dir);
    file_data <- subset(file_data,complete.cases(file_data));
    correlation <- c(correlation,cor(file_data$nitrate,file_data$sulfate));
  }
  correlation;
}