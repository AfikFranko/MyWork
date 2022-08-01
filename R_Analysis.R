#Q2_2
data <- read.csv("E:\\temp\\result107.csv" , header = F)
names(data) = c("Utilization",'enter_time','system_time','service_time','queuetime',"NumberOfReceptionist",'n_rep')

data$GoodService <- data$queuetime<0.50
unique(data$NumberOfReceptionist)

library('dplyr')
per_replication<- data %>% 
  group_by(n_rep) %>% 
  summarise(Number_Worker = mean(NumberOfReceptionist),
            system_time = mean(system_time),
            Utilization = (sum(service_time)/40)/Number_Worker,
                        Good_Service = mean(GoodService))


data_new <- data.frame(per_replication$Utilization,Utilization1)

summary.statistics = per_replication %>% 
  group_by(Number_Worker)%>%
  summarise(mean.GoodService = mean(Good_Service),
            mean.Utilization = mean(Utilization))
  
plot(y=summary.statistics$mean.GoodService,
     x=summary.statistics$mean.Utilization,
     ylab="mean time in the system",
     xlab="mean utilization")

lines(y=summary.statistics$mean.GoodService,
      x=summary.statistics$mean.Utilization)

text(y=summary.statistics$mean.GoodService,
     x=summary.statistics$mean.Utilization,
     labels=summary.statistics$Number_Worker,col="red")
arrows(x0 = 0.7,y0 = 0.5,x1 = 0.75,y1 = 0.5)
abline(v= 0.7)


#by the pareto we can assume we will take 8,9,10


#n_rep<- as.numeric(tapply(data$n_rep,data$n_rep,mean))
#Number_Worker <-as.numeric(tapply(data$NumberOfReceptionist,data$n_rep,mean))
#system_time<- as.numeric(tapply(data$system_time,data$n_rep,mean))
#Utilization <- as.numeric(tapply(data$service_time, data$n_rep, sum))/40
#Good_Service <- as.numeric(tapply(data$GoodService,data$n_rep,mean))

