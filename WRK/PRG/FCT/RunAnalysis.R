ReadInhab <- function(nDpt) {
  Habtxt = readLines(file.path(DAT_DIR,"habitants.csv"), warn = FALSE)
  lineToRead = grep(paste("^",nDpt,sep=""),Habtxt)
  HabLine = read.csv(text=Habtxt[lineToRead],sep=";",header=FALSE)
  Hab = as.integer(HabLine[2])
  Hab #return number of inhabitants
}


#Run analysis launch analysis over a dataframe
#
#hospitalisation
#reanimation
#return home
#deaths

RunAnalysis <- function(Dfull, Dpt, nDpt, InPrct){
  
  if (missing(InPrct)) {InPrct=FALSE}
  
  # Read number of habitants of department
  if (nDpt!=0) {
    Habtxt = readLines(file.path(DAT_DIR,"habitants.csv"), warn = FALSE)
    lineToRead = grep(paste("^",nDpt,sep=""),Habtxt)
    HabLine = read.csv(text=Habtxt[lineToRead],sep=";",header=FALSE)
    Hab = as.integer(HabLine[2])
  } else {
    df = read.csv(file.path(DAT_DIR,"habitants.csv"),sep=";")
    Hab = sum(df$hab)
  }
  
  #Scale (y Max)
  if (InPrct) {
    #Hosp
    #find worse department
    DptMax = Dfull[which(Dfull$hosp==max(Dfull$hosp)),]
    #find population of this department
    HabMax = ReadInhab(DptMax$dep)/100000  #Patients per 100 000 habitants
    #Set scale
    HospScale = c(0,DptMax$hosp/HabMax)
    
    #Rea
    #find worse department
    DptMax = Dfull[which(Dfull$rea==max(Dfull$rea)),]
    #find population of this department
    HabMax = ReadInhab(DptMax$dep)/100000  #Patients per 100 000 habitants
    #Set scale
    ReaScale = c(0,DptMax$rea/HabMax)
    
    #Rad
    #find worse department
    DptMax = Dfull[which(Dfull$rad==max(Dfull$rad)),]
    #find population of this department
    HabMax = ReadInhab(DptMax$dep)/100000  #Patients per 100 000 habitants
    #Set scale
    RadScale = c(0,DptMax$rad/HabMax)
    
    #DC
    #find worse department
    DptMax = Dfull[which(Dfull$dc==max(Dfull$dc)),]
    #find population of this department
    HabMax = ReadInhab(DptMax$dep)/100000  #Patients per 100 000 habitants
    #Set scale
    DCscale = c(0,DptMax$dc/HabMax)
    
  } else {
    HospScale = {}
    ReaScale = {}
    RadScale = {}
    DCscale = {}
  }
  
  #Init
  if ((Dpt == "France") | (nDpt == 0)) {
    DDpt = Dfull                            #select all France
  } else {
    DDpt = Dfull[which(Dfull$dep==nDpt),]   #select departement
  }
  DDpt = aggregate(. ~ jour, DDpt, sum)   #aggregate by this department
  D = DDpt
  
  #Run analysis
  plotHosp(D,Dpt,HospScale, Hab)
  plotRea(D,Dpt,ReaScale, Hab)
  plotRad(D,Dpt,RadScale, Hab)
  plotDC(D,Dpt,DCscale, Hab)
}