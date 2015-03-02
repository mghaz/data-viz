#reading and assigning names to csv files
nmis <- read.csv("Health_Mopup_and_Baseline_NMIS_Facility.csv")
lgas <- read.csv("lgas.csv")
#merge the two files by unique_lga to match lga-level data to NMIS facilities data
merged <- merge(nmis , lgas, by="unique_lga")
#create a subset of the observations in southern provinces
southern <- merged[ which(merged$zone=='Southwest'| merged$zone=='South-South'| merged$zone== 'Southeast'), ]
#assign the southern data.set for manipulation with attach function 
attach(southern)
#create a table of nurses by state
nursetable <- table(state, num_nurses_fulltime)
#create easy-to-read results of total nurses by state with the margin.table function
nursetablesum <- margin.table(nursetable, 1)
#print nursetablesum 
nursetablesum
#create a table of nurse midwifes
midwifetable <- table(state, num_nursemidwives_fulltime)
#create easy-to-read results of total midwives by state with margin.table function

#create a table of total  by state with the table function
doctortable <- table(state, num_doctors_fulltime)
#create easy-to-read results of total doctor by state with the margin.table function
doctortablesum <- margin.table(doctortable, 1)
#print doctortablesum
doctortablesum
